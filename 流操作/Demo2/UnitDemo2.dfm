object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 435
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btnCopy: TButton
    Left = 64
    Top = 24
    Width = 105
    Height = 57
    Caption = #22797#21046
    TabOrder = 0
    OnClick = btnCopyClick
  end
  object btnWrite: TButton
    Left = 200
    Top = 24
    Width = 105
    Height = 57
    Caption = #20889#20986
    TabOrder = 1
    OnClick = btnWriteClick
  end
  object btnRead: TButton
    Left = 344
    Top = 24
    Width = 105
    Height = 57
    Caption = #35835#20837
    TabOrder = 2
    OnClick = btnReadClick
  end
  object mmoDisplay: TMemo
    Left = 0
    Top = 216
    Width = 505
    Height = 225
    Lines.Strings = (
      '')
    TabOrder = 3
  end
  object btnLoad: TButton
    Left = 200
    Top = 112
    Width = 105
    Height = 65
    Caption = #21152#36733#25968#25454
    TabOrder = 4
    OnClick = btnLoadClick
  end
end
