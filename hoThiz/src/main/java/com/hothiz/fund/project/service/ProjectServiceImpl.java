package com.hothiz.fund.project.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Locale.Category;

import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.client.support.HttpAccessor;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hothiz.fund.member.dto.MemberDTO;
import com.hothiz.fund.member.dto.Member_alarmDTO;
import com.hothiz.fund.member.dto.Member_likeDTO;
import com.hothiz.fund.member.dto.Member_messageDTO;
import com.hothiz.fund.project.dao.ProjectDAO;
import com.hothiz.fund.project.dto.ProjectParamDTO;
import com.hothiz.fund.project.dto.ProjectStateDTO;

import com.hothiz.fund.project.dto.ProjectAlarmCountDTO;
import com.hothiz.fund.project.dto.ProjectBannerDTO;
import com.hothiz.fund.project.dto.ProjectDateDTO;
import com.hothiz.fund.project.dto.ProjectGiftDTO;
import com.hothiz.fund.project.dto.ProjectInfoDTO;
import com.hothiz.fund.project.dto.ProjectPagingDTO;


@Service
public class ProjectServiceImpl implements ProjectService {

   @Autowired
   ProjectDAO dao;

   
   //배너에 넣을 프젝 번호 넣으면 됨
   
   public ProjectBannerDTO setBannerProjectId(int b1,int b2,int b3) {
      ProjectBannerDTO banDto = new ProjectBannerDTO();
        banDto.setBanner1(b1);
         banDto.setBanner2(b2);
         banDto.setBanner3(b3);
      
      return banDto;
      
      
   }
   
   //메인에 뿌려줄 프로젝트 목록
   @Override
   public void getMainProjectList(Model model, HttpSession session) {
      System.out.println("메인페이지 가지러옴.");
      
      //페이지 셋팅
      ProjectPagingDTO pageDto = new ProjectPagingDTO();
      pageDto.setPER_PAGE_PROJECT(8);
      pageDto.setStartRownum();
      pageDto.setEndRownum(); //게시글 당 8개씩만

      String userId = (String)session.getAttribute("userId");
      
      ProjectParamDTO paramDto = null;
      
      
      
      //1.sort = popular
      paramDto = new ProjectParamDTO();
      paramDto.setting();
      paramDto.setSort("popular");
      paramDto.setOngoing("ongoing");

     
     ArrayList<ProjectInfoDTO> prjList = dao.getParamProjectList(paramDto, pageDto);
      for(ProjectInfoDTO p : prjList) {
         p.setCategory_trans(setCate(p.getProject_sub_category()));
      }
      model.addAttribute("popularList",prjList);   
      System.out.println("popular 완료");
      
     
      
      //2.sort = EndedAt
      paramDto = new ProjectParamDTO();
      paramDto.setting();
      paramDto.setSort("endedAt");
      paramDto.setMinAchieveRate(80);paramDto.setMaxAchieveRate(99);
     
      
      ArrayList<ProjectInfoDTO> endList =dao.getParamProjectList(paramDto, pageDto);
      for(ProjectInfoDTO p : endList) {
         p.setCategory_trans(setCate(p.getProject_sub_category()));
      }
      
      model.addAttribute("endedAtList",endList);       
      System.out.println("endedAt 완료");
      
      
      //3.sort = publishedAt
      paramDto = new ProjectParamDTO();
      paramDto.setting();
      paramDto.setSort("publishedAt");
      
     
      ArrayList<ProjectInfoDTO> puList =dao.getParamProjectList(paramDto, pageDto);
      for(ProjectInfoDTO p : puList) {
         p.setCategory_trans(setCate(p.getProject_sub_category()));
      }
      
      model.addAttribute("publishedAtList",puList);       

      
      
      System.out.println("sort 완료");
      
      
      //4.ongoing=prelaunching
      paramDto = new ProjectParamDTO();
      paramDto.setting();
      paramDto.setOngoing("prelaunching");
      
     
      System.out.println("프리런치 완료");
      ArrayList<ProjectInfoDTO> preList =dao.getParamProjectList(paramDto, pageDto);
      for(ProjectInfoDTO p : preList) {
         p.setCategory_trans(setCate(p.getProject_sub_category()));
      }
      
      model.addAttribute("prelaunchingList",preList);       

      
      
      
      
      model.addAttribute("alarmList",alarmProjectList(session, paramDto));
      
      System.out.println("alarmList 완료");
      
      //배너변경
      ProjectBannerDTO banDto =  setBannerProjectId(53, 55, 51);

      ArrayList<ProjectInfoDTO> list = dao.getBannerProject(banDto);
      System.out.println("배너 완료");
      
      
      Map<String, Map<String,String>> map = new HashMap<>();
      Map<String,String> prj =null;

      int idx = 0;
      
      for(ProjectInfoDTO dto : list) {
         System.out.println("배너이미지 이름"+dto.getProject_main_image());
         String key = "banner"+idx;
         prj = new HashMap<String, String>();
         prj.put("project_id", Integer.toString(dto.getProject_id()));
         prj.put("project_main_image", dto.getProject_main_image());
         prj.put("project_title",dto.getProject_title());
         prj.put("project_summary",dto.getProject_summary());
         prj.put("member_email", dto.getMember_email());
         map.put(key, prj);
      
         idx++;
      }

      //배너에 들어갈 프로젝트
      model.addAttribute("bannerMap", map );
      System.out.println("배너 맵 = " + map);
      paramDto = new ProjectParamDTO();
      paramDto.setting();
      //좋아요 상태
      model.addAttribute("likeList",likeProjectList(session, paramDto) );
      
   
   
      
      //프로젝트 id와 묶자,,
      //유저 네임
      ArrayList<MemberDTO> memberList = dao.getMemberInfoList();
      ArrayList<ProjectInfoDTO> pprjList = dao.getAllProjectList();
      Map<Integer, Map<String,String>> memberMap = new HashMap<>();
      Map<String, String> detailMap = null;
      
      for(ProjectInfoDTO pro : prjList) {
         for(MemberDTO mem : memberList) {
         
            if(mem.getMember_email() !=null && pro.getMember_email() !=null&& pro.getMember_email().equals(mem.getMember_email())) { 
               detailMap = new HashMap<String, String>();
               //해당 프로젝트의 멤버를 찾았으면 이메일,닉네임, url 보내줌
               detailMap.put("member_email", mem.getMember_email());
               detailMap.put("member_name",mem.getMember_name());
               detailMap.put("member_url", mem.getMember_URL());
            }
            
            memberMap.put(pro.getProject_id(), detailMap);
            
         }
         
         
      }
      
      model.addAttribute("memberMap",memberMap);
      
      model.addAttribute("alarmCntMap", getAlarmCountList());
      
      
      
   }
   
   //전체글 갯수..(첫 리스트 화면)
   
   @Override
   public int getAllProjectsCnt() {
      return dao.getAllProjectCnt();
   }
   
   //프로젝트 갯수
   @Override
   public int getProjectsCnt(ProjectParamDTO paramDto) {
      
      int cnt=0;
      
      if(paramDto.getOngoing().equals("prelaunching")) {
         cnt = dao.getPreProjectsCnt();
      } else {
         cnt = dao.getProjectsCnt(paramDto);
      }
      

      
      return cnt;
   }
   
   //프로젝트 리스트 얻어오기~
   @Override
   public ArrayList<ProjectInfoDTO> getParamProjectList(ProjectParamDTO paramDto) {
      
      ProjectPagingDTO pageDto = new ProjectPagingDTO(0);
      int currentMoney = paramDto.getCurrentMoney();
      int achieveRate = paramDto.getAchieveRate();
      String sort = paramDto.getSort();
      String onString = paramDto.getOngoing();
      ArrayList<ProjectInfoDTO> projectList = null;
      
      
         paramDto.setting();
         projectList = dao.getParamProjectList(paramDto, pageDto);   
   
      for(ProjectInfoDTO p : projectList) {
         p.setCategory_trans(setCate(p.getProject_sub_category()));

      }
      


      
      /*
      System.out.println("파람 가지러왔다");
      System.out.println("어치브비율값:"+paramDto.getAchieveRate());
      System.out.println("최저퍼센트"+paramDto.getMinAchieveRate());
      System.out.println("최대퍼센트"+paramDto.getMaxAchieveRate());
      System.out.println(paramDto.getCategory());
      System.out.println("쿼리"+paramDto.getQuery());
      System.out.println("지금돈"+paramDto.getCurrentMoney());
      System.out.println("최대머니:"+paramDto.getMaxMoney());
      System.out.println("최저머니:"+paramDto.getMinMoney());

      System.out.println(paramDto.getOngoing());
      System.out.println(paramDto.getSort());
      */
      
      
      // 페이지 셋팅(db에 넘겨줄 start,end 값)
      
      // select값 넣는 list
      
      
      //Map으로 포장해줄거임;
      /*
        project id : { 
                     project_
                       project_title :
                     project_title :
                     project_summary : 
                     project_current_money :
                     project_sub_tag :
                      member_name : ______
                       member_profile : ____________
                       member_
                    } 
       
       */
      

      
      //System.out.println(dao.countProjects(paramDto));
      
      //System.out.println(dao.countProjectList(paramDto));
      
      
      return projectList;
   }
   
