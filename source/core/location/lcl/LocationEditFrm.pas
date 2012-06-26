unit LocationEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TLocationEditForm }

  TLocationEditForm = class(TCustomEditForm)
    CodeLabel: TLabel;
    CodeEdit: TEdit;
    RemarksLabel: TLabel;
    NameEdit: TEdit;
    NameLabel: TLabel;
    RemarksMemo: TMemo;
  end; 


implementation

uses
  PressXCLBroker
  ,LocationMVP;

{$R *.lfm}

initialization
  PressXCLForm(TLocationEditPresenter, TLocationEditForm);

end.

