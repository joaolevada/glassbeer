unit MashIngredientItemEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TMashIngredientItemEditForm }

  TMashIngredientItemEditForm = class(TCustomEditForm)
    UnityEdit: TEdit;
    UnityLabel: TLabel;
    QuantityLabel: TLabel;
    QuantityEdit: TEdit;
    RawMaterialCombo: TComboBox;
    RawMaterialLabel: TLabel;
  end;


implementation

{$R *.lfm}

uses
  PressXCLBroker,
  MashMVP;

initialization
  PressXCLForm(TMashIngredientItemEditPresenter, TMashIngredientItemEditForm);

end.

