unit MainFrm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus;

type

  { TMainForm }

  TMainForm = class(TForm)
    GlassBeerMainMenu: TMainMenu;
    FileMenu: TMenuItem;
    ExitMenuItem: TMenuItem;
    MenuItem1: TMenuItem;
    LocationMenuItem: TMenuItem;
    FermentacaoMenu: TMenuItem;
    FermenterMenuItem: TMenuItem;
    FermenterEventMenuItem: TMenuItem;
    MashMenuItem: TMenuItem;
    ContactMenuItem: TMenuItem;
    RecipeMenuItem: TMenuItem;
    MetadataMenuItem: TMenuItem;
    ToolsMenu: TMenuItem;
    RawMaterialMenuItem: TMenuItem;
  end; 

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

end.

