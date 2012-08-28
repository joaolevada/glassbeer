unit ContactMVP;

{$I '..\..\core\include\glassbeer_defines.inc'}

interface

uses
  ContactBO,
  CustomMVP,
  PressMVPPresenter,
  PressMVPCommand,
  Classes,
  PressSubject;

type

  { TContactEditPresenter }

  TContactEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TPersonEditPresenter }

  TPersonEditPresenter = class(TContactEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TCompanyEditPresenter }

  TCompanyEditPresenter = class(TContactEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TPersonContactEditPresenter }

  TPersonContactEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TPersonContactLabelEditPresenter }

  TPersonContactLabelEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TContactQueryPresenter }

  TContactQueryPresenter = class(TCustomQueryPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TAddPersonCommand }

  TAddPersonCommand = class(TPressMVPCustomAddItemsCommand)
  protected
    function GetCaption: string; override;
    function GetShortCut: TShortCut; override;
    function InternalObjectClass: TPressObjectClass; override;
  end;

  { TAddCompanyCommand }

  TAddCompanyCommand = class(TPressMVPCustomAddItemsCommand)
  protected
    function GetCaption: string; override;
    function GetShortCut: TShortCut; override;
    function InternalObjectClass: TPressObjectClass; override;
  end;

implementation

uses
  Menus,
  LCLType;

{ TPersonContactEditPresenter }

procedure TPersonContactEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Label', 'LabelComboBox', 'BasicUserRecorData.Name');
  CreateSubPresenter('Person', 'PersonComboBox', 'BasicUserRecorData.Name');
  CreateSubPresenter('ExtensionLine', 'ExtensionLineEdit');
end;

{ TPersonContactLabelEditPresenter }

procedure TPersonContactLabelEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('BasicUserRecordData.Code', 'CodeEdit');
  CreateSubPresenter('BasicUserRecordData.Name', 'NameEdit');
  CreateSubPresenter('BasicUserRecordData.Remarks', 'RemarksMemo');
end;

{ TCompanyEditPresenter }

procedure TCompanyEditPresenter.InitPresenter;
var
  VContactsPresenter: TPressMVPItemsPresenter;
  VContactPresenter: TPressMVPFormPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('IE', 'IEEdit');
  CreateSubPresenter('CNPJ', 'CNPJEdit');
  VContactsPresenter := CreateSubPresenter('Contacts', 'ContactsStringGrid',
    'Label.BasicUserRecordData.Name(10,"Cargo");' +
    'Person.BasicUserRecordData.Name(40,"Nome");' +
    'ExtensionLine(10,"Ramal")') as TPressMVPItemsPresenter;
  { TODO 3 -ojoaolevada -cimprovement : Commands to add and remove company's contacts }
  VContactPresenter := CreateDetailPresenter(VContactsPresenter);
  VContactPresenter.CreateSubPresenter('Label', 'ContactLabelComboBox',
    'BasicUserRecordData.Name');
  VContactPresenter.CreateSubPresenter('Person', 'ContactPersonComboBox',
    'BasicUserRecordData.Name');
  VContactPresenter.CreateSubPresenter('ExtensionLine', 'ExtensionLineEdit');
end;

{ TPersonEditPresenter }

procedure TPersonEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('RG', 'RGEdit');
  CreateSubPresenter('CPF', 'CPFEdit');
  CreateSubPresenter('Spouse', 'SpouseComboBox', 'BasicUserRecorData.Name');
end;

{ TContactEditPresenter }

procedure TContactEditPresenter.InitPresenter;
var
  VPhonesPresenter: TPressMVPItemsPresenter;
  VPhonePresenter: TPressMVPFormPresenter;
  VAddressesPresenter: TPressMVPItemsPresenter;
  VInternetAddresses: TPressMVPItemsPresenter;
  VInternetAddressPresenter: TPressMVPFormPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('BasicUserRecordData.Code', 'CodeEdit');
  CreateSubPresenter('BasicUserRecordData.Name', 'NameEdit');
  CreateSubPresenter('BasicUserRecordData.Remarks', 'RemarksMemo');

  VAddressesPresenter := CreateSubPresenter('Addresses', 'AddressesStringGrid',
    'Label.BasicUserRecordData.Name(10,"Tipo");' +
    'Street(40,"Rua");'+
    'Number(5,"Número")'+
    'Neighborhood(20,"Bairro");' +
    'City(20,"Cidade");' +
    'PostalCode(12,"C.E.P")') as TPressMVPItemsPresenter;
  { TODO 3 -ojoaolevada -cimprovement : Commands to add, edit and delete contact's addresses }

  VPhonesPresenter := CreateSubPresenter('Phones', 'PhonesStringGrid',
    'Label.BasicUserRecordData.Name(10,"Tipo");' +
    'Number(10,"Número")') as TPressMVPItemsPresenter;
  { TODO 3 -ojoaolevada -cimprovement : Commands to add and delete contact's phones }
  VPhonePresenter := CreateDetailPresenter(VPhonesPresenter);
  VPhonePresenter.CreateSubPresenter('Label', 'PhoneLabelComboBox',
    'BasicUserRecordData.Name');
  VPhonePresenter.CreateSubPresenter('Number', 'PhoneNumberEdit');

  VInternetAddresses := CreateSubPresenter('InternetAddresses',
    'InternetAddresesStringGrid',
    'Label.BasicUserRecordData.Name(10,"Tipo");' +
    'Address(60,"Endereço")') as TPressMVPItemsPresenter;
  VInternetAddressPresenter := CreateDetailPresenter(VInternetAddresses);
  VInternetAddressPresenter.CreateSubPresenter('Label',
    'InternetAddressLabelComboBox', 'BasicUserRecordData.Name');
  VInternetAddressPresenter.CreateSubPresenter('Address',
    'InternetAddressEdit');
  { TODO 3 -ojoaolevada -cimprovement : Commands to add and remove contact's internet addresses }

  CreateSubPresenter('NickName', 'NickNameEdit');
end;

{ TContactQueryPresenter }

procedure TContactQueryPresenter.InitPresenter;
var
  VItemsPresenter: TPressMVPPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Code', 'CodeEdit');
  CreateSubPresenter('Name', 'NameEdit');
  VItemsPresenter := CreateQueryItemsPresenter('QueryStringGrid');
  VItemsPresenter.Model.InsertCommands(0, [TAddPersonCommand, TAddCompanyCommand]);
  VItemsPresenter.BindCommand(TAddPersonCommand, 'AddPersonButton');
  VItemsPresenter.BindCommand(TAddCompanyCommand, 'AddCompanyButton');
  VItemsPresenter.BindCommand(TPressMVPEditItemCommand, 'EditButton');
  VItemsPresenter.BindCommand(TPressMVPRemoveItemsCommand, 'RemoveButton');
  BindCommand(TPressMVPExecuteQueryCommand, 'SearchNameButton');
  BindCommand(TPressMVPExecuteQueryCommand, 'SearchCodeButton');
end;

{ TAddPersonCommand }

function TAddPersonCommand.GetCaption: string;
begin
  Result := 'Adicionar pessoa';
end;

function TAddPersonCommand.GetShortCut: TShortCut;
begin
  Result := VK_F2;
end;

function TAddPersonCommand.InternalObjectClass: TPressObjectClass;
begin
  Result := TPerson;
end;

{ TAddCompanyCommand }

function TAddCompanyCommand.GetCaption: string;
begin
  Result := 'Adicionar empresa';
end;

function TAddCompanyCommand.GetShortCut: TShortCut;
begin
  Result := Menus.ShortCut(VK_F2, [ssCtrl]);
end;

function TAddCompanyCommand.InternalObjectClass: TPressObjectClass;
begin
  Result := TCompany;
end;

initialization
  TPersonEditPresenter.RegisterBO(TPerson);
  TCompanyEditPresenter.RegisterBO(TCompany);
  TPersonContactEditPresenter.RegisterBO(TPersonContact);
  TPersonContactLabelEditPresenter.RegisterBO(TPersonContactLabel);
  TContactQueryPresenter.RegisterBO(TContactQuery);

end.

