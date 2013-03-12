unit AddressMVP;

{$I '..\..\core\include\glassbeer_defines.inc'}

interface

uses
  CustomMVP,
  AddressBO,
  PressMVPCommand,
  PressSubject;

type

  { TAddressEditPresenter }

  TAddressEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TAddressLabelEditPresenter }

  TAddressLabelEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TCityEditPresenter }

  TCityEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TCountryEditPresenter }

  TCountryEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TInternetAddressEditPresenter }

  TInternetAddressEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TInternetAddressLabelEditPresenter }

  TInternetAddressLabelEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TNeighborhoodEditPresenter }

  TNeighborhoodEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TPhoneEditPresenter }

  TPhoneEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TPhoneLabelEditPresenter }

  TPhoneLabelEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TStateEditPresenter }

  TStateEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TAddAddressCommand }

  TAddAddressCommand = class(TPressMVPAddItemsCommand)
  protected
    function InternalObjectClass: TPressObjectClass; override;
  end;

  TEditAddressCommand = class(TPressMVPItemsCommand)
  protected
    function InternalIsEnabled: Boolean; override;
    procedure InternalExecute; override;
  end;

  { TAddInternetAddressCommand }

  TAddInternetAddressCommand = class(TPressMVPAddItemsCommand)
  protected
    function InternalObjectClass: TPressObjectClass; override;
  end;

  { TEditInternetAddressCommand }

  TEditInternetAddressCommand = class(TPressMVPItemsCommand)
  protected
    function InternalIsEnabled: Boolean; override;
    procedure InternalExecute; override;
  end;

  { TAddPhoneCommand }

  TAddPhoneCommand = class(TPressMVPAddItemsCommand)
  protected
    function InternalObjectClass: TPressObjectClass; override;
  end;

  { TPhoneEditCommand }

  TPhoneEditCommand = class(TPressMVPItemsCommand)
  protected
    function InternalIsEnabled: Boolean; override;
    procedure InternalExecute; override;
  end;

  { TIncludePhoneCommand }

  TIncludePhoneCommand = class(TPressMVPIncludeObjectCommand)
  protected
    procedure InternalExecute; override;
  end;


implementation

uses
  PressMVPModel,
  PressMVPPresenter;

{ TIncludePhoneCommand }

procedure TIncludePhoneCommand.InternalExecute;
var
  VPhoneLabel: TPhoneLabel;
begin
  VPhoneLabel := TPhoneLabel.Create;
  TPressMVPModelCreateIncludeFormEvent.Create(Model, VPhoneLabel).Notify;
  VPhoneLabel.Free;
end;

{ TPhoneEditCommand }

function TPhoneEditCommand.InternalIsEnabled: Boolean;
begin
  Result := Model.Selection.Count = 1;
end;

procedure TPhoneEditCommand.InternalExecute;
var
  VPhone: TPhone;
begin
  VPhone := Model.Selection[0] as TPhone;
  TPhoneEditPresenter.Run(VPhone);
end;

{ TAddPhoneCommand }

function TAddPhoneCommand.InternalObjectClass: TPressObjectClass;
begin
  Result := TPhone;
end;

{ TEditInternetAddressCommand }

function TEditInternetAddressCommand.InternalIsEnabled: Boolean;
begin
  Result := (Model.Selection.Count = 1);
end;

procedure TEditInternetAddressCommand.InternalExecute;
var
  VInternetAddress: TInternetAddress;
begin
  VInternetAddress := Model.Selection[0] as TInternetAddress;
  TInternetAddressEditPresenter.Run(VInternetAddress);
end;

{ TAddInternetAddressCommand }

function TAddInternetAddressCommand.InternalObjectClass: TPressObjectClass;
begin
  Result := TInternetAddress;
end;

{ TAddressEditPresenter }

procedure TAddressEditPresenter.InitPresenter;
var
  VLabelPresenter, VNeighborhoodPresenter, VCityPresenter: TPressMVPPresenter;
begin
  inherited InitPresenter;
  VLabelPresenter := CreateSubPresenter('Label', 'LabelComboBox', 'Name');
  VLabelPresenter.BindCommand(TPressMVPIncludeObjectCommand, 'AddLabelSpeedButton');
  VLabelPresenter.BindCommand(TPressMVPEditItemCommand, 'EditLabelSpeedButton');
  CreateSubPresenter('Street', 'StreetEdit');
  CreateSubPresenter('Number', 'NumberEdit');
  CreateSubPresenter('POBox', 'POBoxEdit');
  VNeighborhoodPresenter := CreateSubPresenter('Neighborhood', 'NeighborhoodComboBox', 'Name');
  VNeighborhoodPresenter.BindCommand(TPressMVPIncludeObjectCommand, 'AddNeighborhoodSpeedButton');
  VNeighborhoodPresenter.BindCommand(TPressMVPEditItemCommand, 'EditNeighborhoodSpeedButton');
  VCityPresenter := CreateSubPresenter('City', 'CityComboBox', 'Name');
  VCityPresenter.BindCommand(TPressMVPIncludeObjectCommand, 'AddCitySpeedButton');
  VCityPresenter.BindCommand(TPressMVPEditItemCommand, 'EditCitySpeedButton');
  CreateSubPresenter('PostalCode', 'PostalCodeEdit');
