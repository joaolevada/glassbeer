unit AccountChartBO;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  {Classes,
  SysUtils,}
  CustomBO,
  BasicUserRecordDataBO,
  PressAttributes,
  PressSubject;

type

  {$M+}
  TAccountChartReference = class;
  {$M-}

  { TAccountChart }

  TAccountChart = class(TCustomObject)
    _BasicUserRecordData: TBasicUserRecordDataPart;
    _ChildOf: TAccountChartReference; //TAccountChart
    _Level: TPressInteger;
    _Balance: TPressCurrency;
    _ShortCode: TPressInteger;
  private
    function GetBasicUserRecordData: TBasicUserRecordData;
    function GetCanHaveChild: Boolean;
    function GetChildOf: TAccountChart;
    function GetCode: string;
    function GetLevel: Integer;
    function GetName: string;
    function GetRemarks: string;
    function GetShortCode: Integer;
    procedure SetChildOf(AValue: TAccountChart);
    procedure SetCode(AValue: string);
    procedure SetLevel(AValue: Integer);
    procedure SetName(AValue: string);
    procedure SetRemarks(AValue: string);
    procedure SetShortCode(AValue: Integer);
    property BasicUserRecordData: TBasicUserRecordData
      read GetBasicUserRecordData;
  protected
    class function InternalMetadataStr: string; override;
  public
    procedure SetParentAccount(const AAccount: TAccountChart);
    property Code: string read GetCode
      write SetCode;
    property Name: string read GetName
      write SetName;
    property Remarks: string read GetRemarks
      write SetRemarks;
    property Level: Integer read GetLevel
      write SetLevel;
    property CanHaveChild: Boolean read GetCanHaveChild;
    property ChildOf: TAccountChart read GetChildOf
      write SetChildOf;
    property ShortCode: Integer read GetShortCode
      write SetShortCode;
  end;
  { TODO 1 -ojoaolevada -cbusiness rules : Warn user about duplicate ShortCode }

  { TAccountChartQuery }

  TAccountChartQuery = class(TCustomQuery)
    _Code: TPressPlainString;
    _Name: TPressAnsiString;
    _ShortCode: TPressInteger;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TAccountChartReference }

  TAccountChartReference = class(TCustomReference)
  public
    class function ValidObjectClass: TPressObjectClass; override;
  end;

const
  ACCOUNT_LEVELONE = 1;
  ACCOUNT_LEVELTHWO = 2;
  ACCOUNT_LEVELTHREE = 3;
  ACCOUNT_CODESEPARATOR = '.';


implementation

{ TAccountChartReference }

class function TAccountChartReference.ValidObjectClass: TPressObjectClass;
begin
  Result := TAccountChart;
end;

{ TAccountChartQuery }

class function TAccountChartQuery.InternalMetadataStr: string;
begin
  Result := 'TAccountChartQuery(TAccountChart) (' +
    'Code: PlainString(20) MatchType=mtStarting DataName="BasicUserRecordData.Code";' +
    'Name: AnsiString(40) MatchType=mtContains DataName="BasicUserRecordData.Name";' +
    'ShortCode: Integer MatchType=mtEqual;' +
    ')';
end;

{ TAccountChart }

function TAccountChart.GetBasicUserRecordData: TBasicUserRecordData;
begin
  Result := _BasicUserRecordData.Value as TBasicUserRecordData;
end;

function TAccountChart.GetCanHaveChild: Boolean;
begin
  Result := Self.Level < ACCOUNT_LEVELTHREE;
end;

function TAccountChart.GetChildOf: TAccountChart;
begin
  Result := _ChildOf.Value as TAccountChart;
end;

function TAccountChart.GetCode: string;
begin
  Result := BasicUserRecordData.Code;
end;

function TAccountChart.GetLevel: Integer;
begin
  Result := _Level.Value;
end;

function TAccountChart.GetName: string;
begin
  Result := _BasicUserRecordData.Name;
end;

function TAccountChart.GetRemarks: string;
begin
  Result := BasicUserRecordData.Remarks;
end;

function TAccountChart.GetShortCode: Integer;
begin
  Result := _ShortCode.Value;
end;

procedure TAccountChart.SetChildOf(AValue: TAccountChart);
begin
  _ChildOf.Value := AValue;
end;

procedure TAccountChart.SetCode(AValue: string);
begin
  BasicUserRecordData.Code := AValue;
end;

procedure TAccountChart.SetLevel(AValue: Integer);
begin
  _Level.Value := AValue;
end;

procedure TAccountChart.SetName(AValue: string);
begin
  BasicUserRecordData.Name := AValue;
end;

procedure TAccountChart.SetRemarks(AValue: string);
begin
  BasicUserRecordData.Remarks := AValue;
end;

procedure TAccountChart.SetShortCode(AValue: Integer);
begin
  _ShortCode.Value := AValue;
end;

class function TAccountChart.InternalMetadataStr: string;
begin
  Result := 'TAccountChart IsPersistent(' +
    'BasicUserRecordData: TBasicUserRecordDataPart;' +
    'ChildOf: TAccountChartReference;' +
    'Level: Integer DefaultValue=1;' +
    'Balance: Currency DefaultValue=0;' +
    'ShortCode: Integer;' +
    ')';
end;

procedure TAccountChart.SetParentAccount(const AAccount: TAccountChart);
begin
  Self.Code := AAccount.Code + ACCOUNT_CODESEPARATOR;
  Self.ChildOf := AAccount;
  Self.Level := Succ(AAccount.Level);
end;

initialization
  TAccountChart.RegisterClass;
  TAccountChartQuery.RegisterClass;
  TAccountChartReference.RegisterAttribute;

finalization
  TAccountChart.UnregisterClass;
  TAccountChartQuery.UnregisterClass;
  TAccountChartReference.UnregisterAttribute;

end.

