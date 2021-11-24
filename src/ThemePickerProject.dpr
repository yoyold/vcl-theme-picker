program ThemePickerProject;

uses
  Vcl.Forms,
  themepicker in 'themepicker.pas' {VCLThemepickerDlg},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TVCLThemepickerDlg, VCLThemepickerDlg);
  Application.CreateForm(TVCLThemepickerDlg, VCLThemepickerDlg);
  Application.Run;
end.
