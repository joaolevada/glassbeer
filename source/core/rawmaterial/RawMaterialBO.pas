unit RawMaterialBO;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  CustomBO,
  PressAttributes,
  PressSubject,
  BasicUserRecordDataBO;

type

  TUnity = (uGram, uKilogram, uMilliliter, uLiter);

  { TRawMaterial }

  TRawMaterial = class(TCustomObject)
    _BasicUserRecordData: TBasicUserRecordDataPart;
    _Unity: TPressEnum;
  public
    class function InternalMetadataStr: string; override;
  published
    BasicUserRecordData: TBasicUserRecordData;
  end;

  TRawMaterialReference = class(TCustomReference)
  end;

implementation

{ TRawMaterial }

class function TRawMaterial.InternalMetadataStr: string;
begin
  Result := 'TRawMaterial IsPersistent (' +
    'BasicUserRecordData: TBasicUserRecordDataPart ShortName="BasicURD";' +
    'Unity: Enum(TUnity);' +
    ')';
end;

initialization
  PressModel.RegisterEnumMetadata(TypeInfo(TUnity), 'TUnity',
    [
    'Grama (gr)',
    'Quilograma (kg)',
    'Mililitro (ml)',
    'Litro (l)'
    ]);
  TRawMaterial.RegisterClass;
  TRawMaterialReference.RegisterAttribute;

finalization
  TRawMaterial.UnregisterClass;
  TRawMaterialReference.UnregisterAttribute;

end.

