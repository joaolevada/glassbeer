unit MashBO;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  PressAttributes,
  CustomBO,
  BasicUserRecordDataBO;

type

  {$M+}
  TMashItemParts = class;
  TMashFermenterItemParts = class;
  {$M-}

  TMash = class(TCustomObject)
    _BasicUserRecordData: TBasicUserRecordDataPart;
    _MashItems: TMashItemParts;
    _AverageOriginalGravity: TPressFloat;
    _FinalGravity: TPressFloat;
    _Amount: TPressInt64;
    _Fermenters: TMashFermenterItemParts;
  end;

  TMashItemParts = class(TCustomParts)

  end;

  TMashFermenterItemParts = class(TCustomParts)

  end;

  TMashReference = class(TCustomReference)

  end;

  TMashItem = class(TCustomObject)

  end;

  TMashFermenterItem = class(TCustomObject)

  end;

  TMashIngredientItem = class(TCustomObject)

  end;

  TMashIngredientItemParts = class(TCustomParts)

  end;

  TMashFermenterItemReferences = class(TCustomReferences)

  end;


implementation

initialization
  TMash.RegisterClass;
  TMashItemParts.RegisterAttribute;
  TMashFermenterItemParts.RegisterAttribute;
  TMashReference.RegisterAttribute;
  TMashItem.RegisterClass;
  TMashFermenterItem.RegisterClass;
  TMashIngredientItemParts.RegisterAttribute;
  TMashIngredientItem.RegisterClass;
  TMashFermenterItemReferences.RegisterAttribute;

finalization
  TMash.UnregisterClass;
  TMashItemParts.UnregisterAttribute;
  TMashFermenterItemParts.UnregisterAttribute;
  TMashReference.UnregisterAttribute;
  TMashItem.UnregisterClass;
  TMashFermenterItem.UnregisterClass;
  TMashIngredientItemParts.UnregisterAttribute;
  TMashIngredientItem.UnregisterClass;
  TMashFermenterItemReferences.UnregisterAttribute;

end.