end;

{ TAddressLabelEditPresenter }

procedure TAddressLabelEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Name', 'NameEdit');
end;

{ TCityEditPresenter }

procedure TCityEditPresenter.InitPresenter;
var
  VStatePresenter: TPressMVPPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Code', 'CodeEdit');
  CreateSubPresenter('Name', 'NameEdit');
  CreateSubPresenter('Remarks', 'RemarksMemo');
  VStatePresenter := CreateSubPresenter('State', 'StateComboBox', 'Name');
  VStatePresenter.BindCommand(TPressMVPIncludeObjectCommand, 'AddStateSpeedButton');
  VStatePresenter.BindCommand(TPressMVPEditItemCommand, 'EditStateSpeedButton');
end;

{ TInternetAddressEditPresenter }

procedure TInternetAddressEditPresenter.InitPresenter;
var
  VLabelPresenter: TPressMVPPresenter;
begin
  inherited InitPresenter;
  VLabelPresenter := CreateSubPresenter('Label', 'LabelComboBox', 'Name');
  VLabelPresenter.BindCommand(TPressMVPIncludeObjectCommand, 'AddLabelSpeedButton');
  VLabelPresenter.BindCommand(TPressMVPEditItemCommand, 'EditLabelSpeedButton');
  CreateSubPresenter('Address', 'AddressEdit');
end;

{ TCountryEditPresenter }

procedure TCountryEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Code', 'CodeEdit');
  CreateSubPresenter('Name', 'NameEdit');
  CreateSubPresenter('Remarks', 'RemarksMemo');
end;

{ TInternetAddressLabelEditPresenter }

procedure TInternetAddressLabelEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Name', 'NameEdit');
end;

{ TNeighborhoodEditPresenter }

procedure TNeighborhoodEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Code', 'CodeEdit');
  CreateSubPresenter('Name', 'NameEdit');
  CreateSubPresenter('Remarks', 'RemarksMemo');
end;

{ TPhoneEditPresenter }

procedure TPhoneEditPresenter.InitPresenter;
var
  VLabelPresenter: TPressMVPPresenter;
begin
  inherited InitPresenter;
  VLabelPresenter := CreateSubPresenter('Label', 'LabelComboBox', 'Name');
  VLabelPresenter.BindCommand(TPressMVPIncludeObjectCommand, 'AddLabelSpeedButton');
  VLabelPresenter.BindCommand(TPressMVPEditItemCommand, 'EditLabelSpeedButton');
  CreateSubPresenter('Number', 'NumberEdit');
end;

{ TPhoneLabelEditPresenter }

procedure TPhoneLabelEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Name', 'NameEdit');
end;

{ TStateEditPresenter }

procedure TStateEditPresenter.InitPresenter;
var
  VCountryPresenter: TPressMVPPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Code', 'CodeEdit');
  CreateSubPresenter('Name', 'NameEdit');
  CreateSubPresenter('Remarks', 'RemarksMemo');
  CreateSubPresenter('Abbreviation', 'AbbreviationEdit');
  VCountryPresenter := CreateSubPresenter('Country', 'CountryComboBox', 'Name');
  VCountryPresenter.BindCommand(TPressMVPIncludeObjectCommand, 'AddCountrySpeedButton');
  VCountryPresenter.BindCommand(TPressMVPEditItemCommand, 'EditCountrySpeedButton');
end;

{ TEditAddressCommand }

function TEditAddressCommand.InternalIsEnabled: Boolean;
begin
  Result := (Model.Selection.Count = 1);
end;

procedure TEditAddressCommand.InternalExecute;
var
  VAddress: TAddress;
begin
  VAddress := Model.Selection[0] as TAddress;
  TAddressEditPresenter.Run(VAddress);
end;

{ TAddAddressCommand }

function TAddAddressCommand.InternalObjectClass: TPressObjectClass;
begin
  Result := TAddress;
end;

initialization
  TAddressEditPresenter.RegisterBO(TAddress);
  TCityEditPresenter.RegisterBO(TCity);
  TCountryEditPresenter.RegisterBO(TCountry);
  TAddressLabelEditPresenter.RegisterBO(TAddressLabel);
  TInternetAddressEditPresenter.RegisterBO(TInternetAddress);
  TInternetAddressLabelEditPresenter.RegisterBO(TInternetAddressLabel);
  TNeighborhoodEditPresenter.RegisterBO(TNeighborhood);
  TPhoneEditPresenter.RegisterBO(TPhone);
  TPhoneLabelEditPresenter.RegisterBO(TPhoneLabel);
  TStateEditPresenter.RegisterBO(TState);

end.

