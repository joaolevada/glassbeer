unit RawMaterialBO;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  CustomBO,
  PressAttributes,
  PressSubject,
  BasicUserRecordDataBO;

type

  TUnity = (uGram, uKilogram, uMilliliter, uLiter);

  { TRawMaterial }

  TRawMaterial = class(TCustomObject)
    _BasicUserRecordData: TBasicUserRecordDataPart;
    _Unity: TPressEnum;
  private
    function GetCode: string;
    function GetName: string;
    function GetRemakars: string;
    function GetUnity: TUnity;
    procedure SetCode(const AValue: string);
    procedure SetName(const AValue: string);
    procedure SetRemarks(const AValue: string);
    procedure SetUnity(const AValue: TUnity);
  public
    class function InternalMetadataStr: string; override;
  published
    property Code: string read GetCode write SetCode;
    property Name: string read GetName write SetName;
    property Remarks: string read GetRemakars write SetRemarks;
    property Unity: TUnity read GetUnity write SetUnity;
  end;

  { TRawMaterialQuery }

  TRawMaterialQuery = class(TCustomQuery)
    _Name: TPressAnsiString;
  protected
    class function InternalMetadataStr: string; override;
  end;

  { TRawMaterialReference }

  TRawMaterialReference = class(TCustomReference)
  public
    class function ValidObjectClass: TPressObjectClass; override;
  end;

implementation

{ TRawMaterial }

function TRawMaterial.GetCode: string;
begin
  Result := TBasicUserRecordData(_BasicUserRecordData.Value).Code ;
end;

function TRawMaterial.GetName: string;
begin
  Result := TBasicUserRecordData(_BasicUserRecordData.Value).Name;
end;

function TRawMaterial.GetRemakars: string;
begin
  Result := TBasicUserRecordData(_BasicUserRecordData.Value).Remarks;
end;

function TRawMaterial.GetUnity: TUnity;
begin
  Result := TUnity(_Unity.Value);
end;

procedure TRawMaterial.SetCode(const AValue: string);
begin
  TBasicUserRecordData(_BasicUserRecordData.Value).Code := AValue;
end;

procedure TRawMaterial.SetName(const AValue: string);
begin
  TBasicUserRecordData(_BasicUserRecordData.Value).Name := AValue;
end;

procedure TRawMaterial.SetRemarks(const AValue: string);
begin
  TBasicUserRecordData(_BasicUserRecordData.Value).Remarks := AValue;
end;

procedure TRawMaterial.SetUnity(const AValue: TUnity);
begin
  _Unity.Value := LongInt(AValue);
end;

class function TRawMaterial.InternalMetadataStr: string;
begin
  Result := 'TRawMaterial IsPersistent (' +
    'BasicUserRecordData: TBasicUserRecordDataPart ShortName="BasicURD";' +
    'Unity: Enum(TUnity);' +
    ')';
end;

{ TRawMaterialReference }

class function TRawMaterialReference.ValidObjectClass: TPressObjectClass;
begin
  Result := TRawMaterial;
end;

{ TRawMaterialQuery }

class function TRawMaterialQuery.InternalMetadataStr: string;
begin
  Result := 'TRawMaterialQuery(TRawMaterial) (' +
    'Name: AnsiString(40) MatchType=mtContains;' +
    ')';
end;

initialization
  TRawMaterial.RegisterClass;
  TRawMaterialQuery.RegisterClass;
  TRawMaterialReference.RegisterAttribute;
  PressModel.RegisterEnumMetadata(TypeInfo(TUnity), 'TUnity',
    [
    'Grama (gr)',
    'Quilograma (kg)',
    'Mililitro (ml)',
    'Litro (l)'
    ]);

finalization
  TRawMaterial.UnregisterClass;
  TRawMaterialQuery.UnregisterClass;
  TRawMaterialReference.UnregisterAttribute;

end.

