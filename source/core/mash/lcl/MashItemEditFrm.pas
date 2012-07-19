unit MashItemEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, Grids, CustomEditFrm;

type

  { TMashItemEditForm }

  TMashItemEditForm = class(TCustomEditForm)
    MashIngredientsLabel: TLabel;
    OriginalGravityEdit: TEdit;
    OriginalGravityLabel: TLabel;
    MashIngredientsGrid: TStringGrid;
    VolumeEdit: TEdit;
    VolumeLabel: TLabel;
    RecipeCombo: TComboBox;
    RecipeLabel: TLabel;
  end;


implementation

{$R *.lfm}

uses
  PressXCLBroker,
  MashMVP;

initialization
  PressXCLForm(TMashItemEditPresenter, TMashItemEditForm);

end.

