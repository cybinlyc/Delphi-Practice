object Form1: TForm1
  Left = 496
  Top = 316
  Caption = 'Form1'
  ClientHeight = 445
  ClientWidth = 537
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MyMemo: TMemo
    Left = 0
    Top = 200
    Width = 537
    Height = 249
    BorderStyle = bsNone
    TabOrder = 0
  end
  object btnAdd: TButton
    Left = 24
    Top = 80
    Width = 75
    Height = 25
    Caption = #28155#21152
    TabOrder = 1
    OnClick = btnAddClick
  end
  object btnDelete: TButton
    Left = 128
    Top = 80
    Width = 75
    Height = 25
    Caption = #21024#38500
    TabOrder = 2
  end
  object btnFind: TButton
    Left = 232
    Top = 80
    Width = 75
    Height = 25
    Caption = #26597#35810
    TabOrder = 3
    OnClick = btnFindClick
  end
  object btnClean: TButton
    Left = 336
    Top = 80
    Width = 75
    Height = 25
    Caption = #28165#38500
    TabOrder = 4
  end
  object btnUpadte: TButton
    Left = 432
    Top = 80
    Width = 75
    Height = 25
    Caption = #20462#25913
    TabOrder = 5
  end
  object edtMy: TEdit
    Left = 24
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 6
  end
end
