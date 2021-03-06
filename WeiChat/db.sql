create table Account(
	userId varchar2(20) primary key,
	password varchar2(40) not null,
	phone varchar2(20) constraint uk_user_phone unique,
	email varchar2(20) not null,
	name varchar2(20),
	address varchar2(20),
	sex char(4),
	pic blob,
	remark1 varchar2(20),
	remark2 varchar2(20),
	remark3 varchar2(20)
);
alter table Account modify phone not null;
--alter table Account modify password varchar2(40);
--alter table Account modify phone varchar2(20);
--alter table Account add pic blob;
--alter table Account drop column birthday;

select * from account;

create table Friends(
	myselfId varchar2(20),
	friendId varchar2(20),
	remarkName varchar2(20),
	remark1 varchar2(20),
	remark2 varchar2(20),
	remark3 varchar2(20),
	primary key(myselfId, friendId)
);
alter table Friends add constraint fk_friend_account_myselfId foreign key(myselfId) references Account(userId);
alter table Friends add constraint fk_friend_account_friendId foreign key(friendId) references Account(userId);

insert into Friends values('yc', 'b', null, null, null, null);
insert into Friends values('yc', 'c', null, null, null, null);
insert into Friends values('yc', 'd', null, null, null, null);
insert into Friends values('yc', 'e', null, null, null, null);
insert into Friends values('yc', 'f', null, null, null, null);
insert into Friends values('yc', 'admin', null, null, null, null);

insert into Friends values('b', 'yc', null, null, null, null);


create table Groups(
	groupId varchar2(20) primary key,
	name varchar2(20) not null,
	remark1 varchar2(20),
	remark2 varchar2(20),
	remark3 varchar2(20)
);
alter table Groups modify adminName not null;
select * from friends;

alter table Groups rename column remark1 to adminName;
alter table Groups rename column remark2 to remark1;
alter table Groups rename column remark3 to remark2;
alter table Groups add constraint fk_groups_account_adminName foreign key(adminName) references Account(userId)


select * from Groups;
select * from Relation;

create table Relation(
	groupId varchar2(20),
	userId varchar2(20),
	remark1 varchar2(20),
	remark2 varchar2(20),
	remark3 varchar2(20),
	primary key(groupId, userId)
);
alter table Relation add constraint fk_relation_group_groupId foreign key(groupId) references Groups(groupId);
alter table Relation add constraint fk_relation_account_userId foreign key(userId) references Account(userId);
select * from Relation;

select * from user_tables;

insert into ACCOUNT values ('admin', '6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2', 
'18216026876', '11987688@qq.com', 'kui', '湖南长沙', '男', null, null, null, null);
insert into groups values ('111', '源程', 'yc', null, null);
insert into relation values ('111', 'yc', null, null, null);


drop table Relation;
drop table friends;
drop table groups;
drop table account;

