unit AddressMVP;

{$I '..\..\core\include\glassbeer_defines.inc'}

interface

uses
  CustomMVP,
  AddressBO;

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
    procedure InitPresenter; override;
  end;

implementation

{ TAddressEditPresenter }

procedure TAddressEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Label', 'LabelComboBox', 'BasicUserRecordData.Name');
  CreateSubPresenter('Street', 'StreetEdit');
  CreateSubPresenter('Number', 'NumberEdit');
  CreateSubPresenter('POBox', 'POBoxEdit');
  CreateSubPresenter('Neighborhood', 'NeighborhoodComboBox', 'BasicUserRecordData.Name');
  CreateSubPresenter('City', 'CityComboBox', 'BasicUserRecordData.Name');
  CreateSubPresenter('PostalCode', 'PostalCodeEdit');
end;

{ TAddressLabelEditPresenter }

procedure TAddressLabelEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('BasicUserRecordData.Code', 'CodeEdit');
  CreateSubPresenter('BasicUserRecordData.Name', 'NameEdit');
  CreateSubPresenter('BasicUserRecordData.Remarks', 'RemarksMemo');
end;

{ TCityEditPresenter }

procedure TCityEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('BasicUserRecordData.Code', 'CodeEdit');
  CreateSubPresenter('BasicUserRecordData.Name', 'NameEdit');
  CreateSubPresenter('BasicUserRecordData.Remarks', 'RemarksMemo');
  CreateSubPresenter('State', 'StateComboBox', 'BasicUserRecordData.Name');
end;

{ TInternetAddressEditPresenter }

procedure TInternetAddressEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Label', 'LabelComboBox', 'BasicUserRecordData.Name');
  CreateSubPresenter('Address', 'AddressEdit');
end;

{ TCountryEditPresenter }

procedure TCountryEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('BasicUserRecordData.Code', 'CodeEdit');
  CreateSubPresenter('BasicUserRecordData.Name', 'NameEdit');
  CreateSubPresenter('BasicUserRecordData.Remarks', 'RemarksMemo');
end;

{ TInternetAddressLabelEditPresenter }

procedure TInternetAddressLabelEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('BasicUserRecordData.Code', 'CodeEdit');
  CreateSubPresenter('BasicUserRecordData.Name', 'NameEdit');
  CreateSubPresenter('BasicUserRecordData.Remarks', 'RemarksMemo');
end;

{ TNeighborhoodEditPresenter }

procedure TNeighborhoodEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('BasicUserRecordData.Code', 'CodeEdit');
  CreateSubPresenter('BasicUserRecordData.Name', 'NameEdit');
  CreateSubPresenter('BasicUserRecordData.Remarks', 'RemarksMemo');
end;

{ TPhoneEditPresenter }

procedure TPhoneEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Label', 'LabelComboBox', 'BasicUserRecordData.Name');
  CreateSubPresenter('Number', 'NumberEdit');
end;

{ TPhoneLabelEditPresenter }

procedure TPhoneLabelEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('BasicUserRecordData.Code', 'CodeEdit');
  CreateSubPresenter('BasicUserRecordData.Name', 'NameEdit');
  CreateSubPresenter('BasicUserRecordData.Remarks', 'RemarksMemo');
end;

{ TStateEditPresenter }

procedure TStateEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('BasicUserRecordData.Code', 'CodeEdit');
  CreateSubPresenter('BasicUserRecordData.Name', 'NameEdit');
  CreateSubPresenter('BasicUserRecordData.Remarks', 'RemarksMemo');
  CreateSubPresenter('Abbreviation', 'AbbreviationEdit');
  CreateSubPresenter('Country', 'CountryComboBox', 'BasicUserRecordData.Name');
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

