object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'INI'#37197#32622#25991#20214#25805#20316
  ClientHeight = 408
  ClientWidth = 261
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblName: TLabel
    Left = 32
    Top = 32
    Width = 36
    Height = 13
    Caption = #22995#21517#65306
  end
  object lblSex: TLabel
    Left = 32
    Top = 153
    Width = 36
    Height = 13
    Caption = #24615#21035#65306
  end
  object lblAge: TLabel
    Left = 32
    Top = 88
    Width = 36
    Height = 13
    Caption = #24180#40836#65306
  end
  object lblLike: TLabel
    Left = 32
    Top = 233
    Width = 24
    Height = 13
    Caption = #29233#22909
  end
  object lblAddr: TLabel
    Left = 32
    Top = 291
    Width = 24
    Height = 13
    Caption = #20303#22336
  end
  object rgSex: TRadioGroup
    Left = 74
    Top = 144
    Width = 104
    Height = 41
    TabOrder = 0
    Visible = False
  end
  object rbBoy: TRadioButton
    Left = 88
    Top = 152
    Width = 41
    Height = 17
    Caption = #30007
    TabOrder = 1
  end
  object rbGirl: TRadioButton
    Left = 135
    Top = 152
    Width = 49
    Height = 17
    Caption = #22899
    TabOrder = 2
  end
  object edtName: TEdit
    Left = 74
    Top = 29
    Width = 121
    Height = 21
    AutoSize = False
    TabOrder = 3
  end
  object edtAge: TEdit
    Left = 74
    Top = 85
    Width = 121
    Height = 21
    AutoSize = False
    NumbersOnly = True
    TabOrder = 4
  end
  object grpLike: TGroupBox
    Left = 74
    Top = 208
    Width = 121
    Height = 49
    TabOrder = 5
    object chkMoney: TCheckBox
      Left = 21
      Top = 24
      Width = 28
      Height = 17
      Caption = #38065
      TabOrder = 0
    end
    object chkProgram: TCheckBox
      Left = 55
      Top = 24
      Width = 97
      Height = 17
      Caption = #32534#31243
      TabOrder = 1
    end
  end
  object cbbAddr: TComboBox
    Left = 74
    Top = 288
    Width = 121
    Height = 21
    BevelOuter = bvNone
    Color = clWhite
    ItemIndex = 0
    TabOrder = 6
    Text = #24191#19996#33538#21517
    Items.Strings = (
      #24191#19996#33538#21517
      #24191#19996#20315#23665
      #24191#19996#25581#38451)
  end
  object btnSave: TButton
    Left = 88
    Top = 344
    Width = 75
    Height = 25
    Caption = #20445#23384#35774#32622
    TabOrder = 7
    OnClick = btnSaveClick
  end
end
