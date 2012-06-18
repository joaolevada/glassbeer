create generator gen_glassbeer;

create table ModelClasses (
  Id bigint not null,
  ObjectClassName varchar(32));

alter table ModelClasses add constraint PK_ModelClasses
  primary key (Id);

create table TBasicUserRecordData (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  Code varchar(20) character set UTF8 collate UNICODE_CI,
  Name varchar(40) character set UTF8 not null collate UNICODE_CI,
  Remarks blob sub_type 1);

alter table TBasicUserRecordData add constraint PK_TBasicUserRecordData
  primary key (Id);

create table TRawMaterial (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  BasicUserRecordData bigint,
  Unity smallint,
  MinimumStock double precision,
  MaximumStock double precision);

alter table TRawMaterial add constraint PK_TRawMaterial
  primary key (Id);

alter table TBasicUserRecordData add constraint FK_TBasicUserRecordData_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table TRawMaterial add constraint FK_TRawMaterial_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table TRawMaterial add constraint FK_TRawMaterial_BasicURD
  foreign key (BasicUserRecordData)
  references TBasicUserRecordData (Id)
  on delete no action
  on update cascade;

