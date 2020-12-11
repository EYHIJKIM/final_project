create table project_info(
	project_id number(4) primary key,
	member_email varchar2(50),
	project_title varchar2(20),
	project_main_image varchar2(100),
	project_summary varchar2(100),
	project_tag varchar2(30),
	project_target_price number(30),
	project_reg_date date default sysdate,
	project_release_date date,
	project_total_days date
	project_deadline date,
	project_like number(30),
	project_current_donated number(100),
	project_current_percent number(100),
	project_main_category varchar2(30),
	project_sub_category varchar2(30)
);


create sequence project_info_seq;

alter table info_project
add constraints FK_MEMBER_EMAIL foreign key(member_email)
references member_email(member_email) on delete cascade;