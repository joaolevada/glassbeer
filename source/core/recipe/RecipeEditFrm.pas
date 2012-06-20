unit RecipeEditFrm; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, 
    CustomEditFrm; 

type
  TRecipeEditForm = class(TCustomEditForm)
  end;


implementation

uses
  PressXCLBroker
  ,RecipeMVP;

initialization
  PressXCLForm(TRecipeEditForm, TRecipeEditPresenter);

{$R *.lfm}

end.

