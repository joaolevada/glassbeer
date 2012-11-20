create table MshIt_GeneralLog (
  Id bigint not null,
  MshItId bigint not null,
  GeneralLogId bigint not null,
  ItemPos integer not null);

alter table MshIt_GeneralLog add constraint PK_MshIt_GeneralLog
  primary key (Id);  
  
create table TGeneralLog (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  RemarkedAt timestamp,
  Remarks text);

alter table TGeneralLog add constraint PK_TGeneralLog
  primary key (Id);
  
alter table MshIt_GeneralLog add constraint FK_MshIt_GeneralLog_MshItId
  foreign key (MshItId)
  references MshIt (Id)
  on delete no action
  on update cascade;

alter table MshIt_GeneralLog add constraint FK_MshIt_GeneralLog_GeneralLogId
  foreign key (GeneralLogId)
  references TGeneralLog (Id)
  on delete no action
  on update cascade;

alter table TGeneralLog add constraint FK_TGeneralLog_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

create table glassconfig (
  id bigint not null,
  dbversion integer not null);
  
alter table glassconfig add constraint pk_glassconfig
  primary key (id);

insert into glassconfig (id, dbversion) values(1, 4);

alter sequence gen_glassbeer start with 50000;