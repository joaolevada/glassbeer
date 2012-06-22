unit RecipeIngredientItemEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TRecipeIngredientItemEditForm }

  TRecipeIngredientItemEditForm = class(TCustomEditForm)
    PercentageEdit: TEdit;
    PercentageLabel: TLabel;
    RawMaterialCombo: TComboBox;
    RawMaterialLabel: TLabel;
  end;


implementation

uses
  PressXCLBroker
  ,RecipeMVP;

{$R *.lfm}


initialization
  PressXCLForm(TRecipeIngredientItemEditPresenter,
    TRecipeIngredientItemEditForm);


end.

