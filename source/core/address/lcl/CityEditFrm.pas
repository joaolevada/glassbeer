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
    AddStateSpeedButton: TSpeedButton;
    EditStateSpeedButton: TSpeedButton;
    StateComboBox: TComboBox;
    StateLabel: TLabel;
    NameEdit: TEdit;
    NameLabel: TLabel;
    RemarksLabel: TLabel;
    RemarksMemo: TMemo;
  public
    constructor Create(AOwner: TComponent); override;
  end;


implementation

uses
  AddressMVP,
  PressXCLBroker,
  MainFrm;

{ TCityEditForm }

constructor TCityEditForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddStateSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditStateSpeedButton.Glyph);
end;

{$R *.lfm}

initialization
  PressXCLForm(TCityEditPresenter, TCityEditForm);

end.

