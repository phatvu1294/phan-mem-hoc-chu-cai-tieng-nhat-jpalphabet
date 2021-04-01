unit main;

interface

uses
  Winapi.Windows, Winapi.ShellAPI, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Generics.Collections,
  Vcl.Grids, System.IniFiles, MMSystem, common, numedit;

type
  TfrmMain = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    // About Events
    // -------------------------------------------------------------------------
    procedure allAboutOnClick(Sender: TObject);
    procedure allAboutOnMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);

    // Alphabet Events
    // -------------------------------------------------------------------------
    procedure allAlphabetOnClick(Sender: TObject);
    procedure allAlphabetOnSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);

    // Alphabet Quiz Events
    // -------------------------------------------------------------------------
    procedure allAlphabetQuizOnClick(Sender: TObject);
    procedure allAlphabetQuizOnKeyPress(Sender: TObject; var Key: Char);
    procedure allAlphabetQuizOnChange(Sender: TObject);
    procedure allAlphabetQuizOnMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure allAlphabetQuizOnTimer(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  sHomepage = 'http://www.phatvu1294.blogspot.com/jpalphabet';
  sfrmMain = 'JPAlphabet';
  sfrmAbout = 'About ';

  stabAlphabet = 'Alphabet';
  stabAlphabetQuiz = 'Alphabet Quiz';
  sbtnAbout = 'About';

  sgbxAlphabetType = ' Alphabet Type ';
  srdtAlphabetTypeHiragana = 'Hiragana';
  srdtAlphabetTypeKatakana = 'Katakana';

  sgbxAlphabetOption = ' Alphabet Option ';
  schkAlphabetOptionEnableSound = 'Enable Sound';

  slblAlphabetQuizCardTitleSourceEmpty = 'Source Empty!';
  slblAlphabetQuizCardTitleStopped = 'Stopped';
  slblAlphabetQuizCardTitleComplete = 'Complete';

  sbtnAlphabetQuizStart = 'Start';
  sbtnAlphabetQuizStop = 'Stop';
  sbtnAlphabetQuizGet = 'Get';
  sbtnAlphabetQuizNext = 'Next';
  sedtAlphabetQuizAnswerHint = 'Enter here...';

  sgbxAlphabetQuizType = ' Quiz Type ';
  srdtAlphabetQuizTypeHiraganaPractice = 'Hiragana practice';
  srdtAlphabetQuizTypeKatakanaPractice = 'Katakana practice';
  srdtAlphabetQuizTypeWritingPracticeHiragana = 'Writing practice Hiragana';
  srdtAlphabetQuizTypeWritingPracticeKatakana = 'Writing practice Katakana';

  sgbxAlphabetQuizOption = ' Quiz Option ';
  schkAlphabetQuizOptionLimitedTime = 'Limited time              second';
  schkAlphabetQuizOptionGetAnswerBefore =
    'Get answer before              second';
  schkAlphabetQuizOptionGetAnswerWithSound = 'Get answer with sound';
  schkAlphabetQuizOptionPauseIfGetButtonPressed =
    'Pause if "Get" button pressed';

  sgbxAlphabetQuizSource = '  Quiz Source ';
  schkAlphabetQuizSourceAACol = 'Vowel column (a i u e o)';
  schkAlphabetQuizSourceKACol = 'K column (ka ki ku ke ko)';
  schkAlphabetQuizSourceSACol = 'S column (sa shi su se so)';
  schkAlphabetQuizSourceTACol = 'T column (ta chi tsu te to)';
  schkAlphabetQuizSourceNACol = 'N column (na ni nu ne no)';
  schkAlphabetQuizSourceHACol = 'H column (ha hi fu he ho)';
  schkAlphabetQuizSourceMACol = 'M column (ma mi mu me mo)';
  schkAlphabetQuizSourceYACol = 'Y column (ya yu yo)';
  schkAlphabetQuizSourceRACol = 'R column (ra ri ru re ro)';
  schkAlphabetQuizSourceWACol = 'W column (wa wo)';
  schkAlphabetQuizSourceNNCol = 'N';
  schkAlphabetQuizSourceGACol = 'G column (ga gi gu ge go)';
  schkAlphabetQuizSourceZACol = 'Z column (za ji zu ze zo)';
  schkAlphabetQuizSourceDACol = 'D column (da ji zu de do)';
  schkAlphabetQuizSourceBACol = 'B column (ba bi bu be bo)';
  schkAlphabetQuizSourcePACol = 'P column (pa pi pu pe po)';
  schkAlphabetQuizSourceYARow = 'YA row (kya gya ... rya)';
  schkAlphabetQuizSourceYURow = 'YU row (kyu gyu ... ryu)';
  schkAlphabetQuizSourceYORow = 'YO row (kyo gyo ... ryo)';
  slblAlphabetQuizSourceSelectAll = 'Select All';
  slblAlphabetQuizSourceDeselectAll = 'Deselect All';

  sgbxAlphabetQuizQuestion = ' Question ';
  sgbxAlphabetQuizRight = ' Right ';
  sgbxAlphabetQuizWrong = ' Wrong ';
  sgbxAlphabetQuizLimitedTime = ' Limited time ';
  slblAlphabetQuizLimitedTimeInfinity = '∞';
  slblAlphabetQuizLimitedTimeNext = '»';
  sgbxAlphabetQuizWrongList = ' Wrong list ';

  slblAboutVersion = 'Version ';
  slblAboutCopyright = 'Copyright © 2017 by Phat Vu.';
  slblAboutMore1 = 'Published by                     .';
  slblAboutMore2 = 'Program uses some data from the NHK World.';
  slblAboutHomepage = 'Phat''s Blog';
  sbtnAboutOK = 'OK';

  sNull = '';
  sSpace = ' ';
  sSlash = '/';
  sSemicolon = ';';
  sNewLine = #13#10;
  sBracketsLeft = '(';
  sBracketsRight = ')';

  sDefaultJapaneseFont = 'Meiryo';

var
  frmMain: TfrmMain;
  frmAbout: TForm;

  pagMain: TPageControl;
  tabAlphabet, tabAlphabetQuiz: TTabSheet;
  btnAbout: TButton;

  // Alphabet Components
  // ---------------------------------------------------------------------------
  // Alphabet Card
  pnlAlphabetCardBlock: TPanel;
  lblAlphabetCardMain: TLabel;
  lblAlphabetCardTitle: TLabel;

  // Alphabet How To Write
  gbxAlphabetHowToWrite: TGroupBox;
  imgAlphabetHowToWrite: TImage;

  // Alphabet Type
  gbxAlphabetType: TGroupBox;
  rdtAlphabetTypeHiragana, rdtAlphabetTypeKatakana: TRadioButton;

  // Alphabet Option
  gbxAlphabetOption: TGroupBox;
  chkAlphabetOptionEnableSound: TCheckBox;

  // Alphabet Table
  sgdAlphabetTable1, sgdAlphabetTable2: TStringGrid;

  // Alphabet Quiz Components
  // ---------------------------------------------------------------------------
  // Alphabet Quiz Card
  pnlAlphabetQuizCardBlock: TPanel;
  lblAlphabetQuizCardMain, lblAlphabetQuizCardTitle: TLabel;

  // Alphabet Quiz Command
  btnAlphabetQuizStartStop, btnAlphabetQuizGet, btnAlphabetQuizNext: TButton;
  edtAlphabetQuizAnswer: TEdit;

  // Alphabet Quiz Timer
  tmrAlphabetQuizLimitedTime: TTimer;

  // Alphabet Quiz Result
  gbxAlphabetQuizWrong, gbxAlphabetQuizRight, gbxAlphabetQuizQuestion,
    gbxAlphabetQuizLimitedTime, gbxAlphabetQuizWrongList: TGroupBox;
  lblAlphabetQuizWrong, lblAlphabetQuizRight, lblAlphabetQuizQuestion,
    lblAlphabetQuizLimitedTime: TLabel;
  lbxAlphabetQuizWrongList: TListBox;

  // Alphabet Quiz Type
  gbxAlphabetQuizType: TGroupBox;
  rdtAlphabetQuizTypeHiraganaPractice, rdtAlphabetQuizTypeKatakanaPractice,
    rdtAlphabetQuizTypeWritingPracticeHiragana,
    rdtAlphabetQuizTypeWritingPracticeKatakana: TRadioButton;

  // Alphabet Quiz Option
  gbxAlphabetQuizOption: TGroupBox;
  chkAlphabetQuizOptionLimitedTime, chkAlphabetQuizOptionGetAnswerBefore,
    chkAlphabetQuizOptionGetAnswerWithSound,
    chkAlphabetQuizOptionPauseIfGetButtonPressed: TCheckBox;
  edtAlphabetQuizOptionLimitedTime, edtAlphabetQuizOptionGetAnswerBefore
    : TNumberEdit;

  // Alphabet Quiz Source
  gbxAlphabetQuizSource: TGroupBox;
  chkAlphabetQuizSourceAACol, chkAlphabetQuizSourceKACol,
    chkAlphabetQuizSourceSACol, chkAlphabetQuizSourceTACol,
    chkAlphabetQuizSourceNACol, chkAlphabetQuizSourceHACol,
    chkAlphabetQuizSourceMACol, chkAlphabetQuizSourceYACol,
    chkAlphabetQuizSourceRACol, chkAlphabetQuizSourceWACol,
    chkAlphabetQuizSourceNNCol, chkAlphabetQuizSourceGACol,
    chkAlphabetQuizSourceZACol, chkAlphabetQuizSourceDACol,
    chkAlphabetQuizSourceBACol, chkAlphabetQuizSourcePACol,
    chkAlphabetQuizSourceYARow, chkAlphabetQuizSourceYURow,
    chkAlphabetQuizSourceYORow: TCheckBox;
  lblAlphabetQuizSourceSelectAll1, lblAlphabetQuizSourceSelectAll2,
    lblAlphabetQuizSourceSelectAll3, lblAlphabetQuizSourceDeselectAll1,
    lblAlphabetQuizSourceDeselectAll2,
    lblAlphabetQuizSourceDeselectAll3: TLabel;

  // Alphabet Quiz Variable
  intAlphabetQuizRight, intAlphabetQuizWrong, intAlphabetQuizQuestion,
    intAlphabetQuizTotal, intAlphabetQuizLimitedTime, intRandomIndex: Integer;

  // Alphabet Quiz List
  lstAlphabetQuiz, lstAlphabetQuizWrongList: TStringList;

  // Dictionary
  // -------------------------------------------------------------------------
  dicAlphabet: TDictionary<Integer, TAlphabet>;
  dicAlphabetQuiz: TDictionary<Integer, TAlphabet>;
  alpAlphabet: TAlphabet;

  // About Components
  // ---------------------------------------------------------------------------
  imgAboutApp: TImage;
  lblAboutApp, lblAboutMore: TLabel;
  bvlAboutSeparate: TBevel;
  lblAboutHomepage: TLabel;
  btnAboutOK: TButton;

procedure LoadAlphabetTable(isHiragana: Boolean);
procedure LoadAlphabetCardSoundWrite(Table1, SoundEnabled: Boolean;
  ARow, ACol: Integer);

procedure LoadAlphabetQuizStarted();
procedure LoadAlphabetQuizStopped();
procedure LoadAlphabetQuizCard();
procedure LoadAlphabetQuizCheck();
procedure LoadAlphabetQuizGet();

procedure LoadSetMainFormConfig();
procedure LoadReadMainFormConfig();
procedure LoadWriteMainFormConfig();

implementation

{$R *.dfm}
{$R resources.res}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  with frmMain do
  begin
    ClientWidth := 596;
    ClientHeight := 588;
    BorderStyle := bsSingle;
    BorderIcons := [biSystemMenu, biMinimize];
    Position := poDesktopCenter;
    Caption := sfrmMain;
    OnClose := FormClose;
  end;

  pagMain := TPageControl.Create(frmMain);
  with pagMain do
  begin
    Parent := frmMain;
    Top := 8;
    Left := 8;
    Width := 588;
    Height := 580;
  end;

  tabAlphabet := TTabSheet.Create(pagMain);
  with tabAlphabet do
  begin
    Parent := pagMain;
    PageControl := pagMain;
    Caption := stabAlphabet;
  end;

  tabAlphabetQuiz := TTabSheet.Create(pagMain);
  with tabAlphabetQuiz do
  begin
    Parent := pagMain;
    PageControl := pagMain;
    Caption := stabAlphabetQuiz;
  end;

  btnAbout := TButton.Create(frmMain);
  with btnAbout do
  begin
    Parent := frmMain;
    Top := 3;
    Left := 521;
    Width := 75;
    Height := 23;
    Caption := sbtnAbout;
    OnClick := allAboutOnClick;
  end;

  // Alphabet Components
  // ===========================================================================
  // Alphabet Card
  // ---------------------------------------------------------------------------
  pnlAlphabetCardBlock := TPanel.Create(tabAlphabet);
  with pnlAlphabetCardBlock do
  begin
    Parent := tabAlphabet;
    Top := 8;
    Left := 122;
    Width := 294;
    Height := 184;
    Ctl3D := False;
    BevelOuter := bvNone;
    BorderStyle := bsSingle;
  end;

  lblAlphabetCardMain := TLabel.Create(pnlAlphabetCardBlock);
  with lblAlphabetCardMain do
  begin
    Parent := pnlAlphabetCardBlock;
    Top := 0;
    Left := 0;
    AutoSize := False;
    Width := 294;
    Height := 159;
    Font.Name := sDefaultJapaneseFont;
    Font.Size := 80;
    Font.Color := RGB(31, 31, 31);
    Alignment := taCenter;
  end;

  lblAlphabetCardTitle := TLabel.Create(pnlAlphabetCardBlock);
  with lblAlphabetCardTitle do
  begin
    Parent := pnlAlphabetCardBlock;
    Top := 143;
    Left := 0;
    AutoSize := False;
    Width := 294;
    Height := 25;
    Font.Size := 16;
    Font.Color := RGB(39, 181, 58);
    Alignment := taCenter;
  end;

  // Alphabet How To Write
  // ---------------------------------------------------------------------------
  gbxAlphabetHowToWrite := TGroupBox.Create(tabAlphabet);
  with gbxAlphabetHowToWrite do
  begin
    Parent := tabAlphabet;
    Top := 32;
    Left := 424;
    Width := 148;
    Height := 132;
  end;

  imgAlphabetHowToWrite := TImage.Create(gbxAlphabetHowToWrite);
  with imgAlphabetHowToWrite do
  begin
    Parent := gbxAlphabetHowToWrite;
    Top := 16;
    Left := 8;
    AutoSize := False;
    Width := 132;
    Height := 100;
    Stretch := True;
    Proportional := True;
    Center := True;
  end;

  // Alphabet Type
  // ---------------------------------------------------------------------------
  gbxAlphabetType := TGroupBox.Create(tabAlphabet);
  with gbxAlphabetType do
  begin
    Parent := tabAlphabet;
    Top := 32;
    Left := 8;
    Width := 106;
    Height := 69;
    Caption := sgbxAlphabetType;
  end;

  rdtAlphabetTypeHiragana := TRadioButton.Create(gbxAlphabetType);
  with rdtAlphabetTypeHiragana do
  begin
    Parent := gbxAlphabetType;
    Top := 24;
    Left := 8;
    Width := 90;
    Height := 17;
    Caption := srdtAlphabetTypeHiragana;
    OnClick := allAlphabetOnClick;
  end;

  rdtAlphabetTypeKatakana := TRadioButton.Create(gbxAlphabetType);
  with rdtAlphabetTypeKatakana do
  begin
    Parent := gbxAlphabetType;
    Top := 45;
    Left := 8;
    Width := 90;
    Height := 17;
    Caption := srdtAlphabetTypeKatakana;
    OnClick := allAlphabetOnClick;
  end;

  // Alphabet Option
  // ---------------------------------------------------------------------------
  gbxAlphabetOption := TGroupBox.Create(tabAlphabet);
  with gbxAlphabetOption do
  begin
    Parent := tabAlphabet;
    Top := 109;
    Left := 8;
    Width := 106;
    Height := 49;
    Caption := sgbxAlphabetOption;
  end;

  chkAlphabetOptionEnableSound := TCheckBox.Create(gbxAlphabetOption);
  with chkAlphabetOptionEnableSound do
  begin
    Parent := gbxAlphabetOption;
    Top := 24;
    Left := 8;
    Width := 90;
    Height := 17;
    Caption := schkAlphabetOptionEnableSound;
  end;

  // Alphabet Table
  // ---------------------------------------------------------------------------
  sgdAlphabetTable1 := TStringGrid.Create(tabAlphabet);
  with sgdAlphabetTable1 do
  begin
    Parent := tabAlphabet;
    Top := 200;
    Left := 8;
    Width := 564;
    Height := 201;
    Font.Name := sDefaultJapaneseFont;
    Font.Size := 13;
    RowCount := 6;
    ColCount := 17;
    DefaultColWidth := 32;
    DefaultRowHeight := 32;
    BiDiMode := bdRightToLeft;
    ScrollBars := ssNone;
    OnSelectCell := allAlphabetOnSelectCell;
  end;

  sgdAlphabetTable2 := TStringGrid.Create(tabAlphabet);
  with sgdAlphabetTable2 do
  begin
    Parent := tabAlphabet;
    Top := 409;
    Left := 8;
    Width := 564;
    Height := 136;
    Font.Name := sDefaultJapaneseFont;
    Font.Size := 13;
    RowCount := 4;
    ColCount := 12;
    DefaultColWidth := 47;
    DefaultRowHeight := 32;
    BiDiMode := bdRightToLeft;
    ColWidths[0] := 32;
    ScrollBars := ssNone;
    OnSelectCell := allAlphabetOnSelectCell;
  end;

  // Alphabet Quiz Components
  // ===========================================================================
  // Alphabet Quiz Card
  // ---------------------------------------------------------------------------
  pnlAlphabetQuizCardBlock := TPanel.Create(tabAlphabetQuiz);
  with pnlAlphabetQuizCardBlock do
  begin
    Parent := tabAlphabetQuiz;
    Top := 8;
    Left := 128;
    Width := 324;
    Height := 203;
    Ctl3D := False;
    BevelOuter := bvNone;
    BorderStyle := bsSingle;
  end;

  lblAlphabetQuizCardMain := TLabel.Create(pnlAlphabetQuizCardBlock);
  with lblAlphabetQuizCardMain do
  begin
    Parent := pnlAlphabetQuizCardBlock;
    Top := 0;
    Left := 0;
    AutoSize := False;
    Width := 324;
    Height := 174;
    Font.Name := sDefaultJapaneseFont;
    Font.Size := 87;
    Font.Color := RGB(31, 31, 31);
    Alignment := taCenter;
  end;

  lblAlphabetQuizCardTitle := TLabel.Create(pnlAlphabetQuizCardBlock);
  with lblAlphabetQuizCardTitle do
  begin
    Parent := pnlAlphabetQuizCardBlock;
    Top := 158;
    Left := 0;
    AutoSize := False;
    Width := 324;
    Height := 29;
    Font.Size := 18;
    Font.Color := RGB(39, 181, 58);
    Alignment := taCenter;
  end;

  // Alphabet Quiz Command
  // ---------------------------------------------------------------------------
  btnAlphabetQuizStartStop := TButton.Create(tabAlphabetQuiz);
  with btnAlphabetQuizStartStop do
  begin
    Parent := tabAlphabetQuiz;
    Top := 514;
    Left := 8;
    Width := 220;
    Height := 32;
    Caption := sbtnAlphabetQuizStart;
    OnClick := allAlphabetQuizOnClick;
  end;

  btnAlphabetQuizGet := TButton.Create(tabAlphabetQuiz);
  with btnAlphabetQuizGet do
  begin
    Parent := tabAlphabetQuiz;
    Top := 219;
    Left := 128;
    AutoSize := False;
    Width := 78;
    Height := 39;
    Caption := sbtnAlphabetQuizGet;
    OnClick := allAlphabetQuizOnClick;
  end;

  btnAlphabetQuizNext := TButton.Create(tabAlphabetQuiz);
  with btnAlphabetQuizNext do
  begin
    Parent := tabAlphabetQuiz;
    Top := 219;
    Left := 374;
    Width := 78;
    Height := 39;
    Caption := sbtnAlphabetQuizNext;
    OnClick := allAlphabetQuizOnClick;
  end;

  edtAlphabetQuizAnswer := TEdit.Create(tabAlphabetQuiz);
  with edtAlphabetQuizAnswer do
  begin
    Parent := tabAlphabetQuiz;
    Top := 220;
    Left := 214;
    AutoSize := False;
    Width := 152;
    Height := 37;
    Font.Size := 18;
    Alignment := taCenter;
    ShowHint := True;
    TextHint := sedtAlphabetQuizAnswerHint;
    OnKeyPress := allAlphabetQuizOnKeyPress;
  end;

  // Alphabet Quiz Timer
  // ---------------------------------------------------------------------------
  tmrAlphabetQuizLimitedTime := TTimer.Create(frmMain);
  with tmrAlphabetQuizLimitedTime do
  begin
    Parent := frmMain;
    Top := 8;
    Left := 8;
    Interval := 1000;
    OnTimer := allAlphabetQuizOnTimer;
  end;

  // Alphabet Quiz Result
  // ---------------------------------------------------------------------------
  gbxAlphabetQuizQuestion := TGroupBox.Create(tabAlphabetQuiz);
  with gbxAlphabetQuizQuestion do
  begin
    Parent := tabAlphabetQuiz;
    Top := 8;
    Left := 8;
    Width := 112;
    Height := 61;
    Caption := sgbxAlphabetQuizQuestion;
  end;

  lblAlphabetQuizQuestion := TLabel.Create(gbxAlphabetQuizQuestion);
  with lblAlphabetQuizQuestion do
  begin
    Parent := gbxAlphabetQuizQuestion;
    Top := 24;
    Left := 8;
    AutoSize := False;
    Width := 96;
    Height := 29;
    Font.Size := 18;
    Alignment := taCenter;
  end;

  gbxAlphabetQuizRight := TGroupBox.Create(tabAlphabetQuiz);
  with gbxAlphabetQuizRight do
  begin
    Parent := tabAlphabetQuiz;
    Top := 77;
    Left := 8;
    Width := 112;
    Height := 61;
    Caption := sgbxAlphabetQuizRight;
  end;

  lblAlphabetQuizRight := TLabel.Create(gbxAlphabetQuizRight);
  with lblAlphabetQuizRight do
  begin
    Parent := gbxAlphabetQuizRight;
    Top := 24;
    Left := 8;
    AutoSize := False;
    Width := 96;
    Height := 29;
    Font.Size := 18;
    Alignment := taCenter;
  end;

  gbxAlphabetQuizWrong := TGroupBox.Create(tabAlphabetQuiz);
  with gbxAlphabetQuizWrong do
  begin
    Parent := tabAlphabetQuiz;
    Top := 146;
    Left := 8;
    Width := 112;
    Height := 61;
    Caption := sgbxAlphabetQuizWrong;
  end;

  lblAlphabetQuizWrong := TLabel.Create(gbxAlphabetQuizWrong);
  with lblAlphabetQuizWrong do
  begin
    Parent := gbxAlphabetQuizWrong;
    Top := 24;
    Left := 8;
    AutoSize := False;
    Width := 96;
    Height := 29;
    Font.Size := 18;
    Alignment := taCenter;
  end;

  gbxAlphabetQuizLimitedTime := TGroupBox.Create(tabAlphabetQuiz);
  with gbxAlphabetQuizLimitedTime do
  begin
    Parent := tabAlphabetQuiz;
    Top := 8;
    Left := 460;
    Width := 112;
    Height := 61;
    Caption := sgbxAlphabetQuizLimitedTime;
  end;

  lblAlphabetQuizLimitedTime := TLabel.Create(gbxAlphabetQuizLimitedTime);
  with lblAlphabetQuizLimitedTime do
  begin
    Parent := gbxAlphabetQuizLimitedTime;
    Top := 24;
    Left := 8;
    AutoSize := False;
    Width := 96;
    Height := 29;
    Font.Size := 18;
    Alignment := taCenter;
  end;

  gbxAlphabetQuizWrongList := TGroupBox.Create(tabAlphabetQuiz);
  with gbxAlphabetQuizWrongList do
  begin
    Parent := tabAlphabetQuiz;
    Top := 77;
    Left := 460;
    Width := 112;
    Height := 130;
    Caption := sgbxAlphabetQuizWrongList;
  end;

  lbxAlphabetQuizWrongList := TListBox.Create(gbxAlphabetQuizWrongList);
  with lbxAlphabetQuizWrongList do
  begin
    Parent := gbxAlphabetQuizWrongList;
    Top := 24;
    Left := 8;
    Width := 96;
    Height := 98;
    Font.Name := sDefaultJapaneseFont;
    Font.Size := 10;
    OnClick := allAlphabetQuizOnClick;
  end;

  // Alphabet Quiz Type
  // ---------------------------------------------------------------------------
  gbxAlphabetQuizType := TGroupBox.Create(tabAlphabetQuiz);
  with gbxAlphabetQuizType do
  begin
    Parent := tabAlphabetQuiz;
    Top := 266;
    Left := 8;
    Width := 220;
    Height := 112;
    Caption := sgbxAlphabetQuizType;
  end;

  rdtAlphabetQuizTypeHiraganaPractice :=
    TRadioButton.Create(gbxAlphabetQuizType);
  with rdtAlphabetQuizTypeHiraganaPractice do
  begin
    Parent := gbxAlphabetQuizType;
    Top := 24;
    Left := 8;
    Width := 204;
    Height := 17;
    Caption := srdtAlphabetQuizTypeHiraganaPractice;
    OnClick := allAlphabetQuizOnClick;
  end;

  rdtAlphabetQuizTypeKatakanaPractice :=
    TRadioButton.Create(gbxAlphabetQuizType);
  with rdtAlphabetQuizTypeKatakanaPractice do
  begin
    Parent := gbxAlphabetQuizType;
    Top := 45;
    Left := 8;
    Width := 204;
    Height := 17;
    Caption := srdtAlphabetQuizTypeKatakanaPractice;
    OnClick := allAlphabetQuizOnClick;
  end;

  rdtAlphabetQuizTypeWritingPracticeHiragana :=
    TRadioButton.Create(gbxAlphabetQuizType);
  with rdtAlphabetQuizTypeWritingPracticeHiragana do
  begin
    Parent := gbxAlphabetQuizType;
    Top := 66;
    Left := 8;
    Width := 204;
    Height := 17;
    Caption := srdtAlphabetQuizTypeWritingPracticeHiragana;
    OnClick := allAlphabetQuizOnClick;
  end;

  rdtAlphabetQuizTypeWritingPracticeKatakana :=
    TRadioButton.Create(gbxAlphabetQuizType);
  with rdtAlphabetQuizTypeWritingPracticeKatakana do
  begin
    Parent := gbxAlphabetQuizType;
    Top := 87;
    Left := 8;
    Width := 204;
    Height := 17;
    Caption := srdtAlphabetQuizTypeWritingPracticeKatakana;
    OnClick := allAlphabetQuizOnClick;
  end;

  // Alphabet Quiz Option
  // ---------------------------------------------------------------------------
  gbxAlphabetQuizOption := TGroupBox.Create(tabAlphabetQuiz);
  with gbxAlphabetQuizOption do
  begin
    Parent := tabAlphabetQuiz;
    Top := 386;
    Left := 8;
    Width := 220;
    Height := 120;
    Caption := sgbxAlphabetQuizOption;
  end;

  chkAlphabetQuizOptionLimitedTime := TCheckBox.Create(gbxAlphabetQuizOption);
  with chkAlphabetQuizOptionLimitedTime do
  begin
    Parent := gbxAlphabetQuizOption;
    Top := 26;
    Left := 8;
    Width := 204;
    Height := 17;
    Caption := schkAlphabetQuizOptionLimitedTime;
    OnClick := allAlphabetQuizOnClick;
  end;

  edtAlphabetQuizOptionLimitedTime := TNumberEdit.Create(gbxAlphabetQuizOption);
  with edtAlphabetQuizOptionLimitedTime do
  begin
    Parent := gbxAlphabetQuizOption;
    Top := 24;
    Left := 84;
    Width := 32;
    Height := 21;
    MaxLength := 4;
    Alignment := taCenter;
    OnChange := allAlphabetQuizOnChange;
  end;

  chkAlphabetQuizOptionGetAnswerBefore :=
    TCheckBox.Create(gbxAlphabetQuizOption);
  with chkAlphabetQuizOptionGetAnswerBefore do
  begin
    Parent := gbxAlphabetQuizOption;
    Top := 51;
    Left := 24;
    Width := 188;
    Height := 17;
    Caption := schkAlphabetQuizOptionGetAnswerBefore;
    OnClick := allAlphabetQuizOnClick;
  end;

  chkAlphabetQuizOptionPauseIfGetButtonPressed :=
    TCheckBox.Create(gbxAlphabetQuizOption);
  with chkAlphabetQuizOptionPauseIfGetButtonPressed do
  begin
    Parent := gbxAlphabetQuizOption;
    Top := 74;
    Left := 24;
    Width := 188;
    Height := 17;
    Caption := schkAlphabetQuizOptionPauseIfGetButtonPressed;
  end;

  edtAlphabetQuizOptionGetAnswerBefore :=
    TNumberEdit.Create(gbxAlphabetQuizOption);
  with edtAlphabetQuizOptionGetAnswerBefore do
  begin
    Parent := gbxAlphabetQuizOption;
    Top := 49;
    Left := 134;
    Width := 32;
    Height := 21;
    MaxLength := 4;
    Alignment := taCenter;
    OnChange := allAlphabetQuizOnChange;
  end;

  chkAlphabetQuizOptionGetAnswerWithSound :=
    TCheckBox.Create(gbxAlphabetQuizOption);
  with chkAlphabetQuizOptionGetAnswerWithSound do
  begin
    Parent := gbxAlphabetQuizOption;
    Top := 95;
    Left := 8;
    Width := 204;
    Height := 17;
    Caption := schkAlphabetQuizOptionGetAnswerWithSound;
  end;

  // Alphabet Quiz Source
  // ---------------------------------------------------------------------------
  gbxAlphabetQuizSource := TGroupBox.Create(tabAlphabetQuiz);
  with gbxAlphabetQuizSource do
  begin
    Parent := tabAlphabetQuiz;
    Top := 266;
    Left := 236;
    Width := 336;
    Height := 280;
    Caption := sgbxAlphabetQuizSource;
  end;

  chkAlphabetQuizSourceAACol := TCheckBox.Create(gbxAlphabetQuizSource);
  with chkAlphabetQuizSourceAACol do
  begin
    Parent := gbxAlphabetQuizSource;
    Top := 24;
    Left := 8;
    Width := 156;
    Height := 17;
    Caption := schkAlphabetQuizSourceAACol;
  end;

  chkAlphabetQuizSourceKACol := TCheckBox.Create(gbxAlphabetQuizSource);
  with chkAlphabetQuizSourceKACol do
  begin
    Parent := gbxAlphabetQuizSource;
    Top := 45;
    Left := 8;
    Width := 156;
    Height := 17;
    Caption := schkAlphabetQuizSourceKACol;
  end;

  chkAlphabetQuizSourceSACol := TCheckBox.Create(gbxAlphabetQuizSource);
  with chkAlphabetQuizSourceSACol do
  begin
    Parent := gbxAlphabetQuizSource;
    Top := 66;
    Left := 8;
    Width := 156;
    Height := 17;
    Caption := schkAlphabetQuizSourceSACol;
  end;

  chkAlphabetQuizSourceTACol := TCheckBox.Create(gbxAlphabetQuizSource);
  with chkAlphabetQuizSourceTACol do
  begin
    Parent := gbxAlphabetQuizSource;
    Top := 87;
    Left := 8;
    Width := 156;
    Height := 17;
    Caption := schkAlphabetQuizSourceTACol;
  end;

  chkAlphabetQuizSourceNACol := TCheckBox.Create(gbxAlphabetQuizSource);
  with chkAlphabetQuizSourceNACol do
  begin
    Parent := gbxAlphabetQuizSource;
    Top := 108;
    Left := 8;
    Width := 156;
    Height := 17;
    Caption := schkAlphabetQuizSourceNACol;
  end;

  chkAlphabetQuizSourceHACol := TCheckBox.Create(gbxAlphabetQuizSource);
  with chkAlphabetQuizSourceHACol do
  begin
    Parent := gbxAlphabetQuizSource;
    Top := 129;
    Left := 8;
    Width := 156;
    Height := 17;
    Caption := schkAlphabetQuizSourceHACol;
  end;

  chkAlphabetQuizSourceMACol := TCheckBox.Create(gbxAlphabetQuizSource);
  with chkAlphabetQuizSourceMACol do
  begin
    Parent := gbxAlphabetQuizSource;
    Top := 150;
    Left := 8;
    Width := 156;
    Height := 17;
    Caption := schkAlphabetQuizSourceMACol;
  end;

  chkAlphabetQuizSourceYACol := TCheckBox.Create(gbxAlphabetQuizSource);
  with chkAlphabetQuizSourceYACol do
  begin
    Parent := gbxAlphabetQuizSource;
    Top := 171;
    Left := 8;
    Width := 156;
    Height := 17;
    Caption := schkAlphabetQuizSourceYACol;
  end;

  chkAlphabetQuizSourceRACol := TCheckBox.Create(gbxAlphabetQuizSource);
  with chkAlphabetQuizSourceRACol do
  begin
    Parent := gbxAlphabetQuizSource;
    Top := 192;
    Left := 8;
    Width := 156;
    Height := 17;
    Caption := schkAlphabetQuizSourceRACol;
  end;

  chkAlphabetQuizSourceWACol := TCheckBox.Create(gbxAlphabetQuizSource);
  with chkAlphabetQuizSourceWACol do
  begin
    Parent := gbxAlphabetQuizSource;
    Top := 213;
    Left := 8;
    Width := 156;
    Height := 17;
    Caption := schkAlphabetQuizSourceWACol;
  end;

  chkAlphabetQuizSourceNNCol := TCheckBox.Create(gbxAlphabetQuizSource);
  with chkAlphabetQuizSourceNNCol do
  begin
    Parent := gbxAlphabetQuizSource;
    Top := 234;
    Left := 8;
    Width := 156;
    Height := 17;
    Caption := schkAlphabetQuizSourceNNCol;
  end;

  lblAlphabetQuizSourceSelectAll1 := TLabel.Create(gbxAlphabetQuizSource);
  with lblAlphabetQuizSourceSelectAll1 do
  begin
    Parent := gbxAlphabetQuizSource;
    Top := 255;
    Left := 24;
    Width := 51;
    Height := 17;
    Font.Color := clBlue;
    Font.Style := [fsUnderline];
    Caption := slblAlphabetQuizSourceSelectAll;
    OnClick := allAlphabetQuizOnClick;
    OnMouseMove := allAlphabetQuizOnMouseMove;
  end;

  lblAlphabetQuizSourceDeselectAll1 := TLabel.Create(gbxAlphabetQuizSource);
  with lblAlphabetQuizSourceDeselectAll1 do
  begin
    Parent := gbxAlphabetQuizSource;
    Top := 255;
    Left := 83;
    Width := 65;
    Height := 17;
    Font.Color := clBlue;
    Font.Style := [fsUnderline];
    Caption := slblAlphabetQuizSourceDeselectAll;
    OnClick := allAlphabetQuizOnClick;
    OnMouseMove := allAlphabetQuizOnMouseMove;
  end;

  chkAlphabetQuizSourceGACol := TCheckBox.Create(gbxAlphabetQuizSource);
  with chkAlphabetQuizSourceGACol do
  begin
    Parent := gbxAlphabetQuizSource;
    Top := 24;
    Left := 172;
    Width := 156;
    Height := 17;
    Caption := schkAlphabetQuizSourceGACol;
  end;

  chkAlphabetQuizSourceZACol := TCheckBox.Create(gbxAlphabetQuizSource);
  with chkAlphabetQuizSourceZACol do
  begin
    Parent := gbxAlphabetQuizSource;
    Top := 45;
    Left := 172;
    Width := 156;
    Height := 17;
    Caption := schkAlphabetQuizSourceZACol;
  end;

  chkAlphabetQuizSourceDACol := TCheckBox.Create(gbxAlphabetQuizSource);
  with chkAlphabetQuizSourceDACol do
  begin
    Parent := gbxAlphabetQuizSource;
    Top := 66;
    Left := 172;
    Width := 156;
    Height := 17;
    Caption := schkAlphabetQuizSourceDACol;
  end;

  chkAlphabetQuizSourceBACol := TCheckBox.Create(gbxAlphabetQuizSource);
  with chkAlphabetQuizSourceBACol do
  begin
    Parent := gbxAlphabetQuizSource;
    Top := 87;
    Left := 172;
    Width := 156;
    Height := 17;
    Caption := schkAlphabetQuizSourceBACol;
  end;

  chkAlphabetQuizSourcePACol := TCheckBox.Create(gbxAlphabetQuizSource);
  with chkAlphabetQuizSourcePACol do
  begin
    Parent := gbxAlphabetQuizSource;
    Top := 108;
    Left := 172;
    Width := 156;
    Height := 17;
    Caption := schkAlphabetQuizSourcePACol;
  end;

  lblAlphabetQuizSourceSelectAll2 := TLabel.Create(gbxAlphabetQuizSource);
  with lblAlphabetQuizSourceSelectAll2 do
  begin
    Parent := gbxAlphabetQuizSource;
    Top := 129;
    Left := 188;
    Width := 51;
    Height := 17;
    Font.Color := clBlue;
    Font.Style := [fsUnderline];
    Caption := slblAlphabetQuizSourceSelectAll;
    OnClick := allAlphabetQuizOnClick;
    OnMouseMove := allAlphabetQuizOnMouseMove;
  end;

  lblAlphabetQuizSourceDeselectAll2 := TLabel.Create(gbxAlphabetQuizSource);
  with lblAlphabetQuizSourceDeselectAll2 do
  begin
    Parent := gbxAlphabetQuizSource;
    Top := 129;
    Left := 245;
    Width := 65;
    Height := 17;
    Font.Color := clBlue;
    Font.Style := [fsUnderline];
    Caption := slblAlphabetQuizSourceDeselectAll;
    OnClick := allAlphabetQuizOnClick;
    OnMouseMove := allAlphabetQuizOnMouseMove;
  end;

  chkAlphabetQuizSourceYARow := TCheckBox.Create(gbxAlphabetQuizSource);
  with chkAlphabetQuizSourceYARow do
  begin
    Parent := gbxAlphabetQuizSource;
    Top := 192;
    Left := 172;
    Width := 156;
    Height := 17;
    Caption := schkAlphabetQuizSourceYARow;
  end;

  chkAlphabetQuizSourceYURow := TCheckBox.Create(gbxAlphabetQuizSource);
  with chkAlphabetQuizSourceYURow do
  begin
    Parent := gbxAlphabetQuizSource;
    Top := 213;
    Left := 172;
    Width := 156;
    Height := 17;
    Caption := schkAlphabetQuizSourceYURow;
  end;

  chkAlphabetQuizSourceYORow := TCheckBox.Create(gbxAlphabetQuizSource);
  with chkAlphabetQuizSourceYORow do
  begin
    Parent := gbxAlphabetQuizSource;
    Top := 234;
    Left := 172;
    Width := 156;
    Height := 17;
    Caption := schkAlphabetQuizSourceYORow;
  end;

  lblAlphabetQuizSourceSelectAll3 := TLabel.Create(gbxAlphabetQuizSource);
  with lblAlphabetQuizSourceSelectAll3 do
  begin
    Parent := gbxAlphabetQuizSource;
    Top := 255;
    Left := 188;
    Width := 51;
    Height := 17;
    Font.Color := clBlue;
    Font.Style := [fsUnderline];
    Caption := slblAlphabetQuizSourceSelectAll;
    OnClick := allAlphabetQuizOnClick;
    OnMouseMove := allAlphabetQuizOnMouseMove;
  end;

  lblAlphabetQuizSourceDeselectAll3 := TLabel.Create(gbxAlphabetQuizSource);
  with lblAlphabetQuizSourceDeselectAll3 do
  begin
    Parent := gbxAlphabetQuizSource;
    Top := 255;
    Left := 245;
    Width := 65;
    Height := 17;
    Font.Color := clBlue;
    Font.Style := [fsUnderline];
    Caption := slblAlphabetQuizSourceDeselectAll;
    OnClick := allAlphabetQuizOnClick;
    OnMouseMove := allAlphabetQuizOnMouseMove;
  end;
  // Create Dictionary
  // ---------------------------------------------------------------------------
  dicAlphabet := TDictionary<Integer, TAlphabet>.Create;
  dicAlphabetQuiz := TDictionary<Integer, TAlphabet>.Create;
  LoadAlphabetDictionaryCreate(dicAlphabet, True, True, True, True, True, True,
    True, True, True, True, True, True, True, True, True, True, True,
    True, True);

  // Create Alphabet Quiz List And Wrong List
  lstAlphabetQuiz := TStringList.Create;
  lstAlphabetQuizWrongList := TStringList.Create;

  // Read, Write and Set Main Form
  // ---------------------------------------------------------------------------
  LoadSetMainFormConfig();
  LoadReadMainFormConfig();
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dicAlphabet.Free;
  dicAlphabetQuiz.Free;
  lstAlphabetQuiz.Free;
  lstAlphabetQuizWrongList.Free;
  LoadWriteMainFormConfig();
end;

// About Events
// =============================================================================
// On Click
// -----------------------------------------------------------------------------
procedure TfrmMain.allAboutOnClick(Sender: TObject);
begin
  if Sender = btnAbout then
  begin
    // About Form
    // ---------------------------------------------------------------------------
    frmAbout := TForm.Create(Application);
    with frmAbout do
    begin
      ClientWidth := 294;
      ClientHeight := 135;
      BorderStyle := bsDialog;
      BorderIcons := [biSystemMenu];
      Position := poMainFormCenter;
      Caption := sfrmAbout + sfrmMain;
    end;

    imgAboutApp := TImage.Create(frmAbout);
    with imgAboutApp do
    begin
      Parent := frmAbout;
      Top := 8;
      Left := 8;
      AutoSize := False;
      Width := 32;
      Height := 32;
      Stretch := True;
      Proportional := True;
      Center := True;
      Picture.Graphic := LoadResourceImage('imgapp', 'MAIN');
    end;

    lblAboutApp := TLabel.Create(frmAbout);
    with lblAboutApp do
    begin
      Parent := frmAbout;
      Top := 8;
      Left := 48;
      AutoSize := False;
      Width := 246;
      Height := 39;
      WordWrap := True;
      Caption := sfrmMain + sNewLine + slblAboutVersion + LoadGetAppVersion() +
        sNewLine + slblAboutCopyright;
    end;

    bvlAboutSeparate := TBevel.Create(frmAbout);
    with bvlAboutSeparate do
    begin
      Parent := frmAbout;
      Top := 55;
      Left := 48;
      Width := 246;
      Height := 2;
      Shape := bsBottomLine;
    end;

    lblAboutMore := TLabel.Create(frmAbout);
    with lblAboutMore do
    begin
      Parent := frmAbout;
      Left := 48;
      Top := 65;
      Width := 246;
      Height := 39;
      Caption := slblAboutMore1 + sNewLine + slblAboutMore2;
    end;

    lblAboutHomepage := TLabel.Create(frmAbout);
    with lblAboutHomepage do
    begin
      Parent := frmAbout;
      Left := 119;
      Top := 65;
      Width := 120;
      Height := 13;
      Font.Color := clBlue;
      Font.Style := [fsUnderline];
      Caption := slblAboutHomepage;
      OnMouseMove := allAboutOnMouseMove;
      OnClick := allAboutOnClick;
    end;

    btnAboutOK := TButton.Create(frmAbout);
    with btnAboutOK do
    begin
      Parent := frmAbout;
      Top := 112;
      Left := 219;
      Width := 75;
      Height := 23;
      Caption := sbtnAboutOK;
      OnClick := allAboutOnClick;
    end;

    frmAbout.ShowModal;
  end

  else if Sender = btnAboutOK then
  begin
    frmAbout.Close;
  end

  else if Sender = lblAboutHomepage then
  begin
    ShellExecute(self.WindowHandle, 'open', PChar(sHomepage), nil, nil,
      SW_SHOWNORMAL);
  end;
end;

// On Mouse Move
// -----------------------------------------------------------------------------
procedure TfrmMain.allAboutOnMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if Sender = lblAboutHomepage then
    lblAboutHomepage.Cursor := crHandPoint;
end;

// Alphabet Event
// =============================================================================
// On Click
// -----------------------------------------------------------------------------
procedure TfrmMain.allAlphabetOnClick(Sender: TObject);
begin
  if Sender = rdtAlphabetTypeHiragana then
    LoadAlphabetTable(True)

  else if Sender = rdtAlphabetTypeKatakana then
    LoadAlphabetTable(False);
end;

// On Select Cell
// -----------------------------------------------------------------------------
procedure TfrmMain.allAlphabetOnSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  if Sender = sgdAlphabetTable1 then
    LoadAlphabetCardSoundWrite(True, chkAlphabetOptionEnableSound.Checked,
      ARow, ACol)

  else if Sender = sgdAlphabetTable2 then
    LoadAlphabetCardSoundWrite(False, chkAlphabetOptionEnableSound.Checked,
      ARow, ACol);
end;

// Alphabet Quiz Event
// =============================================================================
// On Click
// -----------------------------------------------------------------------------
procedure TfrmMain.allAlphabetQuizOnClick(Sender: TObject);
begin
  // Button Start Stop
  // ---------------------------------------------------------------------------
  if Sender = btnAlphabetQuizStartStop then
  begin
    if (not chkAlphabetQuizSourceAACol.Checked) and
      (not chkAlphabetQuizSourceKACol.Checked) and
      (not chkAlphabetQuizSourceGACol.Checked) and
      (not chkAlphabetQuizSourceSACol.Checked) and
      (not chkAlphabetQuizSourceZACol.Checked) and
      (not chkAlphabetQuizSourceTACol.Checked) and
      (not chkAlphabetQuizSourceDACol.Checked) and
      (not chkAlphabetQuizSourceNACol.Checked) and
      (not chkAlphabetQuizSourceHACol.Checked) and
      (not chkAlphabetQuizSourceBACol.Checked) and
      (not chkAlphabetQuizSourcePACol.Checked) and
      (not chkAlphabetQuizSourceMACol.Checked) and
      (not chkAlphabetQuizSourceYACol.Checked) and
      (not chkAlphabetQuizSourceRACol.Checked) and
      (not chkAlphabetQuizSourceWACol.Checked) and
      (not chkAlphabetQuizSourceNNCol.Checked) and
      (not chkAlphabetQuizSourceYARow.Checked) and
      (not chkAlphabetQuizSourceYURow.Checked) and
      (not chkAlphabetQuizSourceYORow.Checked) then
    begin
      lblAlphabetQuizCardMain.Caption := sNull;
      lblAlphabetQuizCardTitle.Caption := slblAlphabetQuizCardTitleSourceEmpty;
    end
    else
    begin
      dicAlphabetQuiz.Clear;
      LoadAlphabetDictionaryCreate(dicAlphabetQuiz,
        chkAlphabetQuizSourceAACol.Checked, chkAlphabetQuizSourceKACol.Checked,
        chkAlphabetQuizSourceGACol.Checked, chkAlphabetQuizSourceSACol.Checked,
        chkAlphabetQuizSourceZACol.Checked, chkAlphabetQuizSourceTACol.Checked,
        chkAlphabetQuizSourceDACol.Checked, chkAlphabetQuizSourceNACol.Checked,
        chkAlphabetQuizSourceHACol.Checked, chkAlphabetQuizSourceBACol.Checked,
        chkAlphabetQuizSourcePACol.Checked, chkAlphabetQuizSourceMACol.Checked,
        chkAlphabetQuizSourceYACol.Checked, chkAlphabetQuizSourceRACol.Checked,
        chkAlphabetQuizSourceWACol.Checked, chkAlphabetQuizSourceNNCol.Checked,
        chkAlphabetQuizSourceYARow.Checked, chkAlphabetQuizSourceYURow.Checked,
        chkAlphabetQuizSourceYORow.Checked);

      if dicAlphabetQuiz.Count > 0 then
      begin
        if btnAlphabetQuizStartStop.Caption = sbtnAlphabetQuizStart then
          LoadAlphabetQuizStarted()
        else if btnAlphabetQuizStartStop.Caption = sbtnAlphabetQuizStop then
        begin
          LoadAlphabetQuizStopped();
          lblAlphabetQuizCardTitle.Caption := slblAlphabetQuizCardTitleStopped;
        end;
      end;
    end;
  end

  // Butotn Next
  // ---------------------------------------------------------------------------
  else if Sender = btnAlphabetQuizNext then
  begin
    LoadAlphabetQuizCheck();
    LoadAlphabetQuizCard();
  end

  // Button Get
  // ---------------------------------------------------------------------------
  else if Sender = btnAlphabetQuizGet then
  begin
    if chkAlphabetQuizOptionPauseIfGetButtonPressed.Checked then
      tmrAlphabetQuizLimitedTime.Enabled := False;

    LoadAlphabetQuizGet();
  end

  // Radio Button Type
  else if (Sender = rdtAlphabetQuizTypeHiraganaPractice) or
    (Sender = rdtAlphabetQuizTypeKatakanaPractice) then
    chkAlphabetQuizOptionGetAnswerWithSound.Enabled := True

  else if (Sender = rdtAlphabetQuizTypeWritingPracticeHiragana) or
    (Sender = rdtAlphabetQuizTypeWritingPracticeKatakana) then
  begin
    chkAlphabetQuizOptionGetAnswerWithSound.Checked := False;
    chkAlphabetQuizOptionGetAnswerWithSound.Enabled := False;
  end

  // Checkbox Option
  // ---------------------------------------------------------------------------
  else if Sender = chkAlphabetQuizOptionLimitedTime then
  begin
    if chkAlphabetQuizOptionLimitedTime.Checked then
    begin
      edtAlphabetQuizOptionLimitedTime.Enabled := True;
      chkAlphabetQuizOptionGetAnswerBefore.Enabled := True;
      chkAlphabetQuizOptionPauseIfGetButtonPressed.Enabled := True;
    end
    else
    begin
      edtAlphabetQuizOptionLimitedTime.Enabled := False;
      chkAlphabetQuizOptionGetAnswerBefore.Checked := False;
      chkAlphabetQuizOptionPauseIfGetButtonPressed.Checked := False;
      chkAlphabetQuizOptionGetAnswerBefore.Enabled := False;
      chkAlphabetQuizOptionPauseIfGetButtonPressed.Enabled := False;
    end;
  end

  else if Sender = chkAlphabetQuizOptionGetAnswerBefore then
  begin
    if chkAlphabetQuizOptionGetAnswerBefore.Checked then
    begin
      edtAlphabetQuizOptionGetAnswerBefore.Enabled := True;
      if edtAlphabetQuizOptionGetAnswerBefore.Text <> sNull then
        if StrToInt(edtAlphabetQuizOptionGetAnswerBefore.Text) >
          StrToInt(edtAlphabetQuizOptionLimitedTime.Text) then
          edtAlphabetQuizOptionGetAnswerBefore.Text :=
            edtAlphabetQuizOptionLimitedTime.Text;
    end
    else
      edtAlphabetQuizOptionGetAnswerBefore.Enabled := False;
  end

  // Select All, Deselect All
  // ---------------------------------------------------------------------------
  else if Sender = lblAlphabetQuizSourceSelectAll1 then
  begin
    chkAlphabetQuizSourceAACol.Checked := True;
    chkAlphabetQuizSourceKACol.Checked := True;
    chkAlphabetQuizSourceSACol.Checked := True;
    chkAlphabetQuizSourceTACol.Checked := True;
    chkAlphabetQuizSourceNACol.Checked := True;
    chkAlphabetQuizSourceHACol.Checked := True;
    chkAlphabetQuizSourceMACol.Checked := True;
    chkAlphabetQuizSourceYACol.Checked := True;
    chkAlphabetQuizSourceRACol.Checked := True;
    chkAlphabetQuizSourceWACol.Checked := True;
    chkAlphabetQuizSourceNNCol.Checked := True;
  end

  else if Sender = lblAlphabetQuizSourceDeselectAll1 then
  begin
    chkAlphabetQuizSourceAACol.Checked := False;
    chkAlphabetQuizSourceKACol.Checked := False;
    chkAlphabetQuizSourceSACol.Checked := False;
    chkAlphabetQuizSourceTACol.Checked := False;
    chkAlphabetQuizSourceNACol.Checked := False;
    chkAlphabetQuizSourceHACol.Checked := False;
    chkAlphabetQuizSourceMACol.Checked := False;
    chkAlphabetQuizSourceYACol.Checked := False;
    chkAlphabetQuizSourceRACol.Checked := False;
    chkAlphabetQuizSourceWACol.Checked := False;
    chkAlphabetQuizSourceNNCol.Checked := False;
  end

  else if Sender = lblAlphabetQuizSourceSelectAll2 then
  begin
    chkAlphabetQuizSourceGACol.Checked := True;
    chkAlphabetQuizSourceZACol.Checked := True;
    chkAlphabetQuizSourceDACol.Checked := True;
    chkAlphabetQuizSourceBACol.Checked := True;
    chkAlphabetQuizSourcePACol.Checked := True;
  end

  else if Sender = lblAlphabetQuizSourceDeselectAll2 then
  begin
    chkAlphabetQuizSourceGACol.Checked := False;
    chkAlphabetQuizSourceZACol.Checked := False;
    chkAlphabetQuizSourceDACol.Checked := False;
    chkAlphabetQuizSourceBACol.Checked := False;
    chkAlphabetQuizSourcePACol.Checked := False;
  end

  else if Sender = lblAlphabetQuizSourceSelectAll3 then
  begin
    chkAlphabetQuizSourceYARow.Checked := True;
    chkAlphabetQuizSourceYURow.Checked := True;
    chkAlphabetQuizSourceYORow.Checked := True;
  end

  else if Sender = lblAlphabetQuizSourceDeselectAll3 then
  begin
    chkAlphabetQuizSourceYARow.Checked := False;
    chkAlphabetQuizSourceYURow.Checked := False;
    chkAlphabetQuizSourceYORow.Checked := False;
  end

  // ListBox Wrong List
  else if Sender = lbxAlphabetQuizWrongList then
  begin
    if dicAlphabetQuiz.TryGetValue
      (StrToInt(lstAlphabetQuizWrongList[lbxAlphabetQuizWrongList.ItemIndex]),
      alpAlphabet) = True then
    begin
      if rdtAlphabetQuizTypeHiraganaPractice.Checked then
        lblAlphabetQuizCardMain.Caption := alpAlphabet.Hiragana
      else if rdtAlphabetQuizTypeKatakanaPractice.Checked then
        lblAlphabetQuizCardMain.Caption := alpAlphabet.Hiragana;

      lblAlphabetQuizCardTitle.Caption := alpAlphabet.Romanji0;

      if chkAlphabetQuizOptionGetAnswerWithSound.Checked then
        LoadResourceSound(alpAlphabet.Sound, 'SOUNDS');
    end;
  end;
end;

// On Key Press
// -----------------------------------------------------------------------------
procedure TfrmMain.allAlphabetQuizOnKeyPress(Sender: TObject; var Key: Char);
begin
  if Sender = edtAlphabetQuizAnswer then
    if ord(Key) = VK_RETURN then
    begin
      Key := #0;
      LoadAlphabetQuizCheck();
      LoadAlphabetQuizCard();
    end;
end;

// On Change
// -----------------------------------------------------------------------------
procedure TfrmMain.allAlphabetQuizOnChange(Sender: TObject);
begin
  if Sender = edtAlphabetQuizOptionLimitedTime then
  begin
    if edtAlphabetQuizOptionLimitedTime.Text <> sNull then
    begin
      if StrToInt(edtAlphabetQuizOptionLimitedTime.Text) < 1 then
        edtAlphabetQuizOptionLimitedTime.Text := IntToStr(1);

      if StrToInt(edtAlphabetQuizOptionLimitedTime.Text) > 9999 then
        edtAlphabetQuizOptionLimitedTime.Text := IntToStr(9999);
    end
    else
      edtAlphabetQuizOptionLimitedTime.Text := IntToStr(1);
  end

  else if Sender = edtAlphabetQuizOptionGetAnswerBefore then
  begin
    if (edtAlphabetQuizOptionGetAnswerBefore.Text <> sNull) then
    begin
      if StrToInt(edtAlphabetQuizOptionGetAnswerBefore.Text) < 1 then
        edtAlphabetQuizOptionGetAnswerBefore.Text := IntToStr(1)

      else if StrToInt(edtAlphabetQuizOptionGetAnswerBefore.Text) >
        StrToInt(edtAlphabetQuizOptionLimitedTime.Text) then
        edtAlphabetQuizOptionGetAnswerBefore.Text :=
          edtAlphabetQuizOptionLimitedTime.Text;
    end
    else
      edtAlphabetQuizOptionGetAnswerBefore.Text := IntToStr(1);
  end;
end;

// On Mouse Move
// -----------------------------------------------------------------------------
procedure TfrmMain.allAlphabetQuizOnMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Sender = lblAlphabetQuizSourceSelectAll1 then
    lblAlphabetQuizSourceSelectAll1.Cursor := crHandPoint

  else if Sender = lblAlphabetQuizSourceSelectAll2 then
    lblAlphabetQuizSourceSelectAll2.Cursor := crHandPoint

  else if Sender = lblAlphabetQuizSourceSelectAll3 then
    lblAlphabetQuizSourceSelectAll3.Cursor := crHandPoint

  else if Sender = lblAlphabetQuizSourceDeselectAll1 then
    lblAlphabetQuizSourceDeselectAll1.Cursor := crHandPoint

  else if Sender = lblAlphabetQuizSourceDeselectAll2 then
    lblAlphabetQuizSourceDeselectAll2.Cursor := crHandPoint

  else if Sender = lblAlphabetQuizSourceDeselectAll3 then
    lblAlphabetQuizSourceDeselectAll3.Cursor := crHandPoint;
end;

// On Timer
// -----------------------------------------------------------------------------
procedure TfrmMain.allAlphabetQuizOnTimer(Sender: TObject);
begin
  if Sender = tmrAlphabetQuizLimitedTime then
  begin
    lblAlphabetQuizLimitedTime.Caption := IntToStr(intAlphabetQuizLimitedTime);
    intAlphabetQuizLimitedTime := intAlphabetQuizLimitedTime - 1;

    if chkAlphabetQuizOptionGetAnswerBefore.Checked then
      if edtAlphabetQuizOptionGetAnswerBefore.Text <> sNull then
        if StrToInt(edtAlphabetQuizOptionGetAnswerBefore.Text) > 0 then
          if intAlphabetQuizLimitedTime = StrToInt
            (edtAlphabetQuizOptionGetAnswerBefore.Text) - 1 then
            if btnAlphabetQuizGet.Enabled = True then
            begin
              LoadAlphabetQuizGet;
              btnAlphabetQuizGet.Enabled := False;
            end;

    if intAlphabetQuizLimitedTime < 0 then
    begin
      if edtAlphabetQuizOptionLimitedTime.Text <> sNull then
        if StrToInt(edtAlphabetQuizOptionLimitedTime.Text) > 0 then
          intAlphabetQuizLimitedTime :=
            StrToInt(edtAlphabetQuizOptionLimitedTime.Text);
      LoadAlphabetQuizCheck();
      LoadAlphabetQuizCard();
    end;
  end;
end;

// Alphabet Function & Procedure
// =============================================================================
// Alphabet Table
// -----------------------------------------------------------------------------
procedure LoadAlphabetTable(isHiragana: Boolean);
var
  i, j: Integer;

begin
  for i := 0 to 4 do
    sgdAlphabetTable1.Cells[0, i + 1] := Table1FixedColTitle[i];
  for j := 0 to 14 do
    sgdAlphabetTable1.Cells[j + 1, 0] := Table1FixedRowTitle[j];

  for i := 0 to 2 do
    sgdAlphabetTable2.Cells[0, i + 1] := Table2FixedColTitle[i];
  for j := 0 to 10 do
    sgdAlphabetTable2.Cells[j + 1, 0] := Table2FixedRowTitle[j];

  if isHiragana then
  begin
    for j := 0 to 11 do
      for i := 0 to 4 do
      begin
        if (dicAlphabet.TryGetValue(j * 5 + i, alpAlphabet) = True) then
          sgdAlphabetTable1.Cells[j + 1, i + 1] := alpAlphabet.Hiragana;
      end;

    for i := 0 to 2 do
      if (dicAlphabet.TryGetValue(60 + i, alpAlphabet) = True) then
        sgdAlphabetTable1.Cells[13, i * 2 + 1] := alpAlphabet.Hiragana;

    for i := 0 to 4 do
      if (dicAlphabet.TryGetValue(63 + i, alpAlphabet) = True) then
        sgdAlphabetTable1.Cells[14, i + 1] := alpAlphabet.Hiragana;

    for i := 0 to 1 do
      if (dicAlphabet.TryGetValue(68 + i, alpAlphabet) = True) then
        sgdAlphabetTable1.Cells[15, i * 4 + 1] := alpAlphabet.Hiragana;

    if (dicAlphabet.TryGetValue(70, alpAlphabet) = True) then
      sgdAlphabetTable1.Cells[16, 3] := alpAlphabet.Hiragana;

    for i := 0 to 2 do
      for j := 0 to 10 do
        if (dicAlphabet.TryGetValue(71 + 10 * i + i + j, alpAlphabet) = True)
        then
          sgdAlphabetTable2.Cells[j + 1, i + 1] := alpAlphabet.Hiragana;
  end

  else
  begin
    for j := 0 to 11 do
      for i := 0 to 4 do
      begin
        if (dicAlphabet.TryGetValue(j * 5 + i, alpAlphabet) = True) then
          sgdAlphabetTable1.Cells[j + 1, i + 1] := alpAlphabet.Katakana;
      end;

    for i := 0 to 2 do
      if (dicAlphabet.TryGetValue(60 + i, alpAlphabet) = True) then
        sgdAlphabetTable1.Cells[13, i * 2 + 1] := alpAlphabet.Katakana;

    for i := 0 to 4 do
      if (dicAlphabet.TryGetValue(63 + i, alpAlphabet) = True) then
        sgdAlphabetTable1.Cells[14, i + 1] := alpAlphabet.Katakana;

    for i := 0 to 1 do
      if (dicAlphabet.TryGetValue(68 + i, alpAlphabet) = True) then
        sgdAlphabetTable1.Cells[15, i * 4 + 1] := alpAlphabet.Katakana;

    if (dicAlphabet.TryGetValue(70, alpAlphabet) = True) then
      sgdAlphabetTable1.Cells[16, 3] := alpAlphabet.Katakana;

    for i := 0 to 2 do
      for j := 0 to 10 do
        if (dicAlphabet.TryGetValue(71 + 10 * i + i + j, alpAlphabet) = True)
        then
          sgdAlphabetTable2.Cells[j + 1, i + 1] := alpAlphabet.Katakana;
  end;
end;

// Alphabet Card And Sound
// -----------------------------------------------------------------------------
procedure LoadAlphabetCardSoundWrite(Table1, SoundEnabled: Boolean;
  ARow, ACol: Integer);
begin
  if Table1 then
  begin
    case ACol of
      1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12:
        begin
          if dicAlphabet.TryGetValue((ACol - 1) * 5 + (ARow - 1), alpAlphabet) = True
          then
          begin
            if rdtAlphabetTypeHiragana.Checked then
            begin
              imgAlphabetHowToWrite.Picture.Graphic :=
                LoadResourceImage(alpAlphabet.Image, 'HIRAGANASTROKE');
              lblAlphabetCardMain.Caption := alpAlphabet.Hiragana;
            end

            else if rdtAlphabetTypeKatakana.Checked then
            begin
              imgAlphabetHowToWrite.Picture.Graphic :=
                LoadResourceImage(alpAlphabet.Image, 'KATAKANASTROKE');
              lblAlphabetCardMain.Caption := alpAlphabet.Katakana;
            end;

            lblAlphabetCardTitle.Caption := alpAlphabet.Romanji0;

            if SoundEnabled then
              LoadResourceSound(alpAlphabet.Sound, 'SOUNDS');
          end;
        end;

      13:
        case ARow of
          1, 3, 5:
            begin
              if dicAlphabet.TryGetValue(60 + Trunc((ARow - 1) / 2),
                alpAlphabet) = True then
              begin
                if rdtAlphabetTypeHiragana.Checked then
                begin
                  imgAlphabetHowToWrite.Picture.Graphic :=
                    LoadResourceImage(alpAlphabet.Image, 'HIRAGANASTROKE');
                  lblAlphabetCardMain.Caption := alpAlphabet.Hiragana;
                end

                else if rdtAlphabetTypeKatakana.Checked then
                begin
                  imgAlphabetHowToWrite.Picture.Graphic :=
                    LoadResourceImage(alpAlphabet.Image, 'KATAKANASTROKE');
                  lblAlphabetCardMain.Caption := alpAlphabet.Katakana;
                end;

                lblAlphabetCardTitle.Caption := alpAlphabet.Romanji0;

                if SoundEnabled then
                  LoadResourceSound(alpAlphabet.Sound, 'SOUNDS');
              end;
            end;
        end;

      14:
        begin
          if dicAlphabet.TryGetValue(63 + ARow - 1, alpAlphabet) = True then
          begin
            if rdtAlphabetTypeHiragana.Checked then
            begin
              imgAlphabetHowToWrite.Picture.Graphic :=
                LoadResourceImage(alpAlphabet.Image, 'HIRAGANASTROKE');
              lblAlphabetCardMain.Caption := alpAlphabet.Hiragana;
            end

            else if rdtAlphabetTypeKatakana.Checked then
            begin
              imgAlphabetHowToWrite.Picture.Graphic :=
                LoadResourceImage(alpAlphabet.Image, 'KATAKANASTROKE');
              lblAlphabetCardMain.Caption := alpAlphabet.Katakana;
            end;

            lblAlphabetCardTitle.Caption := alpAlphabet.Romanji0;

            if SoundEnabled then
              LoadResourceSound(alpAlphabet.Sound, 'SOUNDS');
          end;
        end;

      15:
        case ARow of
          1, 5:
            if dicAlphabet.TryGetValue(68 + Trunc((ARow - 1) / 4), alpAlphabet)
              = True then
            begin
              if rdtAlphabetTypeHiragana.Checked then
              begin
                imgAlphabetHowToWrite.Picture.Graphic :=
                  LoadResourceImage(alpAlphabet.Image, 'HIRAGANASTROKE');
                lblAlphabetCardMain.Caption := alpAlphabet.Hiragana;
              end

              else if rdtAlphabetTypeKatakana.Checked then
              begin
                imgAlphabetHowToWrite.Picture.Graphic :=
                  LoadResourceImage(alpAlphabet.Image, 'KATAKANASTROKE');
                lblAlphabetCardMain.Caption := alpAlphabet.Katakana;
              end;

              lblAlphabetCardTitle.Caption := alpAlphabet.Romanji0;

              if SoundEnabled then
                LoadResourceSound(alpAlphabet.Sound, 'SOUNDS');
            end;
        end;

      16:
        case ARow of
          3:
            if dicAlphabet.TryGetValue(70, alpAlphabet) = True then
            begin
              if rdtAlphabetTypeHiragana.Checked then
              begin
                imgAlphabetHowToWrite.Picture.Graphic :=
                  LoadResourceImage(alpAlphabet.Image, 'HIRAGANASTROKE');
                lblAlphabetCardMain.Caption := alpAlphabet.Hiragana;
              end

              else if rdtAlphabetTypeKatakana.Checked then
              begin
                imgAlphabetHowToWrite.Picture.Graphic :=
                  LoadResourceImage(alpAlphabet.Image, 'KATAKANASTROKE');
                lblAlphabetCardMain.Caption := alpAlphabet.Katakana;
              end;

              lblAlphabetCardTitle.Caption := alpAlphabet.Romanji0;

              if SoundEnabled then
                LoadResourceSound(alpAlphabet.Sound, 'SOUNDS');
            end;
        end;
    end;
  end

  else
  begin
    if dicAlphabet.TryGetValue(69 + 10 * (ARow - 1) + ARow + ACol, alpAlphabet)
      = True then
    begin
      if rdtAlphabetTypeHiragana.Checked then
      begin
        imgAlphabetHowToWrite.Picture.Graphic :=
          LoadResourceImage(alpAlphabet.Image, 'HIRAGANASTROKE');
        lblAlphabetCardMain.Caption := alpAlphabet.Hiragana;
      end

      else if rdtAlphabetTypeKatakana.Checked then
      begin
        imgAlphabetHowToWrite.Picture.Graphic :=
          LoadResourceImage(alpAlphabet.Image, 'KATAKANASTROKE');
        lblAlphabetCardMain.Caption := alpAlphabet.Katakana;
      end;

      lblAlphabetCardTitle.Caption := alpAlphabet.Romanji0;

      if SoundEnabled then
        LoadResourceSound(alpAlphabet.Sound, 'SOUNDS');
    end;
  end;
end;

// Alphabet Quiz Function & Procedure
// =============================================================================
// Alphabet Quiz Started
// -----------------------------------------------------------------------------
procedure LoadAlphabetQuizStarted();
var
  i: Integer;

begin
  // Form Interface
  btnAlphabetQuizStartStop.Caption := sbtnAlphabetQuizStop;
  btnAlphabetQuizGet.Enabled := True;
  btnAlphabetQuizNext.Enabled := True;

  if rdtAlphabetQuizTypeHiraganaPractice.Checked or
    rdtAlphabetQuizTypeKatakanaPractice.Checked then
    edtAlphabetQuizAnswer.Enabled := True;

  gbxAlphabetQuizType.Enabled := False;
  gbxAlphabetQuizOption.Enabled := False;
  gbxAlphabetQuizSource.Enabled := False;

  gbxAlphabetQuizWrongList.Enabled := False;
  lbxAlphabetQuizWrongList.Clear;

  // Process
  lstAlphabetQuiz.Clear;
  lstAlphabetQuizWrongList.Clear;

  for i := 0 to dicAlphabet.Count - 1 do
    if dicAlphabetQuiz.ContainsKey(i) then
      lstAlphabetQuiz.Add(IntToStr(i));

  intAlphabetQuizQuestion := 0;
  intAlphabetQuizRight := 0;
  intAlphabetQuizWrong := 0;
  intAlphabetQuizTotal := dicAlphabetQuiz.Count;

  lblAlphabetQuizQuestion.Caption := IntToStr(intAlphabetQuizQuestion) + sSlash
    + IntToStr(intAlphabetQuizTotal);
  lblAlphabetQuizRight.Caption := IntToStr(intAlphabetQuizRight) + sSlash +
    IntToStr(intAlphabetQuizQuestion);
  lblAlphabetQuizWrong.Caption := IntToStr(intAlphabetQuizWrong) + sSlash +
    IntToStr(intAlphabetQuizQuestion);

  LoadAlphabetQuizCard();
  if edtAlphabetQuizOptionLimitedTime.Text <> sNull then
    if (StrToInt(edtAlphabetQuizOptionLimitedTime.Text) > 0) and
      (StrToInt(edtAlphabetQuizOptionLimitedTime.Text) <= 9999) then
      intAlphabetQuizLimitedTime :=
        StrToInt(edtAlphabetQuizOptionLimitedTime.Text);

  if chkAlphabetQuizOptionLimitedTime.Checked then
    tmrAlphabetQuizLimitedTime.Enabled := True
  else
    tmrAlphabetQuizLimitedTime.Enabled := False;
end;

// Alphabet Quiz Stopped
// -----------------------------------------------------------------------------
procedure LoadAlphabetQuizStopped();
begin
  sndPlaySound(nil, SND_NODEFAULT);

  // Form Interface
  lblAlphabetQuizCardMain.Caption := sNull;
  lblAlphabetQuizCardTitle.Caption := sNull;
  lblAlphabetQuizLimitedTime.Caption := sNull;

  btnAlphabetQuizStartStop.Caption := sbtnAlphabetQuizStart;
  btnAlphabetQuizGet.Enabled := False;
  btnAlphabetQuizNext.Enabled := False;
  edtAlphabetQuizAnswer.Enabled := False;

  gbxAlphabetQuizType.Enabled := True;
  gbxAlphabetQuizOption.Enabled := True;
  gbxAlphabetQuizSource.Enabled := True;

  if rdtAlphabetQuizTypeHiraganaPractice.Checked or
    rdtAlphabetQuizTypeKatakanaPractice.Checked then
    gbxAlphabetQuizWrongList.Enabled := True;

  // Process
  if lstAlphabetQuiz.Count > 0 then
    LoadAlphabetQuizCheck();

  tmrAlphabetQuizLimitedTime.Enabled := False;
end;

// Alphabet Quiz Card
// -----------------------------------------------------------------------------
procedure LoadAlphabetQuizCard();
begin
  if lstAlphabetQuiz.Count > 0 then
  begin
    lblAlphabetQuizCardMain.Caption := sNull;
    lblAlphabetQuizCardTitle.Caption := sNull;

    if chkAlphabetQuizOptionLimitedTime.Checked then
      lblAlphabetQuizLimitedTime.Caption := slblAlphabetQuizLimitedTimeNext
    else
      lblAlphabetQuizLimitedTime.Caption := slblAlphabetQuizLimitedTimeInfinity;

    btnAlphabetQuizGet.Enabled := True;

    if rdtAlphabetQuizTypeHiraganaPractice.Checked or
      rdtAlphabetQuizTypeKatakanaPractice.Checked then
    begin
      edtAlphabetQuizAnswer.Enabled := True;
      if pagMain.TabIndex = 1 then
        edtAlphabetQuizAnswer.SetFocus;
    end;

    intAlphabetQuizQuestion := intAlphabetQuizQuestion + 1;

    lblAlphabetQuizQuestion.Caption := IntToStr(intAlphabetQuizQuestion) +
      sSlash + IntToStr(intAlphabetQuizTotal);

    intRandomIndex := Random(lstAlphabetQuiz.Count);

    if dicAlphabetQuiz.TryGetValue(StrToInt(lstAlphabetQuiz[intRandomIndex]),
      alpAlphabet) = True then
    begin
      if rdtAlphabetQuizTypeHiraganaPractice.Checked then
        lblAlphabetQuizCardMain.Caption := alpAlphabet.Hiragana

      else if rdtAlphabetQuizTypeKatakanaPractice.Checked then
        lblAlphabetQuizCardMain.Caption := alpAlphabet.Katakana

      else
      begin
        lblAlphabetQuizCardMain.Caption := alpAlphabet.Romanji0;

        if alpAlphabet.Romanji0 <> alpAlphabet.Romanji1 then
          lblAlphabetQuizCardTitle.Caption := sBracketsLeft +
            alpAlphabet.Romanji1 + sBracketsRight;

        LoadResourceSound(alpAlphabet.Sound, 'SOUNDS');
      end;
    end;
  end
  else
  begin
    LoadAlphabetQuizStopped();
    lblAlphabetQuizCardTitle.Caption := slblAlphabetQuizCardTitleComplete;
  end;
end;

// Alphabet Quiz Check
// -----------------------------------------------------------------------------
procedure LoadAlphabetQuizCheck();
begin
  if dicAlphabetQuiz.TryGetValue(StrToInt(lstAlphabetQuiz[intRandomIndex]),
    alpAlphabet) = True then
  begin
    if chkAlphabetQuizOptionLimitedTime.Checked then
    begin
      tmrAlphabetQuizLimitedTime.Enabled := False;
      if edtAlphabetQuizOptionLimitedTime.Text <> sNull then
        if (StrToInt(edtAlphabetQuizOptionLimitedTime.Text) > 0) and
          (StrToInt(edtAlphabetQuizOptionLimitedTime.Text) <= 9999) then
          intAlphabetQuizLimitedTime :=
            StrToInt(edtAlphabetQuizOptionLimitedTime.Text);
      tmrAlphabetQuizLimitedTime.Enabled := True;
    end;

    if rdtAlphabetQuizTypeHiraganaPractice.Checked or
      rdtAlphabetQuizTypeKatakanaPractice.Checked then
    begin
      if (edtAlphabetQuizAnswer.Text = alpAlphabet.Romanji0) or
        (edtAlphabetQuizAnswer.Text = alpAlphabet.Romanji1) then
      begin
        intAlphabetQuizRight := intAlphabetQuizRight + 1;
        lblAlphabetQuizRight.Caption := IntToStr(intAlphabetQuizRight) + sSlash
          + IntToStr(intAlphabetQuizQuestion);
        lblAlphabetQuizWrong.Caption := IntToStr(intAlphabetQuizWrong) + sSlash
          + IntToStr(intAlphabetQuizQuestion);
      end
      else
      begin
        intAlphabetQuizWrong := intAlphabetQuizWrong + 1;
        lblAlphabetQuizRight.Caption := IntToStr(intAlphabetQuizRight) + sSlash
          + IntToStr(intAlphabetQuizQuestion);
        lblAlphabetQuizWrong.Caption := IntToStr(intAlphabetQuizWrong) + sSlash
          + IntToStr(intAlphabetQuizQuestion);

        lstAlphabetQuizWrongList.Insert(0, lstAlphabetQuiz[intRandomIndex]);
        if rdtAlphabetQuizTypeHiraganaPractice.Checked then
          lbxAlphabetQuizWrongList.Items.Insert(0, alpAlphabet.Hiragana + sSpace
            + sBracketsLeft + alpAlphabet.Romanji0 + sBracketsRight)
        else if rdtAlphabetQuizTypeKatakanaPractice.Checked then
          lbxAlphabetQuizWrongList.Items.Insert(0, alpAlphabet.Katakana + sSpace
            + sBracketsLeft + alpAlphabet.Romanji0 + sBracketsRight)
      end;
    end;

    edtAlphabetQuizAnswer.Clear;
    lstAlphabetQuiz.Delete(intRandomIndex);
  end;
end;

// Alphabet Quiz get
// -----------------------------------------------------------------------------
procedure LoadAlphabetQuizGet();
begin
  if dicAlphabetQuiz.TryGetValue(StrToInt(lstAlphabetQuiz[intRandomIndex]),
    alpAlphabet) = True then
  begin
    btnAlphabetQuizGet.Enabled := False;
    edtAlphabetQuizAnswer.Clear;
    edtAlphabetQuizAnswer.Enabled := False;

    if rdtAlphabetQuizTypeHiraganaPractice.Checked or
      rdtAlphabetQuizTypeKatakanaPractice.Checked then
    begin
      if chkAlphabetQuizOptionGetAnswerWithSound.Checked then
        LoadResourceSound(alpAlphabet.Sound, 'SOUNDS');

      if edtAlphabetQuizOptionLimitedTime.Text <> sNull then
        if (StrToInt(edtAlphabetQuizOptionLimitedTime.Text) > 0) and
          (StrToInt(edtAlphabetQuizOptionLimitedTime.Text) <= 9999) then
          if intAlphabetQuizLimitedTime >
            StrToInt(edtAlphabetQuizOptionLimitedTime.Text) then
            lblAlphabetQuizLimitedTime.Caption :=
              edtAlphabetQuizOptionLimitedTime.Text;
    end

    else if rdtAlphabetQuizTypeWritingPracticeHiragana.Checked then
      lblAlphabetQuizCardMain.Caption := alpAlphabet.Hiragana

    else if rdtAlphabetQuizTypeWritingPracticeKatakana.Checked then
      lblAlphabetQuizCardMain.Caption := alpAlphabet.Katakana;

    lblAlphabetQuizCardTitle.Caption := alpAlphabet.Romanji0;
  end;
end;

// Read, Write and Set Main Form Config
// =============================================================================
// Set Main Form Config
// -----------------------------------------------------------------------------
procedure LoadSetMainFormConfig();
begin
  btnAlphabetQuizGet.Enabled := False;
  btnAlphabetQuizNext.Enabled := False;
  gbxAlphabetQuizWrongList.Enabled := False;
  edtAlphabetQuizAnswer.Enabled := False;
  edtAlphabetQuizOptionLimitedTime.Enabled := False;
  chkAlphabetQuizOptionGetAnswerBefore.Enabled := False;
  edtAlphabetQuizOptionGetAnswerBefore.Enabled := False;
  chkAlphabetQuizOptionPauseIfGetButtonPressed.Enabled := False;
  chkAlphabetQuizOptionGetAnswerWithSound.Enabled := False;
  tmrAlphabetQuizLimitedTime.Enabled := False;
end;

// Read Main Form Config
// -----------------------------------------------------------------------------
procedure LoadReadMainFormConfig();
var
  iniGet: TIniFile;

begin
  iniGet := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    pagMain.TabIndex := iniGet.ReadInteger('Main', 'TabIndex', 0);

    rdtAlphabetTypeHiragana.Checked := iniGet.ReadBool('AlphabetType',
      'Hiragana', True);
    rdtAlphabetTypeKatakana.Checked := iniGet.ReadBool('AlphabetType',
      'Katakana', False);

    chkAlphabetOptionEnableSound.Checked := iniGet.ReadBool('AlphabetOption',
      'EnableSound', True);

    rdtAlphabetQuizTypeHiraganaPractice.Checked :=
      iniGet.ReadBool('AlphabetQuizType', 'HiraganaPractice', True);
    rdtAlphabetQuizTypeKatakanaPractice.Checked :=
      iniGet.ReadBool('AlphabetQuizType', 'KatakanaPractice', False);
    rdtAlphabetQuizTypeWritingPracticeHiragana.Checked :=
      iniGet.ReadBool('AlphabetQuizType', 'WritingPracticeHiragana', False);
    rdtAlphabetQuizTypeWritingPracticeKatakana.Checked :=
      iniGet.ReadBool('AlphabetQuizType', 'WritingPracticeKatakana', False);

    chkAlphabetQuizOptionLimitedTime.Checked :=
      iniGet.ReadBool('AlphabetQuizOption', 'LimitedTime', True);

    edtAlphabetQuizOptionLimitedTime.Text :=
      IntToStr(iniGet.ReadInteger('AlphabetQuizOption',
      'LimitedTimeNumber', 5));
    chkAlphabetQuizOptionGetAnswerBefore.Checked :=
      iniGet.ReadBool('AlphabetQuizOption', 'GetAnswerBefore', True);
    edtAlphabetQuizOptionGetAnswerBefore.Text :=
      IntToStr(iniGet.ReadInteger('AlphabetQuizOption',
      'GetAnswerBeforeNumber', 1));
    chkAlphabetQuizOptionPauseIfGetButtonPressed.Checked :=
      iniGet.ReadBool('AlphabetQuizOption', 'PauseIfGetButtonPressed', True);
    chkAlphabetQuizOptionGetAnswerWithSound.Checked :=
      iniGet.ReadBool('AlphabetQuizOption', 'GetAnswerWithSound', True);

    chkAlphabetQuizSourceAACol.Checked := iniGet.ReadBool('AlphabetQuizSource',
      'AACol', True);
    chkAlphabetQuizSourceKACol.Checked := iniGet.ReadBool('AlphabetQuizSource',
      'KACol', True);
    chkAlphabetQuizSourceSACol.Checked := iniGet.ReadBool('AlphabetQuizSource',
      'SACol', True);
    chkAlphabetQuizSourceTACol.Checked := iniGet.ReadBool('AlphabetQuizSource',
      'TACol', True);
    chkAlphabetQuizSourceNACol.Checked := iniGet.ReadBool('AlphabetQuizSource',
      'NACol', True);
    chkAlphabetQuizSourceHACol.Checked := iniGet.ReadBool('AlphabetQuizSource',
      'HACol', True);
    chkAlphabetQuizSourceMACol.Checked := iniGet.ReadBool('AlphabetQuizSource',
      'MACol', True);
    chkAlphabetQuizSourceYACol.Checked := iniGet.ReadBool('AlphabetQuizSource',
      'YACol', True);
    chkAlphabetQuizSourceRACol.Checked := iniGet.ReadBool('AlphabetQuizSource',
      'RACol', True);
    chkAlphabetQuizSourceWACol.Checked := iniGet.ReadBool('AlphabetQuizSource',
      'WACol', True);
    chkAlphabetQuizSourceNNCol.Checked := iniGet.ReadBool('AlphabetQuizSource',
      'NNCol', True);
    chkAlphabetQuizSourceGACol.Checked := iniGet.ReadBool('AlphabetQuizSource',
      'GACol', True);
    chkAlphabetQuizSourceZACol.Checked := iniGet.ReadBool('AlphabetQuizSource',
      'ZACol', True);
    chkAlphabetQuizSourceDACol.Checked := iniGet.ReadBool('AlphabetQuizSource',
      'DACol', True);
    chkAlphabetQuizSourceBACol.Checked := iniGet.ReadBool('AlphabetQuizSource',
      'BACol', True);
    chkAlphabetQuizSourcePACol.Checked := iniGet.ReadBool('AlphabetQuizSource',
      'PACol', True);
    chkAlphabetQuizSourceYARow.Checked := iniGet.ReadBool('AlphabetQuizSource',
      'YARow', True);
    chkAlphabetQuizSourceYURow.Checked := iniGet.ReadBool('AlphabetQuizSource',
      'YURow', True);
    chkAlphabetQuizSourceYORow.Checked := iniGet.ReadBool('AlphabetQuizSource',
      'YORow', True);
  finally
    iniGet.Free;
  end;
end;

// Write Main Form Config
// -----------------------------------------------------------------------------
procedure LoadWriteMainFormConfig();
var
  iniSet: TIniFile;
  uniFile: TStringList;

begin
  uniFile := TStringList.Create;
  try
    uniFile.Add(sSemicolon + sfrmMain + sNewLine + sSemicolon + slblAboutVersion
      + LoadGetAppVersion() + sNewLine + sSemicolon + slblAboutCopyright +
      sNewLine + sSemicolon);
    uniFile.SaveToFile(ChangeFileExt(ParamStr(0), '.ini'), TEncoding.Unicode);
  finally
    uniFile.Free;
  end;

  iniSet := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    iniSet.WriteInteger('Main', 'TabIndex', pagMain.TabIndex);

    iniSet.WriteBool('AlphabetType', 'Hiragana',
      rdtAlphabetTypeHiragana.Checked);
    iniSet.WriteBool('AlphabetType', 'Katakana',
      rdtAlphabetTypeKatakana.Checked);

    iniSet.WriteBool('AlphabetOption', 'EnableSound',
      chkAlphabetOptionEnableSound.Checked);

    iniSet.WriteBool('AlphabetQuizType', 'HiraganaPractice',
      rdtAlphabetQuizTypeHiraganaPractice.Checked);
    iniSet.WriteBool('AlphabetQuizType', 'KatakanaPractice',
      rdtAlphabetQuizTypeKatakanaPractice.Checked);
    iniSet.WriteBool('AlphabetQuizType', 'WritingPracticeHiragana',
      rdtAlphabetQuizTypeWritingPracticeHiragana.Checked);
    iniSet.WriteBool('AlphabetQuizType', 'WritingPracticeKatakana',
      rdtAlphabetQuizTypeWritingPracticeKatakana.Checked);

    iniSet.WriteBool('AlphabetQuizOption', 'LimitedTime',
      chkAlphabetQuizOptionLimitedTime.Checked);
    iniSet.WriteInteger('AlphabetQuizOption', 'LimitedTimeNumber',
      StrToInt(edtAlphabetQuizOptionLimitedTime.Text));
    iniSet.WriteBool('AlphabetQuizOption', 'GetAnswerBefore',
      chkAlphabetQuizOptionGetAnswerBefore.Checked);
    iniSet.WriteInteger('AlphabetQuizOption', 'GetAnswerBeforeNumber',
      StrToInt(edtAlphabetQuizOptionGetAnswerBefore.Text));
    iniSet.WriteBool('AlphabetQuizOption', 'PauseIfGetButtonPressed',
      chkAlphabetQuizOptionPauseIfGetButtonPressed.Checked);
    iniSet.WriteBool('AlphabetQuizOption', 'GetAnswerWithSound',
      chkAlphabetQuizOptionGetAnswerWithSound.Checked);

    iniSet.WriteBool('AlphabetQuizSource', 'AACol',
      chkAlphabetQuizSourceAACol.Checked);
    iniSet.WriteBool('AlphabetQuizSource', 'KACol',
      chkAlphabetQuizSourceKACol.Checked);
    iniSet.WriteBool('AlphabetQuizSource', 'SACol',
      chkAlphabetQuizSourceSACol.Checked);
    iniSet.WriteBool('AlphabetQuizSource', 'TACol',
      chkAlphabetQuizSourceTACol.Checked);
    iniSet.WriteBool('AlphabetQuizSource', 'NACol',
      chkAlphabetQuizSourceNACol.Checked);
    iniSet.WriteBool('AlphabetQuizSource', 'HACol',
      chkAlphabetQuizSourceHACol.Checked);
    iniSet.WriteBool('AlphabetQuizSource', 'MACol',
      chkAlphabetQuizSourceMACol.Checked);
    iniSet.WriteBool('AlphabetQuizSource', 'YACol',
      chkAlphabetQuizSourceYACol.Checked);
    iniSet.WriteBool('AlphabetQuizSource', 'RACol',
      chkAlphabetQuizSourceRACol.Checked);
    iniSet.WriteBool('AlphabetQuizSource', 'WACol',
      chkAlphabetQuizSourceWACol.Checked);
    iniSet.WriteBool('AlphabetQuizSource', 'NNCol',
      chkAlphabetQuizSourceNNCol.Checked);
    iniSet.WriteBool('AlphabetQuizSource', 'GACol',
      chkAlphabetQuizSourceGACol.Checked);
    iniSet.WriteBool('AlphabetQuizSource', 'ZACol',
      chkAlphabetQuizSourceZACol.Checked);
    iniSet.WriteBool('AlphabetQuizSource', 'DACol',
      chkAlphabetQuizSourceDACol.Checked);
    iniSet.WriteBool('AlphabetQuizSource', 'BACol',
      chkAlphabetQuizSourceBACol.Checked);
    iniSet.WriteBool('AlphabetQuizSource', 'PACol',
      chkAlphabetQuizSourcePACol.Checked);
    iniSet.WriteBool('AlphabetQuizSource', 'YARow',
      chkAlphabetQuizSourceYARow.Checked);
    iniSet.WriteBool('AlphabetQuizSource', 'YURow',
      chkAlphabetQuizSourceYURow.Checked);
    iniSet.WriteBool('AlphabetQuizSource', 'YORow',
      chkAlphabetQuizSourceYORow.Checked);
  finally
    iniSet.Free;
  end;
end;

end.
