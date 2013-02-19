unit AccountChartEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TAccountChartEditForm }

  TAccountChartEditForm = class(TCustomEditForm)
    ChildOfComboBox: TComboBox;
    ChildOfLabel: TLabel;
    CodeEdit: TEdit;
    CodeLabel: TLabel;
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

initialization
  PressXCLForm(TAccountChartEditPresenter, TAccountChartEditForm);

{$R *.lfm}

end.

