unit RecipeEditFrm; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, Grids, CustomEditFrm;

type

  { TRecipeEditForm }

  TRecipeEditForm = class(TCustomEditForm)
    CodeEdit: TEdit;
    FinalGravityEdit: TEdit;
    FinalGravityLabel: TLabel;
    IngredientsLabel: TLabel;
    OriginalGravityEdit: TEdit;
    OriginalGravityLabel: TLabel;
    StringGrid1: TStringGrid;
    WaterAmountEdit: TEdit;
    CodeLabel: TLabel;
    AgeForEdit: TEdit;
    WaterAmountLabel: TLabel;
    FamilyCombo: TComboBox;
    FamilyLabel: TLabel;
    NameEdit: TEdit;
    NameLabel: TLabel;
    RemarksLabel: TLabel;
    RemarksMemo: TMemo;
    IngredientsTab: TTabSheet;
    AgeForLabel: TLabel;
  end;


implementation

uses
  PressXCLBroker
  ,RecipeMVP;

initialization
  PressXCLForm(TRecipeEditPresenter,TRecipeEditForm);

{$R *.lfm}

end.

