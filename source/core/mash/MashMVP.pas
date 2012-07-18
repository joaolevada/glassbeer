unit MashMVP;

{$I '..\include\glassbeer_defines.inc'}

interface

uses
  Classes,
  SysUtils,
  CustomMVP,
  MashBO;

type

  { TMashEditPresenter }

  TMashEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TMashQueryPresenter }

  TMashQueryPresenter = class(TCustomQueryPresenter)
  protected
    procedure InitPresenter; override;
    function InternalQueryItemsDisplayNames: string; override;
  end;

  { TMashItemEditPresenter }

  TMashItemEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

  { TMashIngredientItemEditPresenter }

  TMashIngredientItemEditPresenter = class(TCustomEditPresenter)
  protected
    procedure InitPresenter; override;
  end;

implementation

{ TMashIngredientItemEditPresenter }

procedure TMashIngredientItemEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('RawMaterial', 'RawMaterialCombo');
  CreateSubPresenter('Quantity', 'QuantityEdit');
  CreateSubPresenter('RawMaterial.Unity', 'UnityEdit');
end;

{ TMashItemEditPresenter }

procedure TMashItemEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Recipe', 'RecipeCombo');
  CreateSubPresenter('Volume', 'VolumeEdit');
  CreateSubPresenter('OriginalGravity', 'OriginalGravityEdit');
  CreateSubPresenter('MashIngredients', 'MashIngredientsGrid');
end;

{ TMashQueryPresenter }

procedure TMashQueryPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('Name', 'NameEdit');
end;

function TMashQueryPresenter.InternalQueryItemsDisplayNames: string;
begin
  Result := 'BasicUserRecordData.Code(198, "Código");' +
    'BasicUserRecordData.Name(356, "Nome");' +
    'Amount(99, "Quantidade")';
end;

{ TMashEditPresenter }

procedure TMashEditPresenter.InitPresenter;
begin
  inherited InitPresenter;
  CreateSubPresenter('BasicUserRecordData.Code', 'CodeEdit');
  CreateSubPresenter('BasicUserRecordData.Name', 'NameEdit');
  CreateSubPresenter('BasicUserRecordData.Remarks', 'RemarksMemo');
  CreateSubPresenter('MashItems', 'MashItemsGrid');
  CreateSubPresenter('AverageOriginalGravity', 'AverageOriginalGravityEdit');
  CreateSubPresenter('FinalGravity', 'FinalGravityEdit');
  CreateSubPresenter('Amount', 'AmountEdit');
  CreateSubPresenter('Fermenters', 'FermentersGrid');
end;

initialization
  TMashEditPresenter.RegisterBO(TMash);
  TMashIngredientItemEditPresenter.RegisterBO(TMashIngredientItem);
  TMashItemEditPresenter.RegisterBO(TMashItem);
  TMashQueryPresenter.RegisterBO(TMashQuery);

end.

