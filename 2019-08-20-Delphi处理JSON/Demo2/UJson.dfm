object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 449
  ClientWidth = 315
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
  object MyBtn1: TButton
    Left = 32
    Top = 40
    Width = 89
    Height = 25
    Caption = 'JSON'#23545#35937
    TabOrder = 0
    OnClick = MyBtn1Click
  end
  object MyBtn2: TButton
    Left = 168
    Top = 40
    Width = 89
    Height = 25
    Caption = 'JSON'#25968#32452
    TabOrder = 1
    OnClick = MyBtn2Click
  end
  object MyMemo: TMemo
    Left = 0
    Top = 192
    Width = 321
    Height = 257
    TabOrder = 2
  end
end
