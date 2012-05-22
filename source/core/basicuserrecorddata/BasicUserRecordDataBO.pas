unit BasicUserRecordDataBO;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  CustomBO,
  PressAttributes,
  PressSubject;

type

  { TBasicUserRecordData }

  TBasicUserRecordData = class(TCustomObject)
    _Code: TPressAnsiString;
    _Name: TPressAnsiString;
    _Remarks: TPressMemo;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TBasicUserRecordDataPart }

  TBasicUserRecordDataPart = class(TCustomPart)
  public
    class function ValidObjectClass: TPressObjectClass; override;
  end;

implementation

{ TBasicUserRecordData }

class function TBasicUserRecordData.InternalMetadataStr: string;
begin
  Result := 'TBasicUserRecordData IsPersistent(' +
    'Code: AnsiString(20);'+
    'Name: AnsiString(40) NotNull;'+
    'Remarks: Memo;' +
    ');';
end;

{ TBasicUserRecordDataPart }

class function TBasicUserRecordDataPart.ValidObjectClass: TPressObjectClass;
begin
  Result := TBasicUserRecordData;
end;

initialization
  TBasicUserRecordData.RegisterClass;
  TBasicUserRecordDataPart.RegisterAttribute;

finalization
  TBasicUserRecordData.UnregisterClass;
  TBasicUserRecordDataPart.UnregisterAttribute;

end.
