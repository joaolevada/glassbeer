unit ContactBO;

{$I '..\..\core\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  CustomBO,
  PressAttributes;

type

  { TContact }

  TContact = class(TCustomObject)
    _Code: TPressPlainString;
    _Name: TPressAnsiString;
    _Remarks: TPressMemo;
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
    _Name: TPressAnsiString;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TContactQuery }

  TContactQuery = class(TCustomQuery)
    _Code: TPressPlainString;
    _Name: TPressAnsiString;
  protected
    class function InternalMetadataStr: string; override;
  end;

implementation

{ TPersonContactLabel }

class function TPersonContactLabel.InternalMetadataStr: string;
begin
  Result := 'TPersonContactLabel IsPersistent PersistentName="PerContLab" (' +
    'Name: AnsiString(40);' +
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
    'Contacts: Parts(TPersonContact);' +
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
  Result := 'TContact IsPersistent PersistentName="Cont" ( ' +
    'Code: PlainString(20);' +
    'Name: AnsiString(40);' +
    'Remarks: Memo;' +
    'Addresses: Parts(TAddress) ShortName="Addr";' +
    'Phones: Parts(TPhone);' +
    'InternetAddresses: Parts(TInternetAddress) ShortName="IntAddr";' +
    'NickName: AnsiString(40);' +
    ')';
end;


{ TContactQuery }

class function TContactQuery.InternalMetadataStr: string;
begin
  Result := 'TContactQuery(TContact) (' +
    'Code: PlainString(20) MatchType=mtContains;' +
    'Name: AnsiString(40) MatchType=mtContains' +
    ')';
end;

initialization
  TContact.RegisterClass;
  TPerson.RegisterClass;
  TCompany.RegisterClass;
  TPersonContact.RegisterClass;
  TPersonContactLabel.RegisterClass;
  TContactQuery.RegisterClass;

finalization
  TContact.UnregisterClass;
  TPerson.UnregisterClass;
  TCompany.UnregisterClass;
  TPersonContact.UnregisterClass;
  TPersonContactLabel.UnregisterClass;
  TContactQuery.UnregisterClass;

end.

