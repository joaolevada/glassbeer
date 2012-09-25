unit EquipmentBO;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  PressAttributes,
  CustomBO,
  BasicUserRecordDataBO;

type

  { TEquipment }

  TEquipment = class(TCustomObject)
    _BasicUserRecordData: TBasicUserRecordDataPart;
    _Cost: TPressCurrency;
    _PurchaseDate: TPressDate;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TEquipmentQuery }

  TEquipmentQuery = class(TCustomQuery)
    _Name: TPressAnsiString;
  protected
    class function InternalMetadataStr: string; override;
  end;


implementation

{ TEquipmentQuery }

class function TEquipmentQuery.InternalMetadataStr: string;
begin
  Result := 'TEquipmentQuery(TEquipment) (' +
    'Name: AnsiString(40) MatchType=mtContains DataName="BasicUserRecordData.Name";' +
    ')';
end;

{ TEquipment }

class function TEquipment.InternalMetadataStr: string;
begin
  Result := 'TEquipment IsPersistent(' +
    'BasicUserRecordData: TBasicUserRecordDataPart;' +
    'Cost: Currency;' +
    'PurchaseDate: Date;' +
    ')';
end;

initialization
  TEquipment.RegisterClass;
  TEquipmentQuery.RegisterClass;

finalization
  TEquipment.UnregisterClass;
  TEquipmentQuery.UnregisterClass;

end.

