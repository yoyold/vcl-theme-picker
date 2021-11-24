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
  TStyleManager.TrySetStyle('Glossy');
  Application.CreateForm(TVCLThemepickerDlg, VCLThemepickerDlg);
  Application.CreateForm(TVCLThemepickerDlg, VCLThemepickerDlg);
  Application.Run;
end.
