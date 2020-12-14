create table project_info(
    project_id number(20) primary key,
    member_email varchar2(50),
    project_title varchar2(20),
    project_main_image varchar2(100),
    project_summary varchar2(100),
    project_tag varchar2(30),
    project_target_price number(30),
    project_reg_date date default sysdate,
    project_release_date date,
    project_total_days date,
    project_deadline date,
    project_like number(30),
    project_current_donated number(30),
    project_current_percent number(30),
    project_main_category varchar2(30),
    project_sub_category varchar2(30)
);

create sequence project_info_seq;

alter table project_info
add constraints fk_member_email foreign key(member_email)
references member_info(member_email) on delete cascade;

////////////////////////////////////////////////////////

create table project_gift_list(
project_id number(20),
project_gift_price number(20),
project_gift varchar2(50),
FOREIGN KEY (project_id) REFERENCES project_info (project_id)
);
