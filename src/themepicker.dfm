object VCLThemepickerDlg: TVCLThemepickerDlg
  Left = 0
  Top = 0
  Caption = 'Choose a theme'
  ClientHeight = 379
  ClientWidth = 475
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainPanel: TPanel
    Left = 0
    Top = 0
    Width = 475
    Height = 379
    Align = alClient
    ShowCaption = False
    TabOrder = 0
    DesignSize = (
      475
      379)
    object ThemeLocationLbl: TLabel
      Left = 135
      Top = 23
      Width = 68
      Height = 11
      Caption = 'Theme Location:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object ThemeNamesCheckListBox: TCheckListBox
      Left = 16
      Top = 50
      Width = 443
      Height = 264
      OnClickCheck = ThemeNamesCheckListBoxClickCheck
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 13
      TabOrder = 0
    end
    object ConfirmBtn: TBitBtn
      Left = 16
      Top = 329
      Width = 113
      Height = 31
      Anchors = [akLeft, akBottom]
      Caption = #9989' Confirm'
      ModalResult = 1
      TabOrder = 1
    end
    object ExitBtn: TBitBtn
      Left = 346
      Top = 329
      Width = 113
      Height = 31
      Anchors = [akRight, akBottom]
      Caption = #10060' Exit'
      ModalResult = 8
      TabOrder = 2
    end
    object SetThemeLocationBtn: TBitBtn
      Left = 16
      Top = 13
      Width = 113
      Height = 31
      Anchors = [akLeft, akBottom]
      Caption = #55357#56510' Select Location'
      TabOrder = 3
      OnClick = SetThemeLocationBtnClick
    end
  end
end
