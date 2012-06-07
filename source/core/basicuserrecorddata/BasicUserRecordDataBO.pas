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
  private
    function GetCode: string;
    function GetName: string;
    function GetRemarks: string;
    procedure SetCode(const AValue: string);
    procedure SetName(const AValue: string);
    procedure SetRemarks(const AValue: string);
  protected
    class function InternalMetadataStr: string; override;
  public
    property Code: string read GetCode write SetCode;
    property Name: string read GetName write SetName;
    property Remarks: string read GetRemarks write SetRemarks;
  end;

  { TBasicUserRecordDataPart }

  TBasicUserRecordDataPart = class(TCustomPart)
  public
    class function ValidObjectClass: TPressObjectClass; override;
  end;

implementation

{ TBasicUserRecordData }

function TBasicUserRecordData.GetCode: string;
begin
  Result := _Code.Value;
end;

function TBasicUserRecordData.GetName: string;
begin
  Result := _Name.Value;
end;

function TBasicUserRecordData.GetRemarks: string;
begin
  Result := _Remarks.Value;
end;

procedure TBasicUserRecordData.SetCode(const AValue: string);
begin
  _Code.Value := AValue;
end;

procedure TBasicUserRecordData.SetName(const AValue: string);
begin
  _Name.Value := AValue;
end;

procedure TBasicUserRecordData.SetRemarks(const AValue: string);
begin
  _Remarks.Value := AValue;
end;

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
