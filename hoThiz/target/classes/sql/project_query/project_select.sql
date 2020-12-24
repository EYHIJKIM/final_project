select * from project_info
WHERE 
  case WHEN #{param.ongoing} != 'confirm' THEN sysdate
       WHEN #{param.ongoing} = 'confirm' THEN project_deadline
  END <
    case when #{param.ongoing} = 'ongoing' THEN project_deadline
         when #{param.ongoing} = 'prelaunching' THEN project_release_date
         when #{param.ongoing} = 'confirm' THEN sysdate
    END
AND
   project_current_percent BETWEEN #{param.minAchieveRate} and
     case WHEN #{param.achieveRate} = 3 THEN (select max(project_current_percent) from project_info)
          WHEN #{param.achieveRate} != 3 THEN #{param.maxAchieveRate}
     END 
     
AND
     project_current_donated BETWEEN #{param.minMoney} and 
     case when #{param.currentMoney}=5 or #{param.currentMoney}=0 then (select max(project_current_donated) from project_info)
          when #{param.currentMoney}!=5 then #{param.MaxMoney}
     END
;

SELECT complete.*
FROM (
    SELECT rownum rn, condition.* 
    FROM(
            SELECT sort.* FROM(
                SELECT *
                FROM project_info
                ORDER BY 
                    case when #{param.sort} = 'publishedAt' THEN project_id
                         when #{param.sort} = 'popular' THEN project_like
                         when #{param.sort} = 'amount' THEN project_current_donated
                    END desc,
                    case when #{param.sort} = 'endedAt' THEN project_deadline end asc
            )sort 
    )condition
            
            WHERE 
              case when #{param.ongoing} = 'ongoing' then sysdate
                   WHEN #{param.ongoing} = 'prelaunching' THEN sysdate
                   WHEN #{param.ongoing} = 'confirm' THEN project_deadline
              END <
                case when #{param.ongoing} = 'ongoing' THEN project_deadline
                     when #{param.ongoing} = 'prelaunching' THEN project_release_date
                     when #{param.ongoing} = 'confirm' THEN sysdate
                END
            AND
               project_current_percent BETWEEN #{param.minAchieveRate} and
                 case WHEN #{param.achieveRate} = 3 or (#{param.achieveRate}=0 and #{param.maxAchieveRate}=0) THEN (select max(project_current_percent) from project_info)
                      ELSE #{param.maxAchieveRate}
                 END 
                 
            AND
                 project_current_donated BETWEEN #{param.minMoney} and 
                 case when #{param.currentMoney}=5 or (#{param.currentMoney}=0 and #{param.maxMoney}=0) THEN (select max(project_current_donated) from project_info)
                      ELSE #{param.maxMoney}
                 END
)complete
WHERE rn BETWEEN #{page.startRownum} AND #{page.endRownum}
