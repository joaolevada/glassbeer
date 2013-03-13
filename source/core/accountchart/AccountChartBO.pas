unit AccountChartBO;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  {Classes,
  SysUtils,}
  CustomBO,
  PressAttributes,
  PressSubject;

type

  { TAccountChart }

  TAccountChart = class(TCustomObject)
    _Code: TPressPlainString;
    _Name: TPressAnsiString;
    _Remarks: TPressMemo;
    _ChildOf: TPressReference; //TAccountChart
    _Level: TPressInteger;
    _Balance: TPressCurrency;
    _ShortCode: TPressInteger;
    _ChildCount: TPressInteger;
  private
    function GetCanHaveChild: Boolean;
    function GetChildCount: Integer;
    function GetChildOf: TAccountChart;
    function GetCode: string;
    function GetLevel: Integer;
    function GetName: string;
    function GetRemarks: string;
    function GetShortCode: Integer;
    procedure SetChildCount(AValue: Integer);
    procedure SetChildOf(AValue: TAccountChart);
    procedure SetCode(AValue: string);
    procedure SetLevel(AValue: Integer);
    procedure SetName(AValue: string);
    procedure SetRemarks(AValue: string);
    procedure SetShortCode(AValue: Integer);
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
    property ChildCount: Integer read GetChildCount
      write SetChildCount;
  end;

  { TAccountChartQuery }

  TAccountChartQuery = class(TCustomQuery)
    _Code: TPressPlainString;
    _Name: TPressAnsiString;
    _ShortCode: TPressInteger;
  protected
    class function InternalMetadataStr: string; override;
  end;

const
  ACCOUNT_LEVELONE = 1;
  ACCOUNT_LEVELTHWO = 2;
  ACCOUNT_LEVELTHREE = 3;
  ACCOUNT_CODESEPARATOR = '.';


implementation

{ TAccountChartQuery }

class function TAccountChartQuery.InternalMetadataStr: string;
begin
  Result := 'TAccountChartQuery(TAccountChart) (' +
    'Code: PlainString(20) MatchType=mtStarting;' +
    'Name: AnsiString(40) MatchType=mtContains;' +
    'ShortCode: Integer MatchType=mtEqual;' +
    ')';
end;

{ TAccountChart }

function TAccountChart.GetCanHaveChild: Boolean;
begin
  Result := Self.Level < ACCOUNT_LEVELTHREE;
end;

function TAccountChart.GetChildCount: Integer;
begin
  Result := _ChildCount.Value;
end;

function TAccountChart.GetChildOf: TAccountChart;
begin
  Result := _ChildOf.Value as TAccountChart;
end;

function TAccountChart.GetCode: string;
begin
  Result := _Code.Value;
end;

function TAccountChart.GetLevel: Integer;
begin
  Result := _Level.Value;
end;

function TAccountChart.GetName: string;
begin
  Result := _Name.Value;
end;

function TAccountChart.GetRemarks: string;
begin
  Result := _Remarks.Value;
end;

function TAccountChart.GetShortCode: Integer;
begin
  Result := _ShortCode.Value;
end;

procedure TAccountChart.SetChildCount(AValue: Integer);
begin
  _ChildCount.Value := AValue;
end;

procedure TAccountChart.SetChildOf(AValue: TAccountChart);
begin
  _ChildOf.Value := AValue;
end;

procedure TAccountChart.SetCode(AValue: string);
begin
  _Code.Value := AValue;
end;

procedure TAccountChart.SetLevel(AValue: Integer);
begin
  _Level.Value := AValue;
end;

procedure TAccountChart.SetName(AValue: string);
begin
  _Name.Value := AValue;
end;

procedure TAccountChart.SetRemarks(AValue: string);
begin
  _Remarks.Value := AValue;
end;

procedure TAccountChart.SetShortCode(AValue: Integer);
begin
  _ShortCode.Value := AValue;
end;

class function TAccountChart.InternalMetadataStr: string;
begin
  Result := 'TAccountChart IsPersistent(' +
    'Code: PlainString(20);' +
    'Name: AnsiString(40);' +
    'Remarks: Memo;' +
    'ChildOf: Reference(TAccountChart);' +
    'Level: Integer DefaultValue=1;' +
    'Balance: Currency DefaultValue=0;' +
    'ShortCode: Integer;' +
    'ChildCount: Integer DefaultValue=0' +
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

finalization
  TAccountChart.UnregisterClass;
  TAccountChartQuery.UnregisterClass;

end.

