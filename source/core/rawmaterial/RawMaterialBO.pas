unit RawMaterialBO;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  CustomBO,
  PressAttributes,
  PressSubject;

type
  TRawMaterial = class(TCustomObject)
  end;

  TRawMaterialReference = class(TCustomReference)
  end;

implementation

initialization
  TRawMaterial.RegisterClass;
  TRawMaterialReference.RegisterAttribute;

finalization
  TRawMaterial.UnregisterClass;
  TRawMaterialReference.UnregisterAttribute;

end.