   public Map<Integer,Integer> getDonatedCntMap() {
      /*
        프젝 id : 후원자 수,
       */
      //어차피 변수명 똑같애서 dto돌려씀..
      ArrayList<ProjectAlarmCountDTO> cntList = dao.getDonatedCntList();
      Map<Integer, Integer> donatedCntMap = new HashMap<Integer, Integer>();
      
      for(ProjectAlarmCountDTO dto : cntList ) {
         donatedCntMap.put(dto.getProject_id(), dto.getCount());
      }
      
      
      return donatedCntMap;
   }
   
   


   //비동기로 가져오기
   @Override
   public String syncGetData(ProjectParamDTO paramDto, HttpSession session) {

      
      // 페이지 셋팅
      ProjectPagingDTO pageDto = new ProjectPagingDTO(paramDto.getPage());
      
      paramDto.setting();
      
      //day에 대한 정보 가져오는 맵
      Map<Integer, ProjectDateDTO> dDayMap = getDDayMap();
      
      //멤버 정보들.
      ArrayList<MemberDTO> memberList = dao.getMemberInfoList();
      
      //좋아하는 게시글, 알람신청하는 게시글.
      ArrayList<Integer> likeList = likeProjectList(session, paramDto);
      ArrayList<Integer> alarmList = alarmProjectList(session, paramDto);
      
      //게시글 목록..
      ArrayList<ProjectInfoDTO> prjList = dao.getParamProjectList(paramDto, pageDto);
      //map..뽑아낼수있게 키값을 넣어줄거임..
      
      for(ProjectInfoDTO p : prjList) {
         p.setCategory_trans(setCate(p.getProject_sub_category()));
         
         
      }
      

      
      Map<String, Object> map = new HashMap<>();
      
      map.put("day", dDayMap);
      map.put("member", memberList);
      map.put("prj", prjList);
      map.put("likeList", likeList);
      map.put("alarmList", alarmList);
      map.put("donCnt", getDonatedCntMap());
      
      

      return jsonMapper(map);
   }
   
   //알람 리스트
   public ArrayList<Integer> alarmProjectList(HttpSession session, ProjectParamDTO paramDto){
      paramDto.setting();
      String state = paramDto.getOngoing();
      
      ArrayList<Integer> list = null;
      
      String userId = (String)session.getAttribute("userId"); //세션 확인. 이거 1대신 넣어주기
      
      if(userId!=null) {
         list = dao.getAlarmProjectList(userId);
      } else {
         list = new ArrayList<Integer>();
      }
      
      
      
      
      return list;
      
   }
   
   
   
   //해당 게시글의 좋아요 유무 확인을 위한 리스트
      @Override
      public ArrayList<Integer> likeProjectList(HttpSession session, ProjectParamDTO paramDto) {
         //이거 맵에 해도 될거같긴 한데,,,
         
         paramDto.setting();
         String state = paramDto.getOngoing();

      
         String userId = (String)session.getAttribute("userId"); //세션 확인. 이거 1대신 넣어주기
         
         
         
         ArrayList<Integer> list = null;

         
            //진행중인 펀딩이므로 좋아요 목록을 가져온다.
         if(userId!=null) {   
            list = dao.getLikeProjectList(userId);
         } else {
            list = new ArrayList<Integer>();
         }

         
         return list;
      }
      
      
      
