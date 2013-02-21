create table TAccountChart (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  BasicUserRecordData bigint,
  ChildOf bigint,
  Level integer,
  Balance decimal(14,4),
  ShortCode integer);

alter table TAccountChart add constraint PK_TAccountChart
  primary key (Id);

alter table TAccountChart add constraint FK_TAccountChart_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table TAccountChart add constraint FK_TAccountChart_BasicUserRecordData
  foreign key (BasicUserRecordData)
  references TBasicUserRecordData (Id)
  on delete no action
  on update cascade;

alter table TAccountChart add constraint FK_TAccountChart_ChildOf
  foreign key (ChildOf)
  references TAccountChart (Id)
  on delete no action
  on update cascade;
  
update glassconfig set dbversion = 6;