unit ContactMVP;

{$I '..\..\core\include\glassbeer_defines.inc'}

interface

uses
  ContactBO,
  CustomMVP,
  PressMVPPresenter;

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

implementation

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

initialization
  TPersonEditPresenter.RegisterBO(TPerson);
  TCompanyEditPresenter.RegisterBO(TCompany);
  TPersonContactEditPresenter.RegisterBO(TPersonContact);
  TPersonContactLabelEditPresenter.RegisterBO(TPersonContactLabel);

end.

