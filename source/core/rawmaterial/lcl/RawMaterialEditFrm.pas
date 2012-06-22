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
    UnityCombo: TComboBox;
    RemarksMemo: TMemo;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  PressXCLBroker
  ,RawMaterialMVP;

const
  EDITFORM_WIDTH = 800;
  EDITFORM_HEIGHT = 600;

{$R *.lfm}

{ TRawMaterialEditForm }

constructor TRawMaterialEditForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Self.Width := EDITFORM_WIDTH;
  Self.Height := EDITFORM_HEIGHT;
end;

initialization
  PressXCLForm(TRawMaterialEditPresenter, TRawMaterialEditForm);

end.