      //멤버 정보 리스트(게시글 리스트에서 닉네임 뽑아내야됨)
      //멤버 뽑아서..map으로 넣을까 싶다... key는 프젝아디로...그럼 jsp서 걍 뽑아낼수 있잖아...
      //이거 오버플로 터짐
      /*
         @Override
         public Map<Integer, MemberDTO> getPrjMemberInfoMap() {      
            ArrayList<MemberDTO> list =  dao.getMemberInfoList();
            ArrayList<ProjectInfoDTO> prjList = dao.getAllProjectList();
            Map<Integer, MemberDTO> map = new HashMap<>();
            //project_info의 member_email과 일치하면 -> pj_id : mebmerDTO 일케 묶기
            for (ProjectInfoDTO dto : prjList) {
               for(MemberDTO mDto : list) {
                  if(dto.getMember_email().equals(mDto.getMember_email())) {
                     map.put(dto.getProject_id(), mDto);
                  }
               }
            }   
            return map;
            
         }
         */
         
         
      //남은날짜 리스트
         @Override
         public Map<Integer, ProjectDateDTO> getDDayMap(){ 
            Map<Integer, ProjectDateDTO> map = new HashMap<>();
            ArrayList<ProjectDateDTO> list = dao.getDDayList();
            
         //키는 id..
            for(ProjectDateDTO dto : list) {
               map.put(dto.getProject_id(), dto);
            }
            
            return map;
         }
         
      
      ///////////////////////////////////////////////////////////////////////////



   //좋아요 처리하는 메소드
   @Override
   public String chkLike(Member_likeDTO likeDto) {
      //likeDto에는 project_id와 member_email이 들어있음.
      
      String msg = "like"; //하트가 체크된 상태를 표시. 뷰단으로 리턴할 것.
      String member_email = likeDto.getMember_email();
      int project_id = likeDto.getProject_id();

      System.out.println("기존 라이크:"+dao.getAProject(project_id).getProject_like());
      
      
      //한 멤버의 좋아요 한 프로젝트 목록. 해당 프젝을 이미 좋아요한 경우 1 반환 아니면 0
      int chk = dao.chkMemberLike(likeDto);
      
      
      
      if(chk==1) { //이미 좋아요 했던 프로젝트인 경우
         //좋아요 취소 로직 실행.
         System.out.println("좋아요 취소할거임");
         dao.setCancelLikeMember(likeDto); //좋아요 한 프젝 없앰
         dao.setCancelLikeProject(project_id); //좋아요 -1
         msg = "cancelLike"; //취소했으니 캔슬라이크
         System.out.println("취소한 후 라이크:"+dao.getAProject(project_id).getProject_like());
         
         
      } else {//좋아요 안한 프로젝트인경우
         System.out.println("좋아요 하겠읍니다");
         //만약 좋아요를 첨 누른 회원이라면 member_like 테이블에 없을 것임.
         //그걸 판별해서 두개의 sql문을 사용해야 할듯..
         
         dao.setLikeMember(likeDto);
         dao.setLikeProject(project_id);
         System.out.println("좋아요한후 라이크:"+dao.getAProject(project_id).getProject_like());
      }   
      
      System.out.println(msg);
      
      
      return jsonMapper(msg);
      
   }
   
   @Override
   public Map<Integer, Map<String,String>> getMemberInfoList() {
      
      
      ArrayList<MemberDTO> memberList = dao.getMemberInfoList();
      ArrayList<ProjectInfoDTO> prjList = dao.getAllProjectList();
      Map<Integer, Map<String,String>> memberMap = new HashMap<>();
      Map<String, String> detailMap = null;
      
      for(ProjectInfoDTO pro : prjList) {
         for(MemberDTO mem : memberList) {
         
            if(mem.getMember_email() !=null && pro.getMember_email() !=null&& pro.getMember_email().equals(mem.getMember_email())) { 
               detailMap = new HashMap<String, String>();
               //해당 프로젝트의 멤버를 찾았으면 이메일,닉네임, url 보내줌
               detailMap.put("member_email", mem.getMember_email());
               detailMap.put("member_name",mem.getMember_name());
               detailMap.put("member_url", mem.getMember_URL());
            }
            
            memberMap.put(pro.getProject_id(), detailMap);
            
         }
         
         
      }
      
      
      return memberMap;
   }



   
   
   //알림처리하는 매소드===========================
   public String chkAlarm(Member_alarmDTO alarmDto) {

      //String userId = (String)session.getAttribute("userId");
      boolean flag = false;
      String msg = "alarm"; //알람신청한 상태
      
      //alarmDto.setMember_email(userId);
    
      System.out.println(alarmDto.getMember_email());
      System.out.println(alarmDto.getProject_id());
      //한 멤버의 알림 프로젝트 목록
      int chk = dao.chkMemberAlarm(alarmDto);
      
      if(chk==1) { //이미 알림신청 프로젝트인 경우
         //좋아요 취소 로직 실행.
         System.out.println("알림 취소");
         dao.setCancelAlarm(alarmDto);
         msg = "cancelAlarm"; //취소했으니 캔슬라이크
         //알람 테이블에서 delete               
         System.out.println("취소한 후(0이면 알림취소된거) : "+dao.chkMemberAlarm(alarmDto));
         
         
      } else {//좋아요 안한 프로젝트인경우
         System.out.println("알림 신청");
         dao.setAlarm(alarmDto);
         System.out.println("알림신청(1이면 알림된거) : "+dao.chkMemberAlarm(alarmDto));
      }   
      
      
      
      
      return jsonMapper(msg);
   }
   

   
   
   ////////////////////////////게시글 상세보기 필요 객체들///////////////////////////
   
   
   //게시글 상세정보
   @Override
   public ProjectInfoDTO getAProjectDetail(int project_id) {
      SimpleDateFormat credit = new SimpleDateFormat("yyyy년 MM월 dd일");
      
      
      ProjectInfoDTO dto = dao.getAProject(project_id);
      String date = credit.format(dto.getProject_deadline());
      
      dto.setProject_date_string(date);
      System.out.println(date);

      return dto;   
   }
   //한 멤버 디테일(프로필 정보)
   @Override
   public MemberDTO getAMemberDetail(String member_email) {
      return dao.getAMemberInfo(member_email);
   }
   
   //프로젝트 기프트
   public ArrayList<Map<String,String>> getAProjectGift(int project_id){
      /*{
            {gift_id : #{gift_id} 
                          gift : #{project_gift}, 
                           price : #{기프트 가격}},
           #{기프트 번호2} : {기프트2 설명, 기프트2 가격}...
        }
       */
      
      ArrayList<Map<String,String>> list = new ArrayList<Map<String,String>>();
      ArrayList<ProjectGiftDTO> giftList = dao.getAProjectGift(project_id);
      Map<String, String> detail = null;
         
         
      for(ProjectGiftDTO dto : giftList) {
         detail = new HashMap<>();
         detail.put("gift_id", Integer.toString(dto.getGift_id()));
         detail.put("gift", dto.getProject_gift());   
         detail.put("price", Integer.toString(dto.getProject_gift_price()));   
         
         list.add(detail);
      }
      
      return list;
      
      
   }
   
   //해당 프로젝트의 기프트 id를 반환
   @Override
   public ArrayList<Integer> getAProjectGiftId(int project_id){
      
      ArrayList<Integer> giftIdList = dao.getAProjectGiftId(project_id);
      return giftIdList;
   }
   
   
   public Map<Integer, Map<String, String>> getMoreProject(int project_id,HttpSession session){
      ProjectInfoDTO dto = dao.getAProject(project_id);
      String project_sub_category= dto.getProject_sub_category();

      
      ArrayList<ProjectInfoDTO> prjList = dao.getMoreProject(project_sub_category);
      String userId = (String)session.getAttribute("userId");
      
      
      for(ProjectInfoDTO p : prjList) {
         p.setCategory_trans(setCate(p.getProject_sub_category()));
      }
        
      
   
      Map<Integer, Map<String, String>> map = new HashMap<>(); //큰맵
      Map<String, String> detail = null; //작은 맵
      ArrayList<Integer> likeList = null;
      
      
      
      
      for(ProjectInfoDTO prj : prjList) {
         detail = new HashMap<>();
         MemberDTO memberDto = dao.getAMemberInfo(prj.getMember_email());
         
         if(userId!=null) {
            likeList = dao.getLikeProjectList(userId);
         }else {
            likeList = new ArrayList<Integer>();
         }
         detail.put("project_id", Integer.toString(prj.getProject_id()));
         detail.put("project_main_image", prj.getProject_main_image());
         detail.put("project_title", prj.getProject_title());
         detail.put("project_summary", prj.getProject_summary());
         detail.put("project_sub_cateogry",prj.getProject_sub_category());
         detail.put("project_current_percent",Integer.toString(prj.getProject_current_percent()));
         detail.put("member_name",prj.getMember_name());
         detail.put("member_email",prj.getMember_email());
         detail.put("category_trans",prj.getCategory_trans());
   
         
         if(userId!=null) {
            for(Integer likeId : likeList) {
               if(prj.getProject_id()==likeId) { //좋아하는 목록에 있으면
                  detail.put("project_like", "cancelLike");
               } else {
                  detail.put("project_like", "like");
               }
            }
         }
         
         map.put(prj.getProject_id(), detail);
         
      }
      
      
      
      return map;
      
      
   }
   

   
   /////1. 진행중인 펀딩
   
   //후원자 몇명인지 세부내용에서 출력해야됨.
   @Override
   public int getDonatedMemCount(int project_id) {
      return dao.getDonatedMemberCnt(project_id);
   }
   
   /////2. 프리런칭인 펀딩
   
   //세부에서 필요한 날짜(~~공개예정)
   public ProjectDateDTO getADDay(int project_id) {
      return dao.getADDay(project_id);
   }
   
   
   
   //알람신청한 인원
   public int getAlarmMemCount(int project_id) {
      return dao.getAlarmMemCount(project_id);
   }
   
   
   //프로젝트 별 알람 인원
   public Map<Integer, Integer> getAlarmCountList(){
      
      ArrayList<ProjectAlarmCountDTO> prjList = dao.getAlarmCountList();
      
      Map<Integer, Integer> alarmCntMap = new HashMap<>();

      
      for(ProjectAlarmCountDTO pro : prjList) {
         alarmCntMap.put(pro.getProject_id(), pro.getCount());
      }
      
      
      
      return alarmCntMap;
      
   }
   
   
   
   
   public String getMemberList() {
      
     ArrayList<MemberDTO> list = dao.getMemberList();
     Map<String, String> map = new HashMap<String, String>();
     
     for(MemberDTO dto : list) {
        map.put(dto.getMember_email(), dto.getMember_name());
     }
     
     
     
     return jsonMapper(map);
   }
   
   
   
   
   public String setCate(String category) {
      if(category == null) {
            return "";
         }else if(category.equals("game")) {
            return "게임";
         }else if(category.equals("mobile-game")) {
            return "게임/모바일게임";
         }else if(category.equals("video-game")) {
            return "게임/비디오게임";
         }else if(category.equals("board-game")) {
            return "게임/보드게임";
         }else if(category.equals("show")) {
            return "공연";
         }else if(category.equals("dance")) {
            return "공연/무용";
         }else if(category.equals("musical")) {
            return "공연/뮤지컬";
         }else if(category.equals("theater")) {
            return "공연/연극";
         }else if(category.equals("design")) {
            return "디자인";
         }else if(category.equals("architecture")) {
            return "디자인/건축, 공간";
         }else if(category.equals("graphic-design")) {
            return "디자인/그래픽 디자인";
         }else if(category.equals("product-design")) {
            return "디자인/제품 디자인";
         }else if(category.equals("comics")) {
            return "만화";
         }else if(category.equals("web-comics")) {
            return "만화/웹툰";
         }else if(category.equals("comic-books")) {
            return "만화/만화책";
         }else if(category.equals("art")) {
            return "예술";
         }else if(category.equals("exhibitions")) {
            return "예술/전시";
         }else if(category.equals("sculpture-and-action-figures")) {
            return "예술/조소, 피규어";
         }else if(category.equals("illustration")) {
            return "예술/일러스트레이션";
         }else if(category.equals("crafts")) {
            return "공예";
         }else if(category.equals("candles-and-diffusers-and-soaps")) {
            return "공예/캔들, 조향, 비누";
         }else if(category.equals("leather-and-metal-and-woodworking")) {
            return "공예/가죽, 금속, 목 공예";
         }else if(category.equals("pottery")) {
            return "공예/도예";
         }else if(category.equals("photography")) {
            return "사진";
         }else if(category.equals("people-photography")) {
            return "사진/인물";
         }else if(category.equals("space-and-urban-photography")) {
            return "사진/배경";
         }else if(category.equals("animals-photography")) {
            return "사진/동물";
         }else if(category.equals("video")) {
            return "영상";
         }else if(category.equals("film")) {
            return "영상/영화";
         }else if(category.equals("documentary")) {
            return "영상/다큐";
         }else if(category.equals("animation")) {
            return "영상/애니메이션";
         }else if(category.equals("music-videos")) {
            return "영상/뮤직비디오";
         }else if(category.equals("food")) {
            return "푸드";
         }else if(category.equals("appetizer")) {
            return "푸드/에피타이저";
         }else if(category.equals("main-dish")) {
            return "푸드/메인";
         }else if(category.equals("dessert")) {
            return "푸드/디저트";
         }else if(category.equals("music")) {
            return "음악";
         }else if(category.equals("classical-music")) {
            return "음악/클래식";
         }else if(category.equals("popular-music")) {
            return "음악/대중음악";
         }else if(category.equals("Independent-music")) {
            return "음악/인디음악";
         }else if(category.equals("publication")) {
            return "출판";
         }else if(category.equals("zines")) {
            return "출판/잡지";
         }else if(category.equals("literature-and-essay")) {
            return "출판/문학, 에세이";
         }else if(category.equals("picture-books")) {
            return "출판/그림책";
         }else if(category.equals("technology")) {
            return "테크";
         }else if(category.equals("software")) {
            return "테크/소프트웨어";
         }else if(category.equals("hardware")) {
            return "테크/하드웨어";
         }else if(category.equals("apps")) {
            return "테크/앱";
         }else if(category.equals("web")) {
            return "테크/웹";
         }else if(category.equals("fashion")) {
            return "패션";
         }else if(category.equals("apparels")) {
            return "패션/의류";
         }else if(category.equals("accessories")) {
            return "패션/악세서리";
         }else if(category.equals("beauty")) {
            return "패션/뷰티";
         }else if(category.equals("journalism")) {
            return "저널리즘";
         }else if(category.equals("audio-journals")) {
            return "저널리즘/오디오";
         }else if(category.equals("video-journals")) {
            return "저널리즘/비디오";
         }else if(category.equals("web-journals")) {
            return "저널리즘/웹(개인방송)";
         }
   
      return"";
   }
   
   
   
   
   //////////////////////////////////////////////////////



