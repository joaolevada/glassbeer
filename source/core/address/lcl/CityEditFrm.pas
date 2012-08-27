unit CityEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TCityEditForm }

  TCityEditForm = class(TCustomEditForm)
    CodeEdit: TEdit;
    CodeLabel: TLabel;
    StateComboBox: TComboBox;
    StateLabel: TLabel;
    NameEdit: TEdit;
    NameLabel: TLabel;
    RemarksLabel: TLabel;
    RemarksMemo: TMemo;
  end;


implementation

uses
  AddressMVP,
  PressXCLBroker;

{$R *.lfm}

initialization
  PressXCLBroker(TCityEditPresenter, TCityEditForm);

end.

