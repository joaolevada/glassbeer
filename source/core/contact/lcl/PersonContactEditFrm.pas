unit PersonContactEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TPersonContactEditForm }

  TPersonContactEditForm = class(TCustomEditForm)
    ExtensionLineEdit: TEdit;
    ExtensionLineLabel: TLabel;
    PersonComboBox: TComboBox;
    PersonLabel: TLabel;
    LabelComboBox: TComboBox;
    LabelLabel: TLabel;
  end;

implementation

uses
  PressXCLBroker,
  ContactMVP;

{$R *.lfm}

initialization
  PressXCLForm(TPersonContactEditPresenter, TPersonContactEditForm);

end.

