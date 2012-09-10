unit MashFermenterItemEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, Grids, CustomEditFrm;

type

  { TMashFermenterItemEditForm }

  TMashFermenterItemEditForm = class(TCustomEditForm)
    DaysSinceStartLabel: TLabel;
    DaysSinceStartEdit: TEdit;
    DaysSinceLastEventLabel: TLabel;
    DaysSinceLastEventEdit: TEdit;
    FermenterEventsLabel: TLabel;
    AddFermenterEventSpeedButton: TSpeedButton;
    EditFermenterEventSpeedButton: TSpeedButton;
    RemoveFermenterEventSpeedButton: TSpeedButton;
    AddFermenterSpeedButton: TSpeedButton;
    EditFermenterSpeedButton: TSpeedButton;
    StartDateEdit: TEdit;
    StartDateLabel: TLabel;
    FermenterEventsStringGrid: TStringGrid;
    VolumeEdit: TEdit;
    FermenterComboBox: TComboBox;
    FermenterLabel: TLabel;
    VolumeLabel: TLabel;
  public
    constructor Create(AOwner: TComponent); override;
  end;


implementation

{$R *.lfm}

uses
  PressXCLBroker,
  MashMVP,
  MainFrm;

{ TMashFermenterItemEditForm }

constructor TMashFermenterItemEditForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddFermenterEventSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditFermenterEventSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_DELETE, RemoveFermenterEventSpeedButton.Glyph);

  MainForm.Icons16ImageList.GetBitmap(IMG_ADD, AddFermenterSpeedButton.Glyph);
  MainForm.Icons16ImageList.GetBitmap(IMG_PENCIL, EditFermenterSpeedButton.Glyph);
end;

initialization
  PressXCLForm(TMashFermenterItemEditPresenter, TMashFermenterItemEditForm);

end.

