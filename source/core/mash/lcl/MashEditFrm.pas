unit MashEditFrm;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, StdCtrls, Grids, CustomEditFrm;

type

  { TMashEditForm }

  TMashEditForm = class(TCustomEditForm)
    CodeEdit: TEdit;
    CodeLabel: TLabel;
    AverageOriginalGravityLabel: TLabel;
    AverageOriginalGravityEdit: TEdit;
    AmountEdit: TEdit;
    FinalGravityEdit: TEdit;
    FinalGravityLabel: TLabel;
    AmountLabel: TLabel;
    FermentersLabel: TLabel;
    MashItemsLabel: TLabel;
    RemaksLabel: TLabel;
    NameEdit: TEdit;
    NameLabel: TLabel;
    MashItemsTab: TTabSheet;
    RemarksMemo: TMemo;
    MashItemsGrid: TStringGrid;
    FermentersTab: TTabSheet;
    FermentersGrid: TStringGrid;
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  MashEditForm: TMashEditForm;

implementation

{$R *.lfm}

end.

