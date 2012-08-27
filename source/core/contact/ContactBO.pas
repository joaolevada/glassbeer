unit ContactBO;

{$I '..\..\core\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  CustomBO,
  PressAttributes,
  BasicUserRecordDataBO;

type

  { TContact }

  TContact = class(TCustomObject)
    _BasicUserRecordData: TBasicUserRecordDataPart;
    _Addresses: TPressParts;
    _Phones: TPressParts;
    _InternetAddresses: TPressParts;
    _NickName: TPressPlainString;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TPerson }

  TPerson = class(TContact)
    _RG: TPressPlainString;
    _CPF: TPressPlainString;
    _Spouse: TPressReference;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TCompany }

  TCompany = class(TContact)
    _IE: TPressPlainString;
    _CNPJ: TPressPlainString;
    _Contacts: TPressParts;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TPersonContact }

  TPersonContact = class(TCustomObject)
    _Label: TPressReference;
    _Person: TPressReference;
    _ExtensionLine: TPressPlainString;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TPersonContactLabel }

  TPersonContactLabel = class(TCustomObject)
    _BasicUserRecordData: TBasicUserRecordDataPart;
  protected
    class function InternalMetadataStr: string; override;
  end;

implementation

{ TPersonContactLabel }

class function TPersonContactLabel.InternalMetadataStr: string;
begin
  Result := 'TPersonContact IsPersistent(' +
    'BasicUserRecordData: TBasicUserRecordDataPart;' +
    ')';
end;

{ TPersonContact }

class function TPersonContact.InternalMetadataStr: string;
begin
  Result := 'TPersonContact IsPersistent (' +
    'Label: Reference(TPersonContactLabel);' +
    'Person: Reference(TPerson);' +
    'ExtensionLine: PlainString(20);' +
    ')';
end;

{ TCompany }

class function TCompany.InternalMetadataStr: string;
begin
  Result := 'TCompany IsPersistent (' +
    'IE: PlainString(20);' +
    'CNPJ: PlainString(20);' +
    ')';
end;

{ TPerson }

class function TPerson.InternalMetadataStr: string;
begin
  Result := 'TPerson IsPersistent (' +
    'RG: PlainString(20);' +
    'CPF: PlainString(20);' +
    'Spouse: Reference(TPerson);' +
    ')';
end;

{ TContact }

class function TContact.InternalMetadataStr: string;
begin
  Result := 'TContact IsPersistent( ' +
    'BasicUserRecordData: TBasiUserRecordDataPart;' +
    'Addresses: Parts(TAddress);' +
    'Phones: Parts(TPhone);' +
    'InternetAddresses: Parts(TInternetAddress);' +
    'NickName: AnsiString(40);' +
    ')';
end;

initialization
  TContact.RegisterClass;
  TPerson.RegisterClass;
  TCompany.RegisterClass;
  TPersonContact.RegisterClass;
  TPersonContactLabel.RegisterClass;

finalization
  TContact.UnregisterClass;
  TPerson.UnregisterClass;
  TCompany.UnregisterClass;
  TPersonContact.UnregisterClass;
  TPersonContactLabel.UnregisterClass;

end.

