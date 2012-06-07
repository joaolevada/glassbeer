unit CustomBO;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  PressSubject,
  PressAttributes;

type
  TCustomObject = class(TPressObject)
  end;

  TCustomQuery = class(TPressQuery)
  end;

  TCustomReference = class(TPressReference)
  end;

  TCustomReferences = class(TPressReferences)
  end;

  TCustomPart = class(TPressPart)
  end;

  TCustomParts = class(TPressParts)
  end;


implementation


initialization
  TCustomObject.RegisterClass;
  TCustomQuery.RegisterClass;
  TCustomReference.RegisterAttribute;
  TCustomReferences.RegisterAttribute;
  TCustomPart.RegisterAttribute;
  TCustomParts.RegisterAttribute;


finalization
  TCustomObject.UnregisterClass;
  TCustomQuery.UnregisterClass;
  TCustomReference.UnregisterAttribute;
  TCustomReferences.UnregisterAttribute;
  TCustomPart.UnregisterAttribute;
  TCustomParts.UnregisterAttribute;


end.

