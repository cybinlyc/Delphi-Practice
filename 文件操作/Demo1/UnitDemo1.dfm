object Form1: TForm1
  Left = 544
  Top = 299
  Caption = #25991#20214#35835#20889#25805#20316#23398#20064
  ClientHeight = 373
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
  object btnWrite: TButton
    Left = 80
    Top = 24
    Width = 113
    Height = 41
    Caption = #25991#26412#25991#20214#20889#20837
    TabOrder = 0
    OnClick = btnWriteClick
  end
  object btnRead: TButton
    Left = 256
    Top = 24
    Width = 121
    Height = 41
    Caption = #25991#26412#25991#20214#35835#20986
    TabOrder = 1
    OnClick = btnReadClick
  end
  object btnRecord: TButton
    Left = 80
    Top = 104
    Width = 113
    Height = 41
    Caption = #20889#20837#35760#24405
    TabOrder = 2
    OnClick = btnRecordClick
  end
  object btnReadRecord: TButton
    Left = 256
    Top = 104
    Width = 121
    Height = 41
    Caption = #35835#32467#26500#20307
    TabOrder = 3
    OnClick = btnReadRecordClick
  end
  object mmoDispalyRecord: TMemo
    Left = 80
    Top = 192
    Width = 297
    Height = 153
    Lines.Strings = (
      '')
    TabOrder = 4
  end
end
