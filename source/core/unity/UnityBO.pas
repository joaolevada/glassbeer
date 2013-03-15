unit UnityBO;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  CustomBO,
  PressAttributes;

type

  { TUnity }

  TUnity = class(TCustomObject)
    _Name: TPressAnsiString;
    _Abbreviation: TPressPlainString;
    _WeightInKilograms: TPressDouble;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TUnityQuery }

  TUnityQuery = class(TCustomQuery)
    _Name: TPressAnsiString;
  protected
    class function InternalMetadataStr: string; override;
  end;

implementation

{ TUnityQuery }

class function TUnityQuery.InternalMetadataStr: string;
begin
  Result := 'TUnityQuery (TUnity) (' +
    'Name: AnsiString(40) MatchType=mtContains' +
    ');'
end;

{ TUnity }

class function TUnity.InternalMetadataStr: string;
begin
  Result := 'TUnity IsPersistent(' +
    'Name: AnsiString(40) DisplayName="Nome" IsMandatory=True;' +
    'Abbreviation: PlainString(10) DisplayName="Abreviatura" IsMandatory=True;' +
    'WeightInKiloGrams: Double DisplayName="Peso em quilogramas" IsMandatory=True' +
    ');';
end;

initialization
  TUnity.RegisterClass;
  TUnityQuery.RegisterClass;

finalization
  TUnity.UnregisterClass;
  TUnityQuery.UnregisterClass;

end.

