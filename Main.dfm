object FrmVideoCompare: TFrmVideoCompare
  Left = 503
  Top = 372
  AutoScroll = False
  Caption = 'Video Compare'
  ClientHeight = 348
  ClientWidth = 688
  Color = clBtnFace
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PrintScale = poNone
  Scaled = False
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object grpFile1: TGroupBox
    Left = 0
    Top = 0
    Width = 185
    Height = 348
    Align = alLeft
    Caption = 'File 1'
    TabOrder = 0
    object dirEdtIn1: TJvDirectoryEdit
      Left = 2
      Top = 15
      Width = 181
      Height = 21
      Align = alTop
      TabOrder = 0
      OnChange = dirEdtIn1Change
    end
    object flIn1: TFileListBox
      Left = 2
      Top = 36
      Width = 181
      Height = 310
      Align = alClient
      ItemHeight = 13
      Mask = 
        '*.webm;*.mkv;*.flv;*.flv;*.vob;*.ogv;*.mng;*.avi;*.MTS;*.M2TS;*.' +
        'TS;*.mov;*.qt;*.wmv;*.yuv;*.rm;*.rmvb;*.viv;*.asf;*.amv;*.mp4;*.' +
        'm4p;*.m4v;*.mpg;*.mp2;*.mpeg;*.mpe;*.mpv;*.mpg;*.mpeg;*.m2v;*.m4' +
        'v;*.svi;*.3gp;*.3g2;*.mxf;*.roq;*.nsv;*.flv*.f4v*.f4p*.f4a*.f4b;'
      TabOrder = 1
    end
  end
  object grpFile2: TGroupBox
    Left = 185
    Top = 0
    Width = 185
    Height = 348
    Align = alLeft
    Caption = 'File 2'
    TabOrder = 1
    object dirEdtIn2: TJvDirectoryEdit
      Left = 2
      Top = 15
      Width = 181
      Height = 21
      Align = alTop
      TabOrder = 0
      OnChange = dirEdtIn2Change
    end
    object flIn2: TFileListBox
      Left = 2
      Top = 36
      Width = 181
      Height = 310
      Align = alClient
      ItemHeight = 13
      Mask = 
        '*.webm;*.mkv;*.flv;*.flv;*.vob;*.ogv;*.mng;*.avi;*.MTS;*.M2TS;*.' +
        'TS;*.mov;*.qt;*.wmv;*.yuv;*.rm;*.rmvb;*.viv;*.asf;*.amv;*.mp4;*.' +
        'm4p;*.m4v;*.mpg;*.mp2;*.mpeg;*.mpe;*.mpv;*.mpg;*.mpeg;*.m2v;*.m4' +
        'v;*.svi;*.3gp;*.3g2;*.mxf;*.roq;*.nsv;*.flv*.f4v*.f4p*.f4a*.f4b;'
      TabOrder = 1
    end
  end
  object pnlRight: TPanel
    Left = 370
    Top = 0
    Width = 318
    Height = 348
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object lbl1: TLabel
      Left = 0
      Top = 81
      Width = 318
      Height = 267
      Align = alClient
      Caption = 
        '- Space: Toggle play/pause'#13#10'- Escape: Quit'#13#10'- Down arrow: Seek 1' +
        '5 seconds backward'#13#10'- Left arrow: Seek 1 second backward'#13#10'- Page' +
        ' down: Seek 600 seconds backward'#13#10'- Up arrow: Seek 15 seconds fo' +
        'rward'#13#10'- Right arrow: Seek 1 second forward'#13#10'- Page up: Seek 600' +
        ' seconds forward'#13#10'- S: Swap left and right video'#13#10'- A: Previous ' +
        'frame'#13#10'- D: Next frame'#13#10'- F: Save both frames as PNG images in t' +
        'he current directory'#13#10'- Z: Zoom area around cursor (result shown' +
        ' in lower left corner)'#13#10'- C: Zoom area around cursor (result sho' +
        'wn in lower right corner)'#13#10'- 1: Toggle hide/show left video'#13#10'- 2' +
        ': Toggle hide/show right video'#13#10'- 3: Toggle hide/show HUD'#13#10'- 0: ' +
        'Toggle video/subtraction mode'#13#10'- +: Time-shift right video 1 fra' +
        'me forward'#13#10'- -: Time-shift right video 1 frame backward'
    end
    object pnlControls: TPanel
      Left = 0
      Top = 0
      Width = 318
      Height = 81
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object btnLaunch: TButton
        Left = 1
        Top = 45
        Width = 75
        Height = 25
        Action = actLaunch
        TabOrder = 0
      end
      object chkHighDPI: TCheckBox
        Left = 249
        Top = 19
        Width = 67
        Height = 17
        Hint = 
          'Allow high DPI mode for e.g. displaying UHD content on Retina di' +
          'splays'
        Caption = 'High DPI'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object grpWindowSize: TGroupBox
        Left = 1
        Top = 2
        Width = 113
        Height = 41
        Caption = 'Window Size'
        Enabled = False
        TabOrder = 2
        object lblWindowSizeX: TLabel
          Left = 53
          Top = 20
          Width = 6
          Height = 13
          Caption = 'x'
          Enabled = False
        end
        object edtWidth: TEdit
          Left = 3
          Top = 16
          Width = 48
          Height = 21
          Enabled = False
          TabOrder = 0
          Text = '1280'
          OnKeyDown = UnsignedKeyDown
          OnKeyPress = UnsignedKeyPress
          OnKeyUp = edtWidthKeyUp
        end
        object edtHeight: TEdit
          Left = 62
          Top = 16
          Width = 48
          Height = 21
          Enabled = False
          TabOrder = 1
          Text = '1024'
          OnKeyDown = UnsignedKeyDown
          OnKeyPress = UnsignedKeyPress
          OnKeyUp = edtHeightKeyUp
        end
      end
      object chkWindowSize: TCheckBox
        Left = 73
        Top = 0
        Width = 14
        Height = 17
        Hint = 
          'Use a specific window size instead of deriving the window size f' +
          'rom the video dimensions.'#13#10'The video frame will be scaled to fit' +
          '.'#13#10'Useful for downscaling high resolution video onto a low resol' +
          'ution'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = chkWindowSizeClick
      end
      object grpShift: TGroupBox
        Left = 114
        Top = 2
        Width = 55
        Height = 41
        Caption = 'Shift'
        TabOrder = 4
        DesignSize = (
          55
          41)
        object edtShift: TEdit
          Left = 3
          Top = 16
          Width = 49
          Height = 21
          Hint = 
            'Shift the presentation time stamps of the right video instead of' +
            ' assuming the videos are aligned. A'#13#10'positive amount has the eff' +
            'ect of delaying the left video while negative values conversely ' +
            'delays the'#13#10'right video. Useful when videos are slightly out of ' +
            'sync'
          Anchors = [akLeft, akTop, akRight]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Text = '0'
          OnKeyDown = SignedKeyDown
          OnKeyPress = SignedKeyPress
        end
      end
      object grpMode: TGroupBox
        Left = 170
        Top = 2
        Width = 76
        Height = 41
        Caption = 'Mode'
        TabOrder = 5
        DesignSize = (
          76
          41)
        object cbbMode: TComboBox
          Left = 3
          Top = 16
          Width = 71
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 0
          Text = 'Split'
          OnKeyPress = BlockKeyPress
          Items.Strings = (
            'Split'
            'Vertical'
            'Horizontal')
        end
      end
    end
  end
  object actlstMain: TActionList
    Left = 22
    Top = 38
    object actLaunch: TAction
      Caption = 'Launch'
      OnExecute = actLaunchExecute
      OnUpdate = actLaunchUpdate
    end
  end
end
