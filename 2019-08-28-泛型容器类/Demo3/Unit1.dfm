object MyForm: TMyForm
  Left = 496
  Top = 183
  Caption = #27867#22411#23481#22120#31867'-'#23383#20856
  ClientHeight = 488
  ClientWidth = 506
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object btnAdd: TButton
    Left = 32
    Top = 72
    Width = 75
    Height = 25
    Caption = #28155#21152
    TabOrder = 0
    OnClick = btnAddClick
  end
  object btnDelete: TButton
    Left = 136
    Top = 72
    Width = 75
    Height = 25
    Caption = #21024#38500
    TabOrder = 1
    OnClick = btnDeleteClick
  end
  object btnFind: TButton
    Left = 240
    Top = 72
    Width = 75
    Height = 25
    Caption = #26597#35810
    TabOrder = 2
    OnClick = btnFindClick
  end
  object btnUpdate: TButton
    Left = 344
    Top = 72
    Width = 75
    Height = 25
    Caption = #20462#25913
    TabOrder = 3
  end
  object MyMemo: TMemo
    Left = 0
    Top = 192
    Width = 505
    Height = 297
    TabOrder = 4
  end
end
