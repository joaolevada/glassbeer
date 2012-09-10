unit RawMaterialEditFrm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TRawMaterialEditForm }

  TRawMaterialEditForm = class(TCustomEditForm)
    CodeEdit: TEdit;
    CodeLabel: TLabel;
    MinimumStockEdit: TEdit;
    MaximumStockEdit: TEdit;
    MinimumStockLabel: TLabel;
    MaximumStockLabel: TLabel;
    RemarksLabel: TLabel;
    UnityLabel: TLabel;
    NameLabel: TLabel;
    NameEdit: TEdit;
    UnityComboBox: TComboBox;
    RemarksMemo: TMemo;
  end;

implementation

uses
  PressXCLBroker
  ,RawMaterialMVP;


{$R *.lfm}

initialization
  PressXCLForm(TRawMaterialEditPresenter, TRawMaterialEditForm);

end.

