/* PressObjects generated SQL */

create sequence gen_glassbeer;

create table Cont (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  BasicUserRecordData bigint,
  NickName varchar(40));

alter table Cont add constraint PK_Cont
  primary key (Id);

create table Cont_Addr (
  Id bigint not null,
  ContId bigint not null,
  AddrId bigint not null,
  ItemPos integer not null);

alter table Cont_Addr add constraint PK_Cont_Addr
  primary key (Id);

create table Cont_IntAddr (
  Id bigint not null,
  ContId bigint not null,
  IntAddrId bigint not null,
  ItemPos integer not null);

alter table Cont_IntAddr add constraint PK_Cont_IntAddr
  primary key (Id);

create table Cont_Phones (
  Id bigint not null,
  ContId bigint not null,
  PhonesId bigint not null,
  ItemPos integer not null);

alter table Cont_Phones add constraint PK_Cont_Phones
  primary key (Id);

create table FmtrEvnt (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  BasicUserRecordData bigint,
  Duration integer,
  Temperature double precision);

alter table FmtrEvnt add constraint PK_FmtrEvnt
  primary key (Id);

create table IntAddr (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  Label bigint,
  Address varchar(80));

alter table IntAddr add constraint PK_IntAddr
  primary key (Id);

create table IntAddrLab (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  BasicUserRecordData bigint);

alter table IntAddrLab add constraint PK_IntAddrLab
  primary key (Id);

create table ModelClasses (
  Id bigint not null,
  ObjectClassName varchar(32));

alter table ModelClasses add constraint PK_ModelClasses
  primary key (Id);

create table MsFmtIt (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  Fermenter bigint,
  Volume double precision,
  StartDate date,
  DaysSinceStart integer,
  DaysSinceLastEvent integer);

alter table MsFmtIt add constraint PK_MsFmtIt
  primary key (Id);

create table MsFmtIt_FmtEvts (
  Id bigint not null,
  MsFmtItId bigint not null,
  FmtEvtsId bigint not null,
  ItemPos integer not null);

alter table MsFmtIt_FmtEvts add constraint PK_MsFmtIt_FmtEvts
  primary key (Id);

create table MshIgrdIt (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  RawMaterial bigint,
  Quantity double precision);

alter table MshIgrdIt add constraint PK_MshIgrdIt
  primary key (Id);

create table MshIt (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  Recipe bigint,
  Volume double precision,
  OriginalGravity double precision,
  StartWater double precision,
  SpargeWater double precision,
  TotalWater double precision,
  BoilTime double precision);

alter table MshIt add constraint PK_MshIt
  primary key (Id);

create table MshIt_GeneralLog (
  Id bigint not null,
  MshItId bigint not null,
  GeneralLogId bigint not null,
  ItemPos integer not null);

alter table MshIt_GeneralLog add constraint PK_MshIt_GeneralLog
  primary key (Id);

create table MshIt_GravLog (
  Id bigint not null,
  MshItId bigint not null,
  GravLogId bigint not null,
  ItemPos integer not null);

alter table MshIt_GravLog add constraint PK_MshIt_GravLog
  primary key (Id);

create table MshIt_MshIngds (
  Id bigint not null,
  MshItId bigint not null,
  MshIngdsId bigint not null,
  ItemPos integer not null);

alter table MshIt_MshIngds add constraint PK_MshIt_MshIngds
  primary key (Id);

create table MshIt_TempLog (
  Id bigint not null,
  MshItId bigint not null,
  TempLogId bigint not null,
  ItemPos integer not null);

alter table MshIt_TempLog add constraint PK_MshIt_TempLog
  primary key (Id);

create table PerContLab (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  BasicUserRecordData bigint);

alter table PerContLab add constraint PK_PerContLab
  primary key (Id);

create table RecIngItem (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  RawMaterial bigint,
  Percentage double precision);

alter table RecIngItem add constraint PK_RecIngItem
  primary key (Id);

create table Recipe (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  BasicUserRecordData bigint,
  Family smallint,
  WaterAmount double precision,
  OriginalGravity double precision,
  FinalGravity double precision,
  AgeFor integer);

alter table Recipe add constraint PK_Recipe
  primary key (Id);

create table Recipe_Ingrds (
  Id bigint not null,
  RecipeId bigint not null,
  IngrdsId bigint not null,
  ItemPos integer not null);

alter table Recipe_Ingrds add constraint PK_Recipe_Ingrds
  primary key (Id);

create table TAccountChart (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  BasicUserRecordData bigint,
  ChildOf bigint,
  Level integer,
  Balance money,
  ShortCode integer);

alter table TAccountChart add constraint PK_TAccountChart
  primary key (Id);

create table TAddress (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  Label bigint,
  Street varchar(40),
  Number varchar(20),
  POBox varchar(20),
  Neighborhood bigint,
  City bigint,
  PostalCode varchar(20));

alter table TAddress add constraint PK_TAddress
  primary key (Id);

create table TAddressLabel (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  BasicUserRecordData bigint);

alter table TAddressLabel add constraint PK_TAddressLabel
  primary key (Id);

create table TBasicUserRecordData (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  Code varchar(20),
  Name varchar(40) not null,
  Remarks text);

alter table TBasicUserRecordData add constraint PK_TBasicUserRecordData
  primary key (Id);

create table TCity (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  BasicUserRecordData bigint,
  State bigint);

alter table TCity add constraint PK_TCity
  primary key (Id);

create table TCompany (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  IE varchar(20),
  CNPJ varchar(20));

alter table TCompany add constraint PK_TCompany
  primary key (Id);

create table TCompany_Contacts (
  Id bigint not null,
  TCompanyId bigint not null,
  ContactsId bigint not null,
  ItemPos integer not null);

alter table TCompany_Contacts add constraint PK_TCompany_Contacts
  primary key (Id);

create table TCountry (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  BasicUserRecordData bigint);

alter table TCountry add constraint PK_TCountry
  primary key (Id);

create table TEquipment (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  BasicUserRecordData bigint,
  Cost money,
  PurchaseDate date);

alter table TEquipment add constraint PK_TEquipment
  primary key (Id);

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

create table TFermenter (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  BasicUserRecordData bigint,
  FullCapacity double precision,
  HeadSpace double precision,
  UtilCapacity double precision,
  Location bigint,
  CurrentVolume double precision,
  Status smallint);

alter table TFermenter add constraint PK_TFermenter
  primary key (Id);

create table TFermenterEventItem (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  FermenterEvent bigint,
  ExpirationDate date,
  Expired boolean,
  Volume double precision,
  Temperature double precision,
  Gravity double precision);

alter table TFermenterEventItem add constraint PK_TFermenterEventItem
  primary key (Id);

create table TGeneralLog (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  RemarkedAt timestamp,
  Remarks text);

alter table TGeneralLog add constraint PK_TGeneralLog
  primary key (Id);

create table TLocation (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  BasicUserRecordData bigint);

alter table TLocation add constraint PK_TLocation
  primary key (Id);

create table TMash (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  BasicUserRecordData bigint,
  AverageOriginalGravity double precision,
  FinalGravity double precision,
  Amount double precision);

alter table TMash add constraint PK_TMash
  primary key (Id);

create table TMash_Fmts (
  Id bigint not null,
  TMashId bigint not null,
  FmtsId bigint not null,
  ItemPos integer not null);

alter table TMash_Fmts add constraint PK_TMash_Fmts
  primary key (Id);

create table TMash_MashItems (
  Id bigint not null,
  TMashId bigint not null,
  MashItemsId bigint not null,
  ItemPos integer not null);

alter table TMash_MashItems add constraint PK_TMash_MashItems
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

create table TNeighborhood (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  BasicUserRecordData bigint);

alter table TNeighborhood add constraint PK_TNeighborhood
  primary key (Id);

create table TPerson (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  RG varchar(20),
  CPF varchar(20),
  Spouse bigint);

alter table TPerson add constraint PK_TPerson
  primary key (Id);

create table TPersonContact (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  Label bigint,
  Person bigint,
  ExtensionLine varchar(20));

alter table TPersonContact add constraint PK_TPersonContact
  primary key (Id);

create table TPhone (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  Label bigint,
  Number varchar(30));

alter table TPhone add constraint PK_TPhone
  primary key (Id);

create table TPhoneLabel (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  BasicUserRecordData bigint);

alter table TPhoneLabel add constraint PK_TPhoneLabel
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

create table TState (
  Id bigint not null,
  ClassId bigint not null,
  UpdateCount integer not null,
  BasicUserRecordData bigint,
  Abbreviation varchar(2),
  Country bigint);

alter table TState add constraint PK_TState
  primary key (Id);

alter table Cont add constraint FK_Cont_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table Cont add constraint FK_Cont_BasicURD
  foreign key (BasicUserRecordData)
  references TBasicUserRecordData (Id)
  on delete no action
  on update cascade;

alter table Cont_Addr add constraint FK_Cont_Addr_ContId
  foreign key (ContId)
  references Cont (Id)
  on delete no action
  on update cascade;

alter table Cont_Addr add constraint FK_Cont_Addr_AddrId
  foreign key (AddrId)
  references TAddress (Id)
  on delete no action
  on update cascade;

alter table Cont_IntAddr add constraint FK_Cont_IntAddr_ContId
  foreign key (ContId)
  references Cont (Id)
  on delete no action
  on update cascade;

alter table Cont_IntAddr add constraint FK_Cont_IntAddr_IntAddrId
  foreign key (IntAddrId)
  references IntAddr (Id)
  on delete no action
  on update cascade;

alter table Cont_Phones add constraint FK_Cont_Phones_ContId
  foreign key (ContId)
  references Cont (Id)
  on delete no action
  on update cascade;

alter table Cont_Phones add constraint FK_Cont_Phones_PhonesId
  foreign key (PhonesId)
  references TPhone (Id)
  on delete no action
  on update cascade;

alter table FmtrEvnt add constraint FK_FmtrEvnt_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table FmtrEvnt add constraint FK_FmtrEvnt_BasicURD
  foreign key (BasicUserRecordData)
  references TBasicUserRecordData (Id)
  on delete no action
  on update cascade;

alter table IntAddr add constraint FK_IntAddr_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table IntAddr add constraint FK_IntAddr_IntAddrLab
  foreign key (Label)
  references IntAddrLab (Id)
  on delete no action
  on update cascade;

alter table IntAddrLab add constraint FK_IntAddrLab_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table IntAddrLab add constraint FK_IntAddrLab_BasicURD
  foreign key (BasicUserRecordData)
  references TBasicUserRecordData (Id)
  on delete no action
  on update cascade;

alter table MsFmtIt add constraint FK_MsFmtIt_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table MsFmtIt add constraint FK_MsFmtIt_Fmt
  foreign key (Fermenter)
  references TFermenter (Id)
  on delete no action
  on update cascade;

alter table MsFmtIt_FmtEvts add constraint FK_MsFmtIt_FmtEvts_MsFmtItId
  foreign key (MsFmtItId)
  references MsFmtIt (Id)
  on delete no action
  on update cascade;

alter table MsFmtIt_FmtEvts add constraint FK_MsFmtIt_FmtEvts_FmtEvtsId
  foreign key (FmtEvtsId)
  references TFermenterEventItem (Id)
  on delete no action
  on update cascade;

alter table MshIgrdIt add constraint FK_MshIgrdIt_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table MshIgrdIt add constraint FK_MshIgrdIt_RawMtrl
  foreign key (RawMaterial)
  references TRawMaterial (Id)
  on delete no action
  on update cascade;

alter table MshIt add constraint FK_MshIt_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table MshIt add constraint FK_MshIt_Recipe
  foreign key (Recipe)
  references Recipe (Id)
  on delete no action
  on update cascade;

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

alter table MshIt_MshIngds add constraint FK_MshIt_MshIngds_MshItId
  foreign key (MshItId)
  references MshIt (Id)
  on delete no action
  on update cascade;

alter table MshIt_MshIngds add constraint FK_MshIt_MshIngds_MshIngdsId
  foreign key (MshIngdsId)
  references MshIgrdIt (Id)
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

alter table PerContLab add constraint FK_PerContLab_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table PerContLab add constraint FK_PerContLab_BasicURD
  foreign key (BasicUserRecordData)
  references TBasicUserRecordData (Id)
  on delete no action
  on update cascade;

alter table RecIngItem add constraint FK_RecIngItem_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table RecIngItem add constraint FK_RecIngItem_RawMaterial
  foreign key (RawMaterial)
  references TRawMaterial (Id)
  on delete no action
  on update cascade;

alter table Recipe add constraint FK_Recipe_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table Recipe add constraint FK_Recipe_BasicURD
  foreign key (BasicUserRecordData)
  references TBasicUserRecordData (Id)
  on delete no action
  on update cascade;

alter table Recipe_Ingrds add constraint FK_Recipe_Ingrds_RecipeId
  foreign key (RecipeId)
  references Recipe (Id)
  on delete no action
  on update cascade;

alter table Recipe_Ingrds add constraint FK_Recipe_Ingrds_IngrdsId
  foreign key (IngrdsId)
  references RecIngItem (Id)
  on delete no action
  on update cascade;

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

alter table TAddress add constraint FK_TAddress_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table TAddress add constraint FK_TAddress_Label
  foreign key (Label)
  references TAddressLabel (Id)
  on delete no action
  on update cascade;

alter table TAddress add constraint FK_TAddress_Neighborhood
  foreign key (Neighborhood)
  references TNeighborhood (Id)
  on delete no action
  on update cascade;

alter table TAddress add constraint FK_TAddress_City
  foreign key (City)
  references TCity (Id)
  on delete no action
  on update cascade;

alter table TAddressLabel add constraint FK_TAddressLabel_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table TAddressLabel add constraint FK_TAddressLabel_BasicURD
  foreign key (BasicUserRecordData)
  references TBasicUserRecordData (Id)
  on delete no action
  on update cascade;

alter table TBasicUserRecordData add constraint FK_TBasicUserRecordData_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table TCity add constraint FK_TCity_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table TCity add constraint FK_TCity_BasicURD
  foreign key (BasicUserRecordData)
  references TBasicUserRecordData (Id)
  on delete no action
  on update cascade;

alter table TCity add constraint FK_TCity_State
  foreign key (State)
  references TState (Id)
  on delete no action
  on update cascade;

alter table TCompany add constraint FK_TCompany_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table TCompany_Contacts add constraint FK_TCompany_Contacts_TCompanyId
  foreign key (TCompanyId)
  references TCompany (Id)
  on delete no action
  on update cascade;

alter table TCompany_Contacts add constraint FK_TCompany_Contacts_ContactsId
  foreign key (ContactsId)
  references TPersonContact (Id)
  on delete no action
  on update cascade;

alter table TCountry add constraint FK_TCountry_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table TCountry add constraint FK_TCountry_BasicURD
  foreign key (BasicUserRecordData)
  references TBasicUserRecordData (Id)
  on delete no action
  on update cascade;

alter table TEquipment add constraint FK_TEquipment_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table TEquipment add constraint FK_TEquipment_BasicUserRecordData
  foreign key (BasicUserRecordData)
  references TBasicUserRecordData (Id)
  on delete no action
  on update cascade;

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

