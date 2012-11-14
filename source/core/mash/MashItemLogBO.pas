unit MashItemLogBO;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  CustomBO,
  PressAttributes;

type

  TGravityInput = (giSpecific, giBrix);

  { TMashItemTemperature }

  TMashItemTemperature = class(TCustomObject)
    _MeasuredAt: TPressDateTime;
    _Temperature: TPressDouble;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TMashItemGravity }

  TMashItemGravity = class(TCustomObject)
    _MeasuredAt: TPressDateTime;
    _InputType: TPressEnum;
    _SpecificGravity: TPressDouble;
    _Brix: TPressDouble;
  protected
    class function InternalMetadataStr: string; override;
  end;

implementation

uses
  PressSubject;

{ TMashItemGravity }

class function TMashItemGravity.InternalMetadataStr: string;
begin
  Result := 'TMashItemGravity IsPersistent (' +
    'MeasuredAt: DateTime DefaultValue="now" EditMask="dd/MM/yyyy hh:nn";' +
    'InputType: Enum(TGravityInput);' +
    'SpecificGravity: Double;' +
    'Brix: Double;' +
    ')';
end;

{ TMashItemTemperature }

class function TMashItemTemperature.InternalMetadataStr: string;
begin
  Result := 'TMashItemTemperature IsPersistent(' +
    'MeasuredAt: DateTime DefaultValue="now" EditMask="dd/MM/yyyy hh:nn";' +
    'Temperature: Double DefaultValue="20.0";' +
    ')';
end;

initialization
  TMashItemTemperature.RegisterClass;
  TMashItemGravity.RegisterClass;
  PressModel.RegisterEnumMetadata(TypeInfo(TGravityInput), 'TGravityInput',
    ['Gravidade específica', 'Brix']);

finalization
  TMashItemTemperature.UnregisterClass;
  TMashItemGravity.UnregisterClass;

end.

