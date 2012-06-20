unit RecipeQueryFrm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, ComCtrls, Grids, StdCtrls, CustomQueryFrm;

type

  { TRecipeQueryForm }

  TRecipeQueryForm = class(TCustomQueryForm)
    NameEdit: TEdit;
    NameLabel: TLabel;
  end; 

implementation

uses
  PressXCLBroker
  ,RecipeMVP;

{$R *.lfm}

initialization
  PressCXLForm(TRecipeQueryForm, TRecipeQueryPresenter);

end.

