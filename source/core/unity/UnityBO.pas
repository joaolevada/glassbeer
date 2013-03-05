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
  protected
    class function InternalMetadataStr: string; override;
  end;

implementation

{ TUnity }

class function TUnity.InternalMetadataStr: string;
begin
  Result := 'TUnity IsPersistent(' +
    'Name: AnsiString DisplayName="Nome" IsMandatory=True;' +
    'Abbreviation: PlainString DisplayName="Abreviatura" IsMantatory=True;' +
    ');';
end;

initialization
  TUnity.RegisterClass;

finalization
  TUnity.UnregisterClass;

end.

