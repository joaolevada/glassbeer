create table MshIt_GravLog (
  Id bigint not null,
  MshItId bigint not null,
  GravLogId bigint not null,
  ItemPos integer not null);

alter table MshIt_GravLog add constraint PK_MshIt_GravLog
  primary key (Id);

  
create table MshIt_TempLog (
  Id bigint not null,
  MshItId bigint not null,
  TempLogId bigint not null,
  ItemPos integer not null);

alter table MshIt_TempLog add constraint PK_MshIt_TempLog
  primary key (Id);

create table TMashItemGravity (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  MeasuredAt timestamp,
  InputType smallint,
  SpecificGravity double precision,
  Brix double precision);

alter table TMashItemGravity add constraint PK_TMashItemGravity
  primary key (Id);

create table TMashItemTemperature (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  MeasuredAt timestamp,
  Temperature double precision);

alter table TMashItemTemperature add constraint PK_TMashItemTemperature
  primary key (Id);

alter table MshIt_GravLog add constraint FK_MshIt_GravLog_MshItId
  foreign key (MshItId)
  references MshIt (Id)
  on delete no action
  on update cascade;

alter table MshIt_GravLog add constraint FK_MshIt_GravLog_GravLogId
  foreign key (GravLogId)
  references TMashItemGravity (Id)
  on delete no action
  on update cascade;


alter table MshIt_TempLog add constraint FK_MshIt_TempLog_MshItId
  foreign key (MshItId)
  references MshIt (Id)
  on delete no action
  on update cascade;

alter table MshIt_TempLog add constraint FK_MshIt_TempLog_TempLogId
  foreign key (TempLogId)
  references TMashItemTemperature (Id)
  on delete no action
  on update cascade;


alter table TMashItemGravity add constraint FK_TMashItemGravity_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table TMashItemTemperature add constraint FK_TMashItemTemperature_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;


