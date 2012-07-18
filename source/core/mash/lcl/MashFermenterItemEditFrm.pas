unit MashFermenterItemEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, Grids, CustomEditFrm;

type

  { TMashFermenterItemEditForm }

  TMashFermenterItemEditForm = class(TCustomEditForm)
    DaysSinceStartLabel: TLabel;
    DaysSinceStartEdit: TEdit;
    DaysSinceLastEventLabel: TLabel;
    DaysSinceLastEventEdit: TEdit;
    FermenterEventsLabel: TLabel;
    StartDateEdit: TEdit;
    StartDateLabel: TLabel;
    FermenterEventsGrid: TStringGrid;
    VolumeEdit: TEdit;
    FermenterCombo: TComboBox;
    FermenterLabel: TLabel;
    VolumeLabel: TLabel;
  end;


implementation

{$R *.lfm}

uses
  PressXCLBroker,
  FermenterMVP;

initialization
  PressXCLForm(TMashFermenterItemEditPresenter, TMashFermenterItemEditForm);

end.

