unit FermenterEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, CustomEditFrm;

type

  { TFermenterEditForm }

  TFermenterEditForm = class(TCustomEditForm)
    CodeEdit: TEdit;
    CodeLabel: TLabel;
    RemarksLabel: TLabel;
    RemarksMemo: TMemo;
    AddLocationSpeedButton: TSpeedButton;
    EditLocationSpeedButton: TSpeedButton;
    StatusComboBox: TComboBox;
    CurrentVolumeLabel: TLabel;
    CurrentVolumeEdit: TEdit;
    StatusLabel: TLabel;
    LocationComboBox: TComboBox;
    LocationLabel: TLabel;
    UtilCapacityEdit: TEdit;
    HeadSpaceEdit: TEdit;
    FullCapacityEdit: TEdit;
    FullCapacityLabel: TLabel;
    HeadSpaceLabel: TLabel;
    UtilCapacityLabel: TLabel;
    NameEdit: TEdit;
    NameLabel: TLabel;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  PressXCLBroker,
  FermenterMVP,
  MainFrm;

{ TFermenterEditForm }

constructor TFermenterEditForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddLocationSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditLocationSpeedButton.Glyph);
end;

{$R *.lfm}

initialization
  PressXCLForm(TFermenterEditPresenter, TFermenterEditForm);

end.

