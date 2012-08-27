unit StateEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TStateEditForm }

  TStateEditForm = class(TCustomEditForm)
    CodeEdit: TEdit;
    CodeLabel: TLabel;
    NameEdit: TEdit;
    NameLabel: TLabel;
    RemarksLabel: TLabel;
    RemarksMemo: TMemo;
    CountryComboBox: TComboBox;
    CountryLabel: TLabel;
  end;


implementation

uses
  AddressMVP,
  PressXCLBroker;

{$R *.lfm}

initialization
  PressXCLForm(TStateEditPresenter, StateEditForm);

end.

