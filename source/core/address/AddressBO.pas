unit AddressBO;

{$I '..\..\core\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  CustomBO,
  PressAttributes;

type

  {$M+}
  TCity = class;
  TNeighborhood = class;
  TAddressLabel = class;
  TState = class;
  TCountry = class;
  TPhoneLabel = class;
  TInternetAddressLabel = class;
  {$M-}

  { TAddress }

  TAddress = class(TCustomObject)
    _Label: TPressReference;
    _Street: TPressString;
    _Number: TPressPlainString;
    _POBox: TPressPlainString;
    _Neighborhood: TPressReference;
    _City: TPressReference;
    _PostalCode: TPressPlainString;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TAddressLabel }

  TAddressLabel = class(TCustomObject)
    Name: TPressAnsiString;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TNeighborhood }

  TNeighborhood = class(TCustomObject)
    _Code: TPressPlainString;
    _Name: TPressAnsiString;
    _Remarks: TPressMemo;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TCity }

  TCity = class(TCustomObject)
    _Code: TPressPlainString;
    _Name: TPressAnsiString;
    _Remarks: TPressMemo;
    _State: TPressReference;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TState }

  TState = class(TCustomObject)
    _Code: TPressPlainString;
    _Name: TPressAnsiString;
    _Remarks: TPressMemo;
    _Abbreviation: TPressPlainString;
    _Country: TPressReference;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TCountry }

  TCountry = class(TCustomObject)
    _Code: TPressPlainString;
    _Name: TPressAnsiString;
    _Remarks: TPressMemo;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TPhone }

  TPhone = class(TCustomObject)
    _Label: TPressReference;
    _Number: TPressPlainString;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TPhoneLabel }

  TPhoneLabel = class(TCustomObject)
    _Name: TPressAnsiString;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TInternetAddress }

  TInternetAddress = class(TCustomObject)
    _Label: TPressReference;
    _Address: TPressPlainString;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TInternetAddressLabel }

  TInternetAddressLabel = class(TCustomObject)
    _Name: TPressAnsiString;
  protected
    class function InternalMetadataStr: string; override;
  end;


implementation

{ TAddress }

class function TAddress.InternalMetadataStr: string;
begin
  Result := 'TAddress IsPersistent(' +
    'Label: Reference(TAddressLabel);' +
    'Street: AnsiString(40);' +
    'Number: PlainString(20);' +
    'POBox: PlainString(20);' +
    'Neighborhood: Reference(TNeighborhood);' +
    'City: Reference(TCity);' +
    'PostalCode: PlainString(20);' +
    ')';
end;

{ TAddressLabel }

class function TAddressLabel.InternalMetadataStr: string;
begin
  Result := 'TAddressLabel IsPersistent(' +
    'Name: AnsiString(20)' +
    ')';
end;

{ TNeighborhood }

class function TNeighborhood.InternalMetadataStr: string;
begin
  Result := 'TNeighborhood IsPersistent (' +
    'Code: PlainString(20);' +
    'Name: AnsiString(40);' +
    'Remarks: Memo' +
    ')';
end;

{ TCity }

class function TCity.InternalMetadataStr: string;
begin
  Result := 'TCity IsPersistent(' +
    'Code: PlainString(20);' +
    'Name: AnsiString(40);' +
    'Remarks: Memo;' +
    'State: Reference(TState);' +
    ')';
end;

{ TCountry }

class function TCountry.InternalMetadataStr: string;
begin
  Result := 'TCountry IsPersistent (' +
    'Code: PlainString(20);' +
    'Name: PlainString(40);' +
    'Remarks: Memo;' +
    ')';
end;

{ TPhone }

class function TPhone.InternalMetadataStr: string;
begin
  Result := 'TPhone IsPersistent (' +
    'Label: Reference(TPhoneLabel);' +
    'Number: PlainString(30);' +
    ')';
end;

{ TPhoneLabel }

class function TPhoneLabel.InternalMetadataStr: string;
begin
  Result := 'TPhoneLabel IsPersistent (' +
    'Name: AnsiString(20);' +
    ')';
end;

{ TInternetAddress }

class function TInternetAddress.InternalMetadataStr: string;
begin
  Result := 'TInternetAddress IsPersistent PersistentName="IntAddr" (' +
    'Label: Reference(TInternetAddressLabel) ShortName="IntAddrLab";' +
    'Address: PlainString(80);' +
    ')';
end;

{ TInternetAddressLabel }

class function TInternetAddressLabel.InternalMetadataStr: string;
begin
  Result := 'TInternetAddressLabel IsPersistent PersistentName="IntAddrLab" (' +
    'Name: AnsiString(20)' +
    ')';
end;

{ TState }

class function TState.InternalMetadataStr: string;
begin
  Result := 'TState IsPersistent (' +
    'Code: PlainString(20);' +
    'Name: AnsiString(40);' +
    'Remarks: Memo;' +
    'Abbreviation: PlainString(2);' +
    'Country: Reference(TCountry);' +
    ')';
end;

initialization
  TAddress.RegisterClass;
  TAddressLabel.RegisterClass;
  TNeighborhood.RegisterClass;
  TCity.RegisterClass;
  TState.RegisterClass;
  TCountry.RegisterClass;
  TPhone.RegisterClass;
  TPhoneLabel.RegisterClass;
  TInternetAddress.RegisterClass;
  TInternetAddressLabel.RegisterClass;

finalization
  TAddress.UnregisterClass;
  TAddressLabel.UnregisterClass;
  TNeighborhood.UnregisterClass;
  TCity.UnregisterClass;
  TState.UnregisterClass;
  TCountry.UnregisterClass;
  TPhone.UnregisterClass;
  TPhoneLabel.UnregisterClass;
  TInternetAddress.UnregisterClass;
  TInternetAddressLabel.UnregisterClass;

end.