alter table TFermenter add constraint FK_TFermenter_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table TFermenter add constraint FK_TFermenter_BasicURD
  foreign key (BasicUserRecordData)
  references TBasicUserRecordData (Id)
  on delete no action
  on update cascade;

alter table TFermenter add constraint FK_TFermenter_Location
  foreign key (Location)
  references TLocation (Id)
  on delete no action
  on update cascade;

alter table TFermenterEventItem add constraint FK_TFermenterEventItem_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table TFermenterEventItem add constraint FK_TFermenterEventItem_BasicURD
  foreign key (FermenterEvent)
  references FmtrEvnt (Id)
  on delete no action
  on update cascade;

alter table TGeneralLog add constraint FK_TGeneralLog_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table TLocation add constraint FK_TLocation_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table TLocation add constraint FK_TLocation_BasicURD
  foreign key (BasicUserRecordData)
  references TBasicUserRecordData (Id)
  on delete no action
  on update cascade;

alter table TMash add constraint FK_TMash_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table TMash add constraint FK_TMash_BasicURD
  foreign key (BasicUserRecordData)
  references TBasicUserRecordData (Id)
  on delete no action
  on update cascade;

alter table TMash_Fmts add constraint FK_TMash_Fmts_TMashId
  foreign key (TMashId)
  references TMash (Id)
  on delete no action
  on update cascade;

alter table TMash_Fmts add constraint FK_TMash_Fmts_FmtsId
  foreign key (FmtsId)
  references MsFmtIt (Id)
  on delete no action
  on update cascade;

alter table TMash_MashItems add constraint FK_TMash_MashItems_TMashId
  foreign key (TMashId)
  references TMash (Id)
  on delete no action
  on update cascade;

alter table TMash_MashItems add constraint FK_TMash_MashItems_MashItemsId
  foreign key (MashItemsId)
  references MshIt (Id)
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

alter table TNeighborhood add constraint FK_TNeighborhood_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table TNeighborhood add constraint FK_TNeighborhood_BasicURD
  foreign key (BasicUserRecordData)
  references TBasicUserRecordData (Id)
  on delete no action
  on update cascade;

alter table TPerson add constraint FK_TPerson_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table TPerson add constraint FK_TPerson_Spouse
  foreign key (Spouse)
  references TPerson (Id)
  on delete no action
  on update cascade;

alter table TPersonContact add constraint FK_TPersonContact_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table TPersonContact add constraint FK_TPersonContact_Label
  foreign key (Label)
  references PerContLab (Id)
  on delete no action
  on update cascade;

alter table TPersonContact add constraint FK_TPersonContact_Person
  foreign key (Person)
  references TPerson (Id)
  on delete no action
  on update cascade;

alter table TPhone add constraint FK_TPhone_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table TPhone add constraint FK_TPhone_Label
  foreign key (Label)
  references TPhoneLabel (Id)
  on delete no action
  on update cascade;

alter table TPhoneLabel add constraint FK_TPhoneLabel_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table TPhoneLabel add constraint FK_TPhoneLabel_BasicURD
  foreign key (BasicUserRecordData)
  references TBasicUserRecordData (Id)
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

alter table TState add constraint FK_TState_ClassId
  foreign key (ClassId)
  references ModelClasses (Id)
  on delete no action
  on update cascade;

alter table TState add constraint FK_TState_BasicURD
  foreign key (BasicUserRecordData)
  references TBasicUserRecordData (Id)
  on delete no action
  on update cascade;

alter table TState add constraint FK_TState_Country
  foreign key (Country)
  references TCountry (Id)
  on delete no action
  on update cascade;

/* User generated SQL */

alter sequence gen_glassbeer start with 50000;

create table glassconfig (
  id bigint not null,
  dbversion integer not null);
  
alter table glassconfig add constraint pk_glassconfig
  primary key (id);
  
insert into glassconfig (id, dbversion) values (1, 7);