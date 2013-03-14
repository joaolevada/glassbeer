unit ContactMVP;

{$I '..\..\core\include\glassbeer_defines.inc'}

interface

uses
  ContactBO,
  CustomMVP,
  PressMVPPresenter,
  PressMVPCommand,
  Classes,
  PressSubject,
  PressMVPModel;

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

  TContactQueryPresenter = class(TPressMVPQueryPresenter)
  protected
    procedure InitPresenter; override;
    class function InternalModelClass: TPressMVPObjectModelClass; override;
    function InternalQueryItemsDisplayNames: string; override;
  end;

  { TIncludeCompanyCommand }

  TIncludeCompanyCommand = class(TPressMVPIncludeObjectCommand)
  protected
    function GetCaption: string; override;
    function GetShortCut: TShortCut; override;
    procedure InternalExecute; override;
  end;

  { TIncludePersonCommand }

  TIncludePersonCommand = class(TPressMVPIncludeObjectCommand)
  protected
    function GetCaption: string; override;
    function GetShortCut: TShortCut; override;
    procedure InternalExecute; override;
  end;

  { TAddPersonCommand }

  TAddPersonCommand = class(TPressMVPAddItemsCommand)
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
  LCLType,
  AddressMVP;

{ TIncludePersonCommand }

function TIncludePersonCommand.GetCaption: string;
begin
  Result := 'Cadastrar pessoa';
end;

function TIncludePersonCommand.GetShortCut: TShortCut;
begin
  Result := VK_F2;
end;

procedure TIncludePersonCommand.InternalExecute;
var
  VPerson: TPerson;
begin
  VPerson := TPerson.Create();
  TPressMVPModelCreateIncludeFormEvent.Create(Model, VPerson).Notify;
  VPerson.Free;
end;

{ TIncludeCompanyCommand }

function TIncludeCompanyCommand.GetCaption: string;
begin
  Result := 'Cadastrar empresa'
end;

function TIncludeCompanyCommand.GetShortCut: TShortCut;
begin
  Result := Menus.ShortCut(VK_F2, [ssCtrl]);
end;

procedure TIncludeCompanyCommand.InternalExecute;
var
  VCompany: TCompany;
begin
  VCompany := TCompany.Create();
  TPressMVPModelCreateIncludeFormEvent.Create(Model, VCompany).Notify();
  VCompany.Free;
end;

{ TPersonContactEditPresenter }

procedure TPersonContactEditPresenter.InitPresenter;
var
  VLabelPresenter, VPersonPresenter: TPressMVPPresenter;
begin
  inherited InitPresenter;
  VLabelPresenter := CreateSubPresenter('Label', 'LabelComboBox', 'Name');
  VLabelPresenter.BindCommand(TPressMVPIncludeObjectCommand, 'AddLabelSpeedButton');
  VLabelPresenter.BindCommand(TPressMVPEditItemCommand, 'EditLabelSpeedButton');
  VPersonPresenter := CreateSubPresenter('Person', 'PersonComboBox', 'Name');
  VPersonPresenter.BindCommand(TPressMVPIncludeObjectCommand, 'AddPersonSpeedButton');
  VPersonPresenter.BindCommand(TPressMVPEditItemCommand, 'EditPersonSpeedButton');
  CreateSubPresenter('ExtensionLine', 'ExtensionLineEdit');
end;

{ TPersonContactLabelEditPresenter }

procedure TPersonContactLabelEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Name', 'NameEdit');
end;

{ TCompanyEditPresenter }

procedure TCompanyEditPresenter.InitPresenter;
var
  VContactsPresenter: TPressMVPItemsPresenter;
  VContactPresenter: TPressMVPFormPresenter;
  VContactLabelPresenter: TPressMVPPresenter;
  VContactPersonPresenter: TPressMVPPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('IE', 'IEEdit');
  CreateSubPresenter('CNPJ', 'CNPJEdit');
  VContactsPresenter := CreateSubPresenter('Contacts', 'ContactsStringGrid',
    'Label.Name(150,"Cargo");' +
    'Person.Name(350,"Nome");' +
    'ExtensionLine(60,"Ramal")') as TPressMVPItemsPresenter;
  VContactsPresenter.BindCommand(TPressMVPAddItemsCommand, 'AddContactSpeedButton');
  VContactsPresenter.BindCommand(TPressMVPEditItemCommand, 'EditContactSpeedButton');
  VContactsPresenter.BindCommand(TPressMVPRemoveItemsCommand, 'RemoveContactSpeedButton');
  VContactPresenter := CreateDetailPresenter(VContactsPresenter);
  VContactLabelPresenter := VContactPresenter.CreateSubPresenter('Label', 'ContactLabelComboBox',
    'Name');
  VContactLabelPresenter.BindCommand(TPressMVPIncludeObjectCommand, 'AddContactLabelSpeedButton');
  VContactLabelPresenter.BindCommand(TPressMVPEditItemCommand, 'EditContactLabelSpeedButton');
  VContactPersonPresenter := VContactPresenter.CreateSubPresenter('Person', 'ContactPersonComboBox',
    'Name');
  VContactPersonPresenter.BindCommand(TPressMVPIncludeObjectCommand, 'AddContactPersonSpeedButton');
  VContactPersonPresenter.BindCommand(TPressMVPEditItemCommand, 'EditContactPersonSpeedButton');
  VContactPresenter.CreateSubPresenter('ExtensionLine',
    'ContactExtensionLineEdit');
end;

{ TPersonEditPresenter }

procedure TPersonEditPresenter.InitPresenter;
var
  VSpousePresenter: TPressMVPPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('RG', 'RGEdit');
  CreateSubPresenter('CPF', 'CPFEdit');
  VSpousePresenter := CreateSubPresenter('Spouse', 'SpouseComboBox', 'Name');
  VSpousePresenter.BindCommand(TPressMVPIncludeObjectCommand, 'AddSpouseSpeedButton');
  VSpousePresenter.BindCommand(TPressMVPEditItemCommand, 'EditSpouseSpeedButton');
end;

{ TContactEditPresenter }

procedure TContactEditPresenter.InitPresenter;
var
  VPhonesPresenter: TPressMVPItemsPresenter;
  VPhonePresenter: TPressMVPFormPresenter;
  VAddressesPresenter: TPressMVPItemsPresenter;
  VInternetAddresses: TPressMVPItemsPresenter;
  VInternetAddressPresenter: TPressMVPFormPresenter;
  VPhoneLabelPresenter: TPressMVPPresenter;
  VInternetAddressLabelPresenter: TPressMVPPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Code', 'CodeEdit');
  CreateSubPresenter('Name', 'NameEdit');
  CreateSubPresenter('Remarks', 'RemarksMemo');

  VAddressesPresenter := CreateSubPresenter('Addresses', 'AddressesStringGrid',
    'Label.Name(100,"Tipo");' +
    'Street(300,"Rua");'+
    'Number(80,"Número")'+
    'Neighborhood(100,"Bairro");' +
    'City.Name(100,"Cidade");' +
    'PostalCode(100,"C.E.P")') as TPressMVPItemsPresenter;
  VAddressesPresenter.BindCommand(TPressMVPAddItemsCommand, 'AddAddressSpeedButton');
  VAddressesPresenter.BindCommand(TPressMVPEditItemCommand, 'EditAddressSpeedButton');
  VAddressesPresenter.BindCommand(TPressMVPRemoveItemsCommand, 'RemoveAddressSpeedButton');

  VPhonesPresenter := CreateSubPresenter('Phones', 'PhonesStringGrid',
    'Label.Name(150,"Tipo");' +
    'Number(250,"Número")') as TPressMVPItemsPresenter;
  VPhonesPresenter.BindCommand(TPressMVPAddItemsCommand, 'AddPhoneSpeedButton');
  VPhonesPresenter.BindCommand(TPressMVPEditItemCommand, 'EditPhoneSpeedButton');
  VPhonesPresenter.BindCommand(TPressMVPRemoveItemsCommand, 'RemovePhoneSpeedButton');
  VPhonePresenter := CreateDetailPresenter(VPhonesPresenter);
  VPhoneLabelPresenter := VPhonePresenter.CreateSubPresenter('Label', 'PhoneLabelComboBox',
    'Name');
  VPhoneLabelPresenter.BindCommand(TPressMVPIncludeObjectCommand, 'AddPhoneLabelSpeedButton');
  VPhoneLabelPresenter.BindCommand(TPressMVPEditItemCommand, 'EditPhoneLabelSpeedButton');

  VPhonePresenter.CreateSubPresenter('Number', 'PhoneNumberEdit');

  VInternetAddresses := CreateSubPresenter('InternetAddresses',
    'InternetAddressesStringGrid',
    'Label.Name(200,"Tipo");' +
    'Address(400,"Endereço")') as TPressMVPItemsPresenter;
  VInternetAddresses.BindCommand(TPressMVPAddItemsCommand, 'AddInternetAddressSpeedButton');
  VInternetAddresses.BindCommand(TPressMVPEditItemCommand, 'EditInternetAddressSpeedButton');
  VInternetAddresses.BindCommand(TPressMVPRemoveItemsCommand, 'RemoveInternetAddressSpeedButton');
  VInternetAddressPresenter := CreateDetailPresenter(VInternetAddresses);
  VInternetAddressLabelPresenter := VInternetAddressPresenter.CreateSubPresenter('Label',
    'InternetAddressLabelComboBox', 'Name');
  VInternetAddressLabelPresenter.BindCommand(TPressMVPIncludeObjectCommand, 'AddInternetAddressLabelSpeedButton');
  VInternetAddressLabelPresenter.BindCommand(TPressMVPEditItemCommand, 'EditInternetAddressLabelSpeedButton');
  VInternetAddressPresenter.CreateSubPresenter('Address',
    'InternetAddressEdit');

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

class function TContactQueryPresenter.InternalModelClass: TPressMVPObjectModelClass;
begin
  Result := TCustomQueryModel;
end;

function TContactQueryPresenter.InternalQueryItemsDisplayNames: string;
begin
  Result := 'Code(178,"Código");' +
    'Name(350,"Nome");' +
    'NickName(250,"Apelido")';
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

