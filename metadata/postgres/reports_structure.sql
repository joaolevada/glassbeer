create table TRepGrp (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  ObjectClassName varchar(32));

alter table TRepGrp add constraint PK_TRepGrp
  primary key (Id);

create table TRepGrp_Reports (
  Id bigint not null,
  TRepGrpId bigint not null,
  ReportsId bigint not null,
  ItemPos integer not null);

alter table TRepGrp_Reports add constraint PK_TRepGrp_Reports
  primary key (Id);

create table TRepItem (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  Caption varchar(40),
  Visible boolean,
  ReportMetadata bytea);

alter table TRepItem add constraint PK_TRepItem
  primary key (Id);
  
alter table TRepGrp add constraint FK_TRepGrp_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table TRepGrp_Reports add constraint FK_TRepGrp_Reports_TRepGrpId
  foreign key (TRepGrpId)
  references TRepGrp (Id)
  on delete no action
  on update cascade;

alter table TRepGrp_Reports add constraint FK_TRepGrp_Reports_ReportsId
  foreign key (ReportsId)
  references TRepItem (Id)
  on delete no action
  on update cascade;

alter table TRepItem add constraint FK_TRepItem_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;
