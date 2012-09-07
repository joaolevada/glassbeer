unit PersonEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, Grids, ContactEditFrm;

type

  { TPersonEditForm }

  TPersonEditForm = class(TContactEditForm)
    CPFLabel: TLabel;
    CPFEdit: TEdit;
    RGEdit: TEdit;
    RGLabel: TLabel;
    AddSpouseSpeedButton: TSpeedButton;
    EditSpouseSpeedButton: TSpeedButton;
    SpouseComboBox: TComboBox;
    SpouseLabel: TLabel;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  PressXCLBroker,
  ContactMVP,
  MainFrm;

{ TPersonEditForm }

constructor TPersonEditForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddSpouseSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditSpouseSpeedButton.Glyph);
end;

{$R *.lfm}

initialization
  PressXCLForm(TPersonEditPresenter, TPersonEditForm);

end.

