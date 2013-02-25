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
  protected
    class function InternalMetadataStr: string; override;
  end;

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

initialization
  TAccountChart.RegisterClass;
  TAccountChartQuery.RegisterClass;
  TAccountChartReference.RegisterAttribute;

finalization
  TAccountChart.UnregisterClass;
  TAccountChartQuery.UnregisterClass;
  TAccountChartReference.UnregisterAttribute;

end.

