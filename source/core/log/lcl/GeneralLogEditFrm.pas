unit GeneralLogEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TGeneralLogEditForm }

  TGeneralLogEditForm = class(TCustomEditForm)
    RemarkedAtEdit: TEdit;
    RemarkedAtLabel: TLabel;
    RemarksLabel: TLabel;
    RemarksMemo: TMemo;
  end;

implementation

{$R *.lfm}

uses
  LogMVP,
  PressXCLBroker;

initialization
  PressXCLForm(TGeneralLogEditPresenter, TGeneralLogEditForm);

end.

