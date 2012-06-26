unit RawMaterialMVP;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  CustomMVP
  ,PressXCLBroker;

type

  { TRawMaterialEditPresenter }

  TRawMaterialEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TRawMaterialQueryPresenter }

  TRawMaterialQueryPresenter = class(TCustomQueryPresenter)
  protected
    procedure InitPresenter; override;
    function InternalQueryItemsDisplayNames: string; override;
  end;

implementation

uses
  RawMaterialBO;

{ TRawMaterialEditPresenter }

procedure TRawMaterialEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('BasicUserRecordData.Code', 'CodeEdit');
  CreateSubPresenter('BasicUserRecordData.Name', 'NameEdit');
  CreateSubPresenter('BasicUserRecordData.Remarks', 'RemarksMemo');
  CreateSubPresenter('Unity', 'UnityCombo');
  CreateSubPresenter('MinimumStock', 'MinimumStockEdit');
  CreateSubPresenter('MaximumStock', 'MaximumStockEdit');
end;

{ TRawMaterialQueryPresenter }

procedure TRawMaterialQueryPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Name', 'NameEdit');
end;

function TRawMaterialQueryPresenter.InternalQueryItemsDisplayNames: string;
begin
  Result := 'BasicUserRecordData.Code(198, "Código");' +
    'BasicUserRecordData.Name(356, "Descrição");' +
    'Unity(198, "Unidade")';
end;

initialization
  TRawMaterialEditPresenter.RegisterBO(TRawMaterial);
  TRawMaterialQueryPresenter.RegisterBO(TRawMaterialQuery);

end.

