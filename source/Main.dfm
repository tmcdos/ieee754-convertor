object Form1: TForm1
  Left = 218
  Top = 113
  BorderStyle = bsSingle
  Caption = 'IEEE-754 converter'
  ClientHeight = 215
  ClientWidth = 377
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  DesignSize = (
    377
    215)
  PixelsPerInch = 96
  TextHeight = 13
  object gb1: TGroupBox
    Left = 0
    Top = 57
    Width = 377
    Height = 132
    Align = alTop
    Caption = ' HEX bytes '
    TabOrder = 0
    object e32n: TLabeledEdit
      Left = 76
      Top = 20
      Width = 89
      Height = 21
      EditLabel.Width = 50
      EditLabel.Height = 13
      EditLabel.Caption = '32-bit HEX'
      LabelPosition = lpLeft
      MaxLength = 8
      TabOrder = 0
    end
    object e64n: TLabeledEdit
      Left = 76
      Top = 48
      Width = 145
      Height = 21
      EditLabel.Width = 50
      EditLabel.Height = 13
      EditLabel.Caption = '64-bit HEX'
      LabelPosition = lpLeft
      MaxLength = 16
      TabOrder = 1
    end
    object e80n: TLabeledEdit
      Left = 76
      Top = 76
      Width = 177
      Height = 21
      EditLabel.Width = 50
      EditLabel.Height = 13
      EditLabel.Caption = '80-bit HEX'
      LabelPosition = lpLeft
      MaxLength = 20
      TabOrder = 2
    end
    object b32n: TButton
      Left = 304
      Top = 12
      Width = 60
      Height = 25
      Caption = 'Show'
      TabOrder = 3
      OnClick = b32nClick
    end
    object b64n: TButton
      Left = 304
      Top = 42
      Width = 60
      Height = 25
      Caption = 'Show'
      TabOrder = 4
      OnClick = b64nClick
    end
    object b80n: TButton
      Left = 304
      Top = 72
      Width = 60
      Height = 25
      Caption = 'Show'
      TabOrder = 5
      OnClick = b80nClick
    end
    object edGUID: TLabeledEdit
      Left = 76
      Top = 104
      Width = 213
      Height = 21
      Color = clInfoBk
      EditLabel.Width = 66
      EditLabel.Height = 13
      EditLabel.Caption = '16-byte GUID'
      LabelPosition = lpLeft
      MaxLength = 32
      TabOrder = 6
    end
    object btnGUID: TButton
      Left = 304
      Top = 101
      Width = 60
      Height = 25
      Caption = 'Show'
      TabOrder = 7
      OnClick = btnGUIDClick
    end
  end
  object memOrder: TRadioGroup
    Left = 0
    Top = 0
    Width = 377
    Height = 57
    Align = alTop
    Caption = ' Byte order '
    Columns = 2
    ItemIndex = 1
    Items.Strings = (
      'Normal (MSB on left)'
      'Memory (LSB on left)'
      'DateTime (MSB on left)')
    TabOrder = 1
  end
  object numRes: TEdit
    Left = 0
    Top = 191
    Width = 377
    Height = 22
    Anchors = [akLeft, akRight, akBottom]
    BevelInner = bvLowered
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = True
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    Text = 'numRes'
  end
end
