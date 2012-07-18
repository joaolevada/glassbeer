unit FermenterEventEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TFermenterEventEditForm }

  TFermenterEventEditForm = class(TCustomEditForm)
    CodeEdit: TEdit;
    CodeLabel: TLabel;
    DurationLabel: TLabel;
    DurationEdit: TEdit;
    TemperatureEdit: TEdit;
    TemperatureLabel: TLabel;
    NameEdit: TEdit;
    NameLabel: TLabel;
    RemarksLabel: TLabel;
    RemarksMemo: TMemo;
  end;


implementation

{$R *.lfm}

uses
  PressXCLBroker,
  FermenterMVP;

initialization
  PressXCLForm(TFermenterEventEditPresenter, TFermenterEventEditForm);

end.