   //JSON으로 파싱하는 메소드(비동기시 필수)====================================
   public String jsonMapper(Object obj) {
      
      ObjectMapper mapper = new ObjectMapper();
      String jsonStr = null;

      try {
         jsonStr = mapper.writeValueAsString(obj);
      } catch (JsonProcessingException e) {
         
         e.printStackTrace();
      }
      
      return jsonStr;   
   }

   @Override
   public void sendMessage(Member_messageDTO msgDto) {
      dao.sendMessage(msgDto);
      
   }

   @Override
   public ArrayList<String> getDonatedMemberList(int project_id){
      
      ArrayList<String> list = dao.getDonatedMemberList(project_id);
      
      return list;
   }








   
   
   
   /// 멤버넣기.. 나중에 지우삼****

   /*
    * 
    * public String testList(int locatedPage){
    * 
    * ProjectPagingDTO dto = new ProjectPagingDTO();
    * dto.pagingSetting(locatedPage);
    * 
    * 
    * ArrayList<TestDTO> list = dao.testList(dto);
    * 
    * 
    * ObjectMapper mapper = new ObjectMapper(); String listJson = null;
    * 
    * 
    * try { listJson = mapper.writeValueAsString(list); } catch
    * (JsonProcessingException e) { System.out.println("testList 서비스 오류");
    * e.printStackTrace(); }
    * 
    * 
    * return listJson; }
    * 
    * 
    * public TestDTO selectOne(int project_id) {
    * 
    * TestDTO dto = dao.selectOne(project_id);
    * 
    * return dto; }
    * 
    * 
    */

}