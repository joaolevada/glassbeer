unit CustomBO;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  PressSubject,
  PressAttributes;

type

  { TCustomObject }

  TCustomObject = class(TPressObject)
  private
    procedure ValidateAttribute(AAttribute: TPressAttribute;
        out AMessage: string);
  public
    class function ObjectMetadataClass: TPressObjectMetadataClass; override;
    function Validate: Boolean;
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

  { TCustomObjectMetadata }

  TCustomObjectMetadata = class(TPressObjectMetadata)
  protected
    function InternalAttributeMetadataClass: TPressAttributeMetadataClass; override;
  end;

  { TCustomAttributeMetadata }

  TCustomAttributeMetadata = class(TPressAttributeMetadata)
  private
    FMandatory: Boolean;
    FMinInt: Integer;
    FMinIntFlag: Boolean;
    FMaxInt: Integer;
    FMaxIntFlag: Boolean;
    procedure SetMinInt(AValue: Integer);
    procedure SetMaxInt(AValue: Integer);
    procedure SetMandatory(AValue: Boolean);
  public
    property MinIntFlag: Boolean read FMinIntFlag;
    property MaxIntFlag: Boolean read FMaxIntFlag;
  published
    property Mandatory: Boolean read FMandatory write SetMandatory;
    property MinInt: Integer read FMinInt write SetMinInt;
    property MaxInt: Integer read FMaxInt write SetMaxInt;
  end;

implementation


{ TCustomObjectMetadata }

function TCustomObjectMetadata.InternalAttributeMetadataClass: TPressAttributeMetadataClass;
begin
  Result := TCustomAttributeMetadata;
end;

{ TCustomAttributeMetadata }

procedure TCustomAttributeMetadata.SetMinInt(AValue: Integer);
begin
  FMinInt := AValue;
  FMinIntFlag := True;
end;

procedure TCustomAttributeMetadata.SetMaxInt(AValue: Integer);
begin
  FMaxInt := AValue;
  FMaxIntFlag := True;
end;

procedure TCustomAttributeMetadata.SetMandatory(AValue: Boolean);
begin
  FMandatory := AValue;
end;

{ TCustomObject }

procedure TCustomObject.ValidateAttribute(AAttribute: TPressAttribute;
    out AMessage: string);
var
  VAttribute: TCustomAttributeMetadata;
begin
  AMessage := '';
  VAttribute := (AAttribute.Metadata as TCustomAttributeMetadata);
  { TODO 1 -ojoaolevada -cstructure : Return multiple validation messages? }
  if (VAttribute.Mandatory) and (AAttribute.IsEmpty) then
    AMessage := 'deve ser preenchido.'
  else if (VAttribute.MinIntFlag) and (AAttribute.AsInteger < VAttribute.MinInt) then
    AMessage := Format('tem de ser maior que %d.', [VAttribute.MinInt])
  else if (VAttribute.MaxIntFlag) and (AAttribute.AsInteger > VAttribute.MaxInt) then
    AMessage := Format('tem de ser menor que %d.', [VAttribute.MaxInt]);
end;

class function TCustomObject.ObjectMetadataClass: TPressObjectMetadataClass;
begin
  Result := TCustomObjectMetadata;
end;

function TCustomObject.Validate: Boolean;
var
  I: Integer;
begin
  { TODO 1 -ojoaolevada -cimplementation : Return a list of attribute - message to be processed on model view presenter }
  for I := 0 to Pred(AttributeCount) do
  try
    ValidateAttribute(Attributes[I]);
    Result := True;
  except
    Result := False;
  end;
end;

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

