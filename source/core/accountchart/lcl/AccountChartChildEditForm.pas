unit AccountChartChildEditForm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TAccountChartChildEditForm }

  TAccountChartChildEditForm = class(TCustomEditForm)
    CodeEdit: TEdit;
    CodeLabel: TLabel;
    LevelEdit: TEdit;
    LevelLabel: TLabel;
    NameEdit: TEdit;
    NameLabel: TLabel;
    RemarksLabel: TLabel;
    RemarksMemo: TMemo;
    ShortCodeEdit: TEdit;
    ShortCodeLabel: TLabel;
  end;

implementation

uses
  PressXCLBroker,
  AccountChartMVP;

{$R *.lfm}

end.

