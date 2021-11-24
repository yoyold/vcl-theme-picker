unit themepicker;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CheckLst, Vcl.Buttons, Vcl.ExtCtrls;

type
  TVCLThemepickerDlg = class(TForm)
    MainPanel: TPanel;
    ThemesNamesCheckListListBox: TCheckListBox;
    ThemeLocationLbl: TLabel;
    ChangeThemeLocationBtn: TSpeedButton;
    ConfirmBtn: TBitBtn;
    ExitBtn: TBitBtn;
    procedure ChangeThemeLocationBtnClick(Sender: TObject);
    procedure ThemesNamesCheckListListBoxClickCheck(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);

  private
    procedure ChangeThemeLocation();
    procedure ChangeTheme();
    procedure FillThemeNameListBox();
    procedure UncheckOtherListBoxItems();

  private
    FThemeLocation : string;
    FThemeName     : string;

  public
    // public members
  end;

  var
    VCLThemepickerDlg: TVCLThemepickerDlg;


implementation

{$R *.dfm}

uses
  VCL.FileCtrl, VCL.Themes, System.IOUtils;

procedure TVCLThemepickerDlg.ChangeThemeLocationBtnClick(Sender: TObject);
begin
  ChangeThemeLocation();
end;

procedure TVCLThemepickerDlg.ExitBtnClick(Sender: TObject);
begin
  VCLThemepickerDlg.Close();
end;

procedure TVCLThemepickerDlg.ThemesNamesCheckListListBoxClickCheck(Sender: TObject);
begin
  FThemeName := ThemesNamesCheckListListBox.Items[ThemesNamesCheckListListBox.ItemIndex];
  UncheckOtherListBoxItems();
  ChangeTheme();
end;

procedure TVCLThemepickerDlg.ChangeThemeLocation();
var
  LocationDialog: TFileOpenDialog;
begin
  LocationDialog := TFileOpenDialog.Create(nil);
  try
    LocationDialog.Title   := 'Select themes folder';
    LocationDialog.Options := [fdoPickFolders, fdoPathMustExist];
    if LocationDialog.Execute then
      FThemeLocation           := LocationDialog.FileName;
      ThemeLocationLbl.Caption := FThemeLocation;
      FillThemeNameListBox();
  finally
    LocationDialog.Free;
  end;
end;

procedure TVCLThemepickerDlg.FillThemeNameListBox();
var
  LSearchrec: TSearchRec;
begin
  ThemesNamesCheckListListBox.Clear;
    if FindFirst(FThemeLocation + '\*.vsf', faAnyFile, LSearchrec) = 0 then begin
      repeat
        FThemeName := TPath.GetFileNameWithoutExtension(LSearchrec.Name);
        ThemesNamesCheckListListBox.AddItem(FThemeName, nil);
      until FindNext(LSearchrec) <> 0;
      FindCLose(LSearchrec);
    end;
      // ThemesNamesCheckListListBox.AddItem('Windows', nil);
end;

procedure TVCLThemepickerDlg.ChangeTheme();
begin
  TStyleManager.TrySetStyle(FThemeName);
end;

procedure TVCLThemepickerDlg.UncheckOtherListBoxItems();
var
  LCounter : integer;
begin
  for LCounter := 0 to ThemesNamesCheckListListBox.items.count-1 do begin
    if (LCounter <> ThemesNamesCheckListListBox.ItemIndex) then
      ThemesNamesCheckListListBox.Checked[LCounter]:= false;
  end;
end;

end.
