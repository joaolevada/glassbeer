unit ContactQueryFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, Grids, StdCtrls;

type

  { TContactQueryForm }

  TContactQueryForm = class(TForm)
    AddPersonButton: TBitBtn;
    AddButton1: TBitBtn;
    BottomPanel: TPanel;
    NameTabSheet: TTabSheet;
    NameEdit: TEdit;
    EditButton: TBitBtn;
    CodeEdit: TEdit;
    NameLabel: TLabel;
    CodeLabel: TLabel;
    QueryStringGrid: TStringGrid;
    RemoveButton: TBitBtn;
    SearchNameButton: TBitBtn;
    SearchNameButton1: TBitBtn;
    SearchPageControl: TPageControl;
    CodeTabSheet: TTabSheet;
  end;


implementation

uses
  PressXCLBroker,
  ContactMVP;

{$R *.lfm}

initialization
  PressXCLForm(TContactQueryPresenter, TContactQueryForm);

end.

