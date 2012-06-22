object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'Delphi sugarcrm REST API'
  ClientHeight = 497
  ClientWidth = 775
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 50
    Height = 16
    Caption = 'REST url'
  end
  object Label2: TLabel
    Left = 8
    Top = 38
    Width = 62
    Height = 16
    Caption = 'User name'
  end
  object Label3: TLabel
    Left = 8
    Top = 68
    Width = 55
    Height = 16
    Caption = 'Password'
  end
  object edRESTUrl: TEdit
    Left = 76
    Top = 5
    Width = 309
    Height = 24
    TabOrder = 0
    Text = 'http://sugarcrm.lot/service/v2/rest.php'
  end
  object edUserName: TEdit
    Left = 76
    Top = 35
    Width = 121
    Height = 24
    TabOrder = 1
    Text = 'admin'
  end
  object edPasswd: TEdit
    Left = 76
    Top = 65
    Width = 121
    Height = 24
    TabOrder = 2
    Text = 'admin'
  end
  object btInit: TButton
    Left = 8
    Top = 101
    Width = 377
    Height = 25
    Caption = 'Init'
    TabOrder = 3
    OnClick = btInitClick
  end
end
