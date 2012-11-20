create table TEquipmentProfile (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  BasicUserRecordData bigint,
  GrainAbsorption double precision,
  EvaporationRate double precision,
  KettleToFermenterLoss double precision);

alter table TEquipmentProfile add constraint PK_TEquipmentProfile
  primary key (Id);

alter table TEquipmentProfile add constraint FK_TEquipmentProfile_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table TEquipmentProfile add constraint FK_TEquipmentProfile_BasicUserRecordData
  foreign key (BasicUserRecordData)
  references TBasicUserRecordData (Id)
  on delete no action
  on update cascade;
  
update glassconfig set dbversion = 5;