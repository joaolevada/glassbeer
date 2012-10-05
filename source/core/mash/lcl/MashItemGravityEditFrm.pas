unit MashItemGravityEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TMashItemGravityEditForm }

  TMashItemGravityEditForm = class(TCustomEditForm)
    BrixEdit: TEdit;
    BrixLabel: TLabel;
    InputTypeComboBox: TComboBox;
    InputTypeLabel: TLabel;
    MeasuredAtEdit: TEdit;
    MeasuredAtLabel: TLabel;
    SpecificGravityEdit: TEdit;
    SpecificGravityLabel: TLabel;
  end;

implementation

uses
  PressXCLBroker,
  MashItemLogMVP;

{$R *.lfm}

initialization
  PressXCLForm(TMashItemGravityEditPresenter, TMashItemGravityEditForm);

end.

