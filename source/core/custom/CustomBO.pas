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
    function ValidateAttribute(AAttribute: TPressAttribute;
        out AMessage: string): Boolean;
  public
    class function ObjectMetadataClass: TPressObjectMetadataClass; override;
    function Validate(out AErrors: TStringList): Boolean;
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
    FDisplayName: string;
    FIsMandatory: Boolean;
    FMin: Double;
    FMinFlag: Boolean;
    FMax: Double;
    FMaxFlag: Boolean;
    procedure SetMin(AValue: Double);
    procedure SetMax(AValue: Double);
    procedure SetMandatory(AValue: Boolean);
  public
    property MinFlag: Boolean read FMinFlag;
    property MaxFlag: Boolean read FMaxFlag;
  published
    property IsMandatory: Boolean read FIsMandatory write SetMandatory;
    property DisplayName: string read FDisplayName write FDisplayName;
    property Min: Double read FMin write SetMin;
    property Max: Double read FMax write SetMax;
  end;

implementation


{ TCustomObjectMetadata }

function TCustomObjectMetadata.InternalAttributeMetadataClass: TPressAttributeMetadataClass;
begin
  Result := TCustomAttributeMetadata;
end;

{ TCustomAttributeMetadata }

procedure TCustomAttributeMetadata.SetMin(AValue: Double);
begin
  FMin := AValue;
  FMinFlag := True;
end;

procedure TCustomAttributeMetadata.SetMax(AValue: Double);
begin
  FMax := AValue;
  FMaxFlag := True;
end;

procedure TCustomAttributeMetadata.SetMandatory(AValue: Boolean);
begin
  FIsMandatory := AValue;
end;

{ TCustomObject }

function TCustomObject.ValidateAttribute(AAttribute: TPressAttribute;
    out AMessage: string): Boolean;
var
  VAttribute: TCustomAttributeMetadata;
  VAttributeName: string;
begin
  AMessage := EmptyStr;
  VAttribute := (AAttribute.Metadata as TCustomAttributeMetadata);
  { TODO 1 -ojoaolevada -cstructure : Return multiple validation messages? }
  { TODO 1 -ojoaolevada -crefactoring : Remove variable VAttributeName }
  if  (VAttribute.IsMandatory) and (AAttribute.IsEmpty) then
    AMessage := 'não pode ficar em branco.'
  else if (VAttribute.MinFlag) and (AAttribute.AsDouble < VAttribute.Min) then
    AMessage := Format('tem de ser maior que %f.', [VAttribute.Min])
  else if (VAttribute.MaxFlag) and (AAttribute.AsDouble > VAttribute.Max) then
    AMessage := Format('tem de ser menor que %f.', [VAttribute.Max]);

  Result := AMessage = EmptyStr;
end;

class function TCustomObject.ObjectMetadataClass: TPressObjectMetadataClass;
begin
  Result := TCustomObjectMetadata;
end;

function TCustomObject.Validate(out AErrors: TStringList): Boolean;
var
  I: Integer;
  VAttribute: TPressAttribute;
  VAttributeMetadata: TCustomAttributeMetadata;
  VError: string;
begin
  { TODO 1 -ojoaolevada -cimplementation : Return a list of attributes that don't conform with validation rule. And for each attribute a message. }
  for I := 0 to Pred(AttributeCount) do
  begin
    VAttribute := Attributes[I];
    VAttributeMetadata := VAttribute.Metadata as TCustomAttributeMetadata;
    if VAttribute is TPressItem then
      (TPressItem(VAttribute).Value as TCustomObject).Validate(AErrors)
    else if not ValidateAttribute(VAttribute, VError) then
      AErrors.Append(Format('%s %s', [VAttributeMetadata.DisplayName, VError]));
  end;
  Result := AErrors.Count = 0;
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

