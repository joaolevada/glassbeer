unit AccountChartBO;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  {Classes,
  SysUtils,}
  CustomBO,
  BasicUserRecordDataBO,
  PressAttributes;

type

  { TAccountChart }

  TAccountChart = class(TCustomObject)
    _BasicUserRecordData: TBasicUserRecordDataPart;
    _ChildOf: TPressReference; //TAccountChart
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

class function TAccountChart.InternalMetadataStr: string;
begin
  Result := 'TAccountChart IsPersistent(' +
    'BasicUserRecordData: TBasicUserRecordDataPart;' +
    'ChildOf: Reference(TAccountChart);' +
    'Level: Integer;' +
    'Balance: Currency DefaultValue="0";' +
    'ShortCode: Integer;' +
    ')';
end;

initialization
  TAccountChart.RegisterClass;
  TAccountChartQuery.RegisterClass;

finalization
  TAccountChart.UnregisterClass;
  TAccountChartQuery.UnregisterClass;

end.

