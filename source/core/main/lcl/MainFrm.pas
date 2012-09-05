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
    Icons16ImageList: TImageList;
    Icons32ImageList: TImageList;
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

const
  { image index constants }
  IMG_ACCEPT = 0;
  IMG_CANCEL = 1;
  IMG_ADD = 2;
  IMG_PENCIL = 3;
  IMG_DELETE = 4;
  IMG_USER = 5;
  IMG_FACTORY = 6;
  IMG_ZOOM = 7;

implementation

{$R *.lfm}

end.

