unit themepicker;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CheckLst, Vcl.Buttons, Vcl.ExtCtrls;

type
  TVCLThemepickerDlg = class(TForm)
    MainPanel: TPanel;
    ThemeNamesCheckListBox: TCheckListBox;
    ThemeLocationLbl: TLabel;
    ConfirmBtn: TBitBtn;
    ExitBtn: TBitBtn;
    SetThemeLocationBtn: TBitBtn;
    procedure ChangeThemeLocationBtnClick(Sender: TObject);
    procedure ThemeNamesCheckListBoxClickCheck(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure SetThemeLocationBtnClick(Sender: TObject);

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

procedure TVCLThemepickerDlg.ThemeNamesCheckListBoxClickCheck(Sender: TObject);
begin
  FThemeName := ThemeNamesCheckListBox.Items[ThemeNamesCheckListBox.ItemIndex];
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
  ThemeNamesCheckListBox.Clear;
    if FindFirst(FThemeLocation + '\*.vsf', faAnyFile, LSearchrec) = 0 then begin
      repeat
        FThemeName := TPath.GetFileNameWithoutExtension(LSearchrec.Name);
        ThemeNamesCheckListBox.AddItem(FThemeName, nil);
      until FindNext(LSearchrec) <> 0;
      FindCLose(LSearchrec);
    end;
end;

procedure TVCLThemepickerDlg.SetThemeLocationBtnClick(Sender: TObject);
begin
    ChangeThemeLocation();
end;

procedure TVCLThemepickerDlg.ChangeTheme();
begin
  TStyleManager.TrySetStyle(FThemeName);
end;

procedure TVCLThemepickerDlg.UncheckOtherListBoxItems();
var
  LCounter : integer;
begin
  for LCounter := 0 to ThemeNamesCheckListBox.items.count-1 do begin
    if (LCounter <> ThemeNamesCheckListBox.ItemIndex) then
      ThemeNamesCheckListBox.Checked[LCounter]:= false;
  end;
end;

end.
