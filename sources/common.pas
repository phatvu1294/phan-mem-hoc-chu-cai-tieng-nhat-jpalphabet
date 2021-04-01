unit common;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Generics.Collections,
  MMSystem, PNGImage;

const
  Table1FixedRowTitle: array [0 .. 14] of String = ('▪', 'k', 'g', 's', 'z',
    't', 'd', 'n', 'h', 'b', 'p', 'm', 'y', 'r', 'w');
  Table1FixedColTitle: array [0 .. 4] of String = ('a', 'i', 'u', 'e', 'o');
  Table2FixedRowTitle: array [0 .. 10] of String = ('ki', 'gi', 'shi', 'ji',
    'chi', 'ni', 'hi', 'bi', 'pi', 'mi', 'ri');
  Table2FixedColTitle: array [0 .. 2] of String = ('ya', 'yu', 'yo');

type
  TAlphabet = record
    Hiragana: String;
    Katakana: String;
    Romanji0: String;
    Romanji1: String;
    Image: String;
    Sound: String;
  end;

procedure LoadAlphabetDictionaryCreate(Dictionary
  : TDictionary<Integer, TAlphabet>; AACol, KACol, GACol, SACol, ZACol, TACol,
  DACol, NACol, HACol, BACol, PACol, MACol, YACol, RACol, WACol, NNCol, YARow,
  YURow, YORow: Boolean);
procedure LoadResourceSound(const AResName: string; const AResGroup: String);
function LoadResourceImage(const AResName: string; const AResGroup: String)
  : TPngImage;
function LoadGetAppVersion(): String;
function LoadAppIsRunning(prjName: String): Boolean;

implementation

// Load Alphabet Dictionary Create
// -----------------------------------------------------------------------------
procedure LoadAlphabetDictionaryCreate(Dictionary
  : TDictionary<Integer, TAlphabet>; AACol, KACol, GACol, SACol, ZACol, TACol,
  DACol, NACol, HACol, BACol, PACol, MACol, YACol, RACol, WACol, NNCol, YARow,
  YURow, YORow: Boolean);

var
  Alphabet: TAlphabet;

begin
  if AACol then
  begin
    Alphabet.Hiragana := 'あ';
    Alphabet.Katakana := 'ア';
    Alphabet.Romanji0 := 'a';
    Alphabet.Romanji1 := 'a';
    Alphabet.Image := 'aa';
    Alphabet.Sound := 'aa';
    Dictionary.Add(0, Alphabet);

    Alphabet.Hiragana := 'い';
    Alphabet.Katakana := 'イ';
    Alphabet.Romanji0 := 'i';
    Alphabet.Romanji1 := 'i';
    Alphabet.Image := 'ii';
    Alphabet.Sound := 'ii';
    Dictionary.Add(1, Alphabet);

    Alphabet.Hiragana := 'う';
    Alphabet.Katakana := 'ウ';
    Alphabet.Romanji0 := 'u';
    Alphabet.Romanji1 := 'u';
    Alphabet.Image := 'uu';
    Alphabet.Sound := 'uu';
    Dictionary.Add(2, Alphabet);

    Alphabet.Hiragana := 'え';
    Alphabet.Katakana := 'エ';
    Alphabet.Romanji0 := 'e';
    Alphabet.Romanji1 := 'e';
    Alphabet.Image := 'ee';
    Alphabet.Sound := 'ee';
    Dictionary.Add(3, Alphabet);

    Alphabet.Hiragana := 'お';
    Alphabet.Katakana := 'オ';
    Alphabet.Romanji0 := 'o';
    Alphabet.Romanji1 := 'o';
    Alphabet.Image := 'oo';
    Alphabet.Sound := 'oo';
    Dictionary.Add(4, Alphabet);
  end;

  if KACol then
  begin
    Alphabet.Hiragana := 'か';
    Alphabet.Katakana := 'カ';
    Alphabet.Romanji0 := 'ka';
    Alphabet.Romanji1 := 'ka';
    Alphabet.Image := 'ka';
    Alphabet.Sound := 'ka';
    Dictionary.Add(5, Alphabet);

    Alphabet.Hiragana := 'き';
    Alphabet.Katakana := 'キ';
    Alphabet.Romanji0 := 'ki';
    Alphabet.Romanji1 := 'ki';
    Alphabet.Image := 'ki';
    Alphabet.Sound := 'ki';
    Dictionary.Add(6, Alphabet);

    Alphabet.Hiragana := 'く';
    Alphabet.Katakana := 'ク';
    Alphabet.Romanji0 := 'ku';
    Alphabet.Romanji1 := 'ku';
    Alphabet.Image := 'ku';
    Alphabet.Sound := 'ku';
    Dictionary.Add(7, Alphabet);

    Alphabet.Hiragana := 'け';
    Alphabet.Katakana := 'ケ';
    Alphabet.Romanji0 := 'ke';
    Alphabet.Romanji1 := 'ke';
    Alphabet.Image := 'ke';
    Alphabet.Sound := 'ke';
    Dictionary.Add(8, Alphabet);

    Alphabet.Hiragana := 'こ';
    Alphabet.Katakana := 'コ';
    Alphabet.Romanji0 := 'ko';
    Alphabet.Romanji1 := 'ko';
    Alphabet.Image := 'ko';
    Alphabet.Sound := 'ko';
    Dictionary.Add(9, Alphabet);
  end;

  if GACol then
  begin
    Alphabet.Hiragana := 'が';
    Alphabet.Katakana := 'ガ';
    Alphabet.Romanji0 := 'ga';
    Alphabet.Romanji1 := 'ga';
    Alphabet.Image := 'ga';
    Alphabet.Sound := 'ga';
    Dictionary.Add(10, Alphabet);

    Alphabet.Hiragana := 'ぎ';
    Alphabet.Katakana := 'ギ';
    Alphabet.Romanji0 := 'gi';
    Alphabet.Romanji1 := 'gi';
    Alphabet.Image := 'gi';
    Alphabet.Sound := 'gi';
    Dictionary.Add(11, Alphabet);

    Alphabet.Hiragana := 'ぐ';
    Alphabet.Katakana := 'グ';
    Alphabet.Romanji0 := 'gu';
    Alphabet.Romanji1 := 'gu';
    Alphabet.Image := 'gu';
    Alphabet.Sound := 'gu';
    Dictionary.Add(12, Alphabet);

    Alphabet.Hiragana := 'げ';
    Alphabet.Katakana := 'ゲ';
    Alphabet.Romanji0 := 'ge';
    Alphabet.Romanji1 := 'ge';
    Alphabet.Image := 'ge';
    Alphabet.Sound := 'ge';
    Dictionary.Add(13, Alphabet);

    Alphabet.Hiragana := 'ご';
    Alphabet.Katakana := 'ゴ';
    Alphabet.Romanji0 := 'go';
    Alphabet.Romanji1 := 'go';
    Alphabet.Image := 'go';
    Alphabet.Sound := 'go';
    Dictionary.Add(14, Alphabet);
  end;

  if SACol then
  begin
    Alphabet.Hiragana := 'さ';
    Alphabet.Katakana := 'サ';
    Alphabet.Romanji0 := 'sa';
    Alphabet.Romanji1 := 'sa';
    Alphabet.Image := 'sa';
    Alphabet.Sound := 'sa';
    Dictionary.Add(15, Alphabet);

    Alphabet.Hiragana := 'し';
    Alphabet.Katakana := 'シ';
    Alphabet.Romanji0 := 'shi';
    Alphabet.Romanji1 := 'shi';
    Alphabet.Image := 'si';
    Alphabet.Sound := 'si';
    Dictionary.Add(16, Alphabet);

    Alphabet.Hiragana := 'す';
    Alphabet.Katakana := 'ス';
    Alphabet.Romanji0 := 'su';
    Alphabet.Romanji1 := 'su';
    Alphabet.Image := 'su';
    Alphabet.Sound := 'su';
    Dictionary.Add(17, Alphabet);

    Alphabet.Hiragana := 'せ';
    Alphabet.Katakana := 'セ';
    Alphabet.Romanji0 := 'se';
    Alphabet.Romanji1 := 'se';
    Alphabet.Image := 'se';
    Alphabet.Sound := 'se';
    Dictionary.Add(18, Alphabet);

    Alphabet.Hiragana := 'そ';
    Alphabet.Katakana := 'ソ';
    Alphabet.Romanji0 := 'so';
    Alphabet.Romanji1 := 'so';
    Alphabet.Image := 'so';
    Alphabet.Sound := 'so';
    Dictionary.Add(19, Alphabet);
  end;

  if ZACol then
  begin
    Alphabet.Hiragana := 'ざ';
    Alphabet.Katakana := 'ザ';
    Alphabet.Romanji0 := 'za';
    Alphabet.Romanji1 := 'za';
    Alphabet.Image := 'za';
    Alphabet.Sound := 'za';
    Dictionary.Add(20, Alphabet);

    Alphabet.Hiragana := 'じ';
    Alphabet.Katakana := 'ジ';
    Alphabet.Romanji0 := 'ji';
    Alphabet.Romanji1 := 'zi';
    Alphabet.Image := 'zi';
    Alphabet.Sound := 'ji';
    Dictionary.Add(21, Alphabet);

    Alphabet.Hiragana := 'ず';
    Alphabet.Katakana := 'ズ';
    Alphabet.Romanji0 := 'zu';
    Alphabet.Romanji1 := 'zu';
    Alphabet.Image := 'zu';
    Alphabet.Sound := 'zu';
    Dictionary.Add(22, Alphabet);

    Alphabet.Hiragana := 'ぜ';
    Alphabet.Katakana := 'ゼ';
    Alphabet.Romanji0 := 'ze';
    Alphabet.Romanji1 := 'ze';
    Alphabet.Image := 'ze';
    Alphabet.Sound := 'ze';
    Dictionary.Add(23, Alphabet);

    Alphabet.Hiragana := 'ぞ';
    Alphabet.Katakana := 'ゾ';
    Alphabet.Romanji0 := 'zo';
    Alphabet.Romanji1 := 'zo';
    Alphabet.Image := 'zo';
    Alphabet.Sound := 'zo';
    Dictionary.Add(24, Alphabet);
  end;

  if TACol then
  begin
    Alphabet.Hiragana := 'た';
    Alphabet.Katakana := 'タ';
    Alphabet.Romanji0 := 'ta';
    Alphabet.Romanji1 := 'ta';
    Alphabet.Image := 'ta';
    Alphabet.Sound := 'ta';
    Dictionary.Add(25, Alphabet);

    Alphabet.Hiragana := 'ち';
    Alphabet.Katakana := 'チ';
    Alphabet.Romanji0 := 'chi';
    Alphabet.Romanji1 := 'chi';
    Alphabet.Image := 'ti';
    Alphabet.Sound := 'ti';
    Dictionary.Add(26, Alphabet);

    Alphabet.Hiragana := 'つ';
    Alphabet.Katakana := 'ツ';
    Alphabet.Romanji0 := 'tsu';
    Alphabet.Romanji1 := 'tsu';
    Alphabet.Image := 'tu';
    Alphabet.Sound := 'tu';
    Dictionary.Add(27, Alphabet);

    Alphabet.Hiragana := 'て';
    Alphabet.Katakana := 'テ';
    Alphabet.Romanji0 := 'te';
    Alphabet.Romanji1 := 'te';
    Alphabet.Image := 'te';
    Alphabet.Sound := 'te';
    Dictionary.Add(28, Alphabet);

    Alphabet.Hiragana := 'と';
    Alphabet.Katakana := 'ト';
    Alphabet.Romanji0 := 'to';
    Alphabet.Romanji1 := 'to';
    Alphabet.Image := 'to';
    Alphabet.Sound := 'to';
    Dictionary.Add(29, Alphabet);
  end;

  if DACol then
  begin
    Alphabet.Hiragana := 'だ';
    Alphabet.Katakana := 'ダ';
    Alphabet.Romanji0 := 'da';
    Alphabet.Romanji1 := 'da';
    Alphabet.Image := 'da';
    Alphabet.Sound := 'da';
    Dictionary.Add(30, Alphabet);

    Alphabet.Hiragana := 'ぢ';
    Alphabet.Katakana := 'ヂ';
    Alphabet.Romanji0 := 'ji';
    Alphabet.Romanji1 := 'di';
    Alphabet.Image := 'di';
    Alphabet.Sound := 'ji';
    Dictionary.Add(31, Alphabet);

    Alphabet.Hiragana := 'づ';
    Alphabet.Katakana := 'ヅ';
    Alphabet.Romanji0 := 'zu';
    Alphabet.Romanji1 := 'du';
    Alphabet.Image := 'du';
    Alphabet.Sound := 'zu';
    Dictionary.Add(32, Alphabet);

    Alphabet.Hiragana := 'で';
    Alphabet.Katakana := 'デ';
    Alphabet.Romanji0 := 'de';
    Alphabet.Romanji1 := 'de';
    Alphabet.Image := 'de';
    Alphabet.Sound := 'de';
    Dictionary.Add(33, Alphabet);

    Alphabet.Hiragana := 'ど';
    Alphabet.Katakana := 'ド';
    Alphabet.Romanji0 := 'do';
    Alphabet.Romanji1 := 'do';
    Alphabet.Image := 'do';
    Alphabet.Sound := 'do';
    Dictionary.Add(34, Alphabet);
  end;

  if NACol then
  begin
    Alphabet.Hiragana := 'な';
    Alphabet.Katakana := 'ナ';
    Alphabet.Romanji0 := 'na';
    Alphabet.Romanji1 := 'na';
    Alphabet.Image := 'na';
    Alphabet.Sound := 'na';
    Dictionary.Add(35, Alphabet);

    Alphabet.Hiragana := 'に';
    Alphabet.Katakana := 'ニ';
    Alphabet.Romanji0 := 'ni';
    Alphabet.Romanji1 := 'ni';
    Alphabet.Image := 'ni';
    Alphabet.Sound := 'ni';
    Dictionary.Add(36, Alphabet);

    Alphabet.Hiragana := 'ぬ';
    Alphabet.Katakana := 'ヌ';
    Alphabet.Romanji0 := 'nu';
    Alphabet.Romanji1 := 'nu';
    Alphabet.Image := 'nu';
    Alphabet.Sound := 'nu';
    Dictionary.Add(37, Alphabet);

    Alphabet.Hiragana := 'ね';
    Alphabet.Katakana := 'ネ';
    Alphabet.Romanji0 := 'ne';
    Alphabet.Romanji1 := 'ne';
    Alphabet.Image := 'ne';
    Alphabet.Sound := 'ne';
    Dictionary.Add(38, Alphabet);

    Alphabet.Hiragana := 'の';
    Alphabet.Katakana := 'ノ';
    Alphabet.Romanji0 := 'no';
    Alphabet.Romanji1 := 'no';
    Alphabet.Image := 'no';
    Alphabet.Sound := 'no';
    Dictionary.Add(39, Alphabet);
  end;

  if HACol then
  begin
    Alphabet.Hiragana := 'は';
    Alphabet.Katakana := 'ハ';
    Alphabet.Romanji0 := 'ha';
    Alphabet.Romanji1 := 'ha';
    Alphabet.Image := 'ha';
    Alphabet.Sound := 'ha';
    Dictionary.Add(40, Alphabet);

    Alphabet.Hiragana := 'ひ';
    Alphabet.Katakana := 'ヒ';
    Alphabet.Romanji0 := 'hi';
    Alphabet.Romanji1 := 'hi';
    Alphabet.Image := 'hi';
    Alphabet.Sound := 'hi';
    Dictionary.Add(41, Alphabet);

    Alphabet.Hiragana := 'ふ';
    Alphabet.Katakana := 'フ';
    Alphabet.Romanji0 := 'fu';
    Alphabet.Romanji1 := 'fu';
    Alphabet.Image := 'hu';
    Alphabet.Sound := 'hu';
    Dictionary.Add(42, Alphabet);

    Alphabet.Hiragana := 'へ';
    Alphabet.Katakana := 'ヘ';
    Alphabet.Romanji0 := 'he';
    Alphabet.Romanji1 := 'he';
    Alphabet.Image := 'he';
    Alphabet.Sound := 'he';
    Dictionary.Add(43, Alphabet);

    Alphabet.Hiragana := 'ほ';
    Alphabet.Katakana := 'ホ';
    Alphabet.Romanji0 := 'ho';
    Alphabet.Romanji1 := 'ho';
    Alphabet.Image := 'ho';
    Alphabet.Sound := 'ho';
    Dictionary.Add(44, Alphabet);
  end;

  if BACol then
  begin
    Alphabet.Hiragana := 'ば';
    Alphabet.Katakana := 'バ';
    Alphabet.Romanji0 := 'ba';
    Alphabet.Romanji1 := 'ba';
    Alphabet.Image := 'ba';
    Alphabet.Sound := 'ba';
    Dictionary.Add(45, Alphabet);

    Alphabet.Hiragana := 'び';
    Alphabet.Katakana := 'ビ';
    Alphabet.Romanji0 := 'bi';
    Alphabet.Romanji1 := 'bi';
    Alphabet.Image := 'bi';
    Alphabet.Sound := 'bi';
    Dictionary.Add(46, Alphabet);

    Alphabet.Hiragana := 'ぶ';
    Alphabet.Katakana := 'ブ';
    Alphabet.Romanji0 := 'bu';
    Alphabet.Romanji1 := 'bu';
    Alphabet.Image := 'bu';
    Alphabet.Sound := 'bu';
    Dictionary.Add(47, Alphabet);

    Alphabet.Hiragana := 'べ';
    Alphabet.Katakana := 'ベ';
    Alphabet.Romanji0 := 'be';
    Alphabet.Romanji1 := 'be';
    Alphabet.Image := 'be';
    Alphabet.Sound := 'be';
    Dictionary.Add(48, Alphabet);

    Alphabet.Hiragana := 'ぼ';
    Alphabet.Katakana := 'ボ';
    Alphabet.Romanji0 := 'bo';
    Alphabet.Romanji1 := 'bo';
    Alphabet.Image := 'bo';
    Alphabet.Sound := 'bo';
    Dictionary.Add(49, Alphabet);
  end;

  if PACol then
  begin
    Alphabet.Hiragana := 'ぱ';
    Alphabet.Katakana := 'パ';
    Alphabet.Romanji0 := 'pa';
    Alphabet.Romanji1 := 'pa';
    Alphabet.Image := 'pa';
    Alphabet.Sound := 'pa';
    Dictionary.Add(50, Alphabet);

    Alphabet.Hiragana := 'ぴ';
    Alphabet.Katakana := 'ピ';
    Alphabet.Romanji0 := 'pi';
    Alphabet.Romanji1 := 'pi';
    Alphabet.Image := 'pi';
    Alphabet.Sound := 'pi';
    Dictionary.Add(51, Alphabet);

    Alphabet.Hiragana := 'ぷ';
    Alphabet.Katakana := 'プ';
    Alphabet.Romanji0 := 'pu';
    Alphabet.Romanji1 := 'pu';
    Alphabet.Image := 'pu';
    Alphabet.Sound := 'pu';
    Dictionary.Add(52, Alphabet);

    Alphabet.Hiragana := 'ぺ';
    Alphabet.Katakana := 'ペ';
    Alphabet.Romanji0 := 'pe';
    Alphabet.Romanji1 := 'pe';
    Alphabet.Image := 'pe';
    Alphabet.Sound := 'pe';
    Dictionary.Add(53, Alphabet);

    Alphabet.Hiragana := 'ぽ';
    Alphabet.Katakana := 'ポ';
    Alphabet.Romanji0 := 'po';
    Alphabet.Romanji1 := 'po';
    Alphabet.Image := 'po';
    Alphabet.Sound := 'po';
    Dictionary.Add(54, Alphabet);
  end;

  if MACol then
  begin
    Alphabet.Hiragana := 'ま';
    Alphabet.Katakana := 'マ';
    Alphabet.Romanji0 := 'ma';
    Alphabet.Romanji1 := 'ma';
    Alphabet.Image := 'ma';
    Alphabet.Sound := 'ma';
    Dictionary.Add(55, Alphabet);

    Alphabet.Hiragana := 'み';
    Alphabet.Katakana := 'ミ';
    Alphabet.Romanji0 := 'mi';
    Alphabet.Romanji1 := 'mi';
    Alphabet.Image := 'mi';
    Alphabet.Sound := 'mi';
    Dictionary.Add(56, Alphabet);

    Alphabet.Hiragana := 'む';
    Alphabet.Katakana := 'ム';
    Alphabet.Romanji0 := 'mu';
    Alphabet.Romanji1 := 'mu';
    Alphabet.Image := 'mu';
    Alphabet.Sound := 'mu';
    Dictionary.Add(57, Alphabet);

    Alphabet.Hiragana := 'め';
    Alphabet.Katakana := 'メ';
    Alphabet.Romanji0 := 'me';
    Alphabet.Romanji1 := 'me';
    Alphabet.Image := 'me';
    Alphabet.Sound := 'me';
    Dictionary.Add(58, Alphabet);

    Alphabet.Hiragana := 'も';
    Alphabet.Katakana := 'モ';
    Alphabet.Romanji0 := 'mo';
    Alphabet.Romanji1 := 'mo';
    Alphabet.Image := 'mo';
    Alphabet.Sound := 'mo';
    Dictionary.Add(59, Alphabet);
  end;

  if YACol then
  begin
    Alphabet.Hiragana := 'や';
    Alphabet.Katakana := 'ヤ';
    Alphabet.Romanji0 := 'ya';
    Alphabet.Romanji1 := 'ya';
    Alphabet.Image := 'ya';
    Alphabet.Sound := 'ya';
    Dictionary.Add(60, Alphabet);

    Alphabet.Hiragana := 'ゆ';
    Alphabet.Katakana := 'ユ';
    Alphabet.Romanji0 := 'yu';
    Alphabet.Romanji1 := 'yu';
    Alphabet.Image := 'yu';
    Alphabet.Sound := 'yu';
    Dictionary.Add(61, Alphabet);

    Alphabet.Hiragana := 'よ';
    Alphabet.Katakana := 'ヨ';
    Alphabet.Romanji0 := 'yo';
    Alphabet.Romanji1 := 'yo';
    Alphabet.Image := 'yo';
    Alphabet.Sound := 'yo';
    Dictionary.Add(62, Alphabet);
  end;

  if RACol then
  begin
    Alphabet.Hiragana := 'ら';
    Alphabet.Katakana := 'ラ';
    Alphabet.Romanji0 := 'ra';
    Alphabet.Romanji1 := 'ra';
    Alphabet.Image := 'ra';
    Alphabet.Sound := 'ra';
    Dictionary.Add(63, Alphabet);

    Alphabet.Hiragana := 'り';
    Alphabet.Katakana := 'リ';
    Alphabet.Romanji0 := 'ri';
    Alphabet.Romanji1 := 'ri';
    Alphabet.Image := 'ri';
    Alphabet.Sound := 'ri';
    Dictionary.Add(64, Alphabet);

    Alphabet.Hiragana := 'る';
    Alphabet.Katakana := 'ル';
    Alphabet.Romanji0 := 'ru';
    Alphabet.Romanji1 := 'ru';
    Alphabet.Image := 'ru';
    Alphabet.Sound := 'ru';
    Dictionary.Add(65, Alphabet);

    Alphabet.Hiragana := 'れ';
    Alphabet.Katakana := 'レ';
    Alphabet.Romanji0 := 're';
    Alphabet.Romanji1 := 're';
    Alphabet.Image := 're';
    Alphabet.Sound := 're';
    Dictionary.Add(66, Alphabet);

    Alphabet.Hiragana := 'ろ';
    Alphabet.Katakana := 'ロ';
    Alphabet.Romanji0 := 'ro';
    Alphabet.Romanji1 := 'ro';
    Alphabet.Image := 'ro';
    Alphabet.Sound := 'ro';
    Dictionary.Add(67, Alphabet);
  end;

  if WACol then
  begin
    Alphabet.Hiragana := 'わ';
    Alphabet.Katakana := 'ワ';
    Alphabet.Romanji0 := 'wa';
    Alphabet.Romanji1 := 'wa';
    Alphabet.Image := 'wa';
    Alphabet.Sound := 'wa';
    Dictionary.Add(68, Alphabet);

    Alphabet.Hiragana := 'を';
    Alphabet.Katakana := 'ヲ';
    Alphabet.Romanji0 := 'wo';
    Alphabet.Romanji1 := 'wo';
    Alphabet.Image := 'wo';
    Alphabet.Sound := 'wo';
    Dictionary.Add(69, Alphabet);
  end;

  if NNCol then
  begin
    Alphabet.Hiragana := 'ん';
    Alphabet.Katakana := 'ン';
    Alphabet.Romanji0 := 'n';
    Alphabet.Romanji1 := 'n';
    Alphabet.Image := 'nn';
    Alphabet.Sound := 'nn';
    Dictionary.Add(70, Alphabet);
  end;

  if YARow then
  begin
    Alphabet.Hiragana := 'きゃ';
    Alphabet.Katakana := 'キャ';
    Alphabet.Romanji0 := 'kya';
    Alphabet.Romanji1 := 'kya';
    Alphabet.Image := 'kya';
    Alphabet.Sound := 'kya';
    Dictionary.Add(71, Alphabet);

    Alphabet.Hiragana := 'ぎゃ';
    Alphabet.Katakana := 'ギャ';
    Alphabet.Romanji0 := 'gya';
    Alphabet.Romanji1 := 'gya';
    Alphabet.Image := 'gya';
    Alphabet.Sound := 'gya';
    Dictionary.Add(72, Alphabet);

    Alphabet.Hiragana := 'しゃ';
    Alphabet.Katakana := 'シャ';
    Alphabet.Romanji0 := 'sha';
    Alphabet.Romanji1 := 'sha';
    Alphabet.Image := 'sha';
    Alphabet.Sound := 'sha';
    Dictionary.Add(73, Alphabet);

    Alphabet.Hiragana := 'じゃ';
    Alphabet.Katakana := 'ジャ';
    Alphabet.Romanji0 := 'ja';
    Alphabet.Romanji1 := 'ja';
    Alphabet.Image := 'ja';
    Alphabet.Sound := 'ja';
    Dictionary.Add(74, Alphabet);

    Alphabet.Hiragana := 'ちゃ';
    Alphabet.Katakana := 'チャ';
    Alphabet.Romanji0 := 'cha';
    Alphabet.Romanji1 := 'cha';
    Alphabet.Image := 'cha';
    Alphabet.Sound := 'cha';
    Dictionary.Add(75, Alphabet);

    Alphabet.Hiragana := 'にゃ';
    Alphabet.Katakana := 'ニャ';
    Alphabet.Romanji0 := 'nya';
    Alphabet.Romanji1 := 'nya';
    Alphabet.Image := 'nya';
    Alphabet.Sound := 'nya';
    Dictionary.Add(76, Alphabet);

    Alphabet.Hiragana := 'ひゃ';
    Alphabet.Katakana := 'ヒャ';
    Alphabet.Romanji0 := 'hya';
    Alphabet.Romanji1 := 'hya';
    Alphabet.Image := 'hya';
    Alphabet.Sound := 'hya';
    Dictionary.Add(77, Alphabet);

    Alphabet.Hiragana := 'びゃ';
    Alphabet.Katakana := 'ビャ';
    Alphabet.Romanji0 := 'bya';
    Alphabet.Romanji1 := 'bya';
    Alphabet.Image := 'bya';
    Alphabet.Sound := 'bya';
    Dictionary.Add(78, Alphabet);

    Alphabet.Hiragana := 'ぴゃ';
    Alphabet.Katakana := 'ピャ';
    Alphabet.Romanji0 := 'pya';
    Alphabet.Romanji1 := 'pya';
    Alphabet.Image := 'pya';
    Alphabet.Sound := 'pya';
    Dictionary.Add(79, Alphabet);

    Alphabet.Hiragana := 'みゃ';
    Alphabet.Katakana := 'ミャ';
    Alphabet.Romanji0 := 'mya';
    Alphabet.Romanji1 := 'mya';
    Alphabet.Image := 'mya';
    Alphabet.Sound := 'mya';
    Dictionary.Add(80, Alphabet);

    Alphabet.Hiragana := 'りゃ';
    Alphabet.Katakana := 'リャ';
    Alphabet.Romanji0 := 'rya';
    Alphabet.Romanji1 := 'rya';
    Alphabet.Image := 'rya';
    Alphabet.Sound := 'rya';
    Dictionary.Add(81, Alphabet);
  end;

  if YURow then
  begin
    Alphabet.Hiragana := 'きゅ';
    Alphabet.Katakana := 'キュ';
    Alphabet.Romanji0 := 'kyu';
    Alphabet.Romanji1 := 'kyu';
    Alphabet.Image := 'kyu';
    Alphabet.Sound := 'kyu';
    Dictionary.Add(82, Alphabet);

    Alphabet.Hiragana := 'ぎゅ';
    Alphabet.Katakana := 'ギュ';
    Alphabet.Romanji0 := 'gyu';
    Alphabet.Romanji1 := 'gyu';
    Alphabet.Image := 'gyu';
    Alphabet.Sound := 'gyu';
    Dictionary.Add(83, Alphabet);

    Alphabet.Hiragana := 'しゅ';
    Alphabet.Katakana := 'シュ';
    Alphabet.Romanji0 := 'shu';
    Alphabet.Romanji1 := 'shu';
    Alphabet.Image := 'shu';
    Alphabet.Sound := 'shu';
    Dictionary.Add(84, Alphabet);

    Alphabet.Hiragana := 'じゅ';
    Alphabet.Katakana := 'ジュ';
    Alphabet.Romanji0 := 'ju';
    Alphabet.Romanji1 := 'ju';
    Alphabet.Image := 'ju';
    Alphabet.Sound := 'ju';
    Dictionary.Add(85, Alphabet);

    Alphabet.Hiragana := 'ちゅ';
    Alphabet.Katakana := 'チュ';
    Alphabet.Romanji0 := 'chu';
    Alphabet.Romanji1 := 'chu';
    Alphabet.Image := 'chu';
    Alphabet.Sound := 'chu';
    Dictionary.Add(86, Alphabet);

    Alphabet.Hiragana := 'にゅ';
    Alphabet.Katakana := 'ニュ';
    Alphabet.Romanji0 := 'nyu';
    Alphabet.Romanji1 := 'nyu';
    Alphabet.Image := 'nyu';
    Alphabet.Sound := 'nyu';
    Dictionary.Add(87, Alphabet);

    Alphabet.Hiragana := 'ひゅ';
    Alphabet.Katakana := 'ヒュ';
    Alphabet.Romanji0 := 'hyu';
    Alphabet.Romanji1 := 'hyu';
    Alphabet.Image := 'hyu';
    Alphabet.Sound := 'hyu';
    Dictionary.Add(88, Alphabet);

    Alphabet.Hiragana := 'びゅ';
    Alphabet.Katakana := 'ビュ';
    Alphabet.Romanji0 := 'byu';
    Alphabet.Romanji1 := 'byu';
    Alphabet.Image := 'byu';
    Alphabet.Sound := 'byu';
    Dictionary.Add(89, Alphabet);

    Alphabet.Hiragana := 'ぴゅ';
    Alphabet.Katakana := 'ピュ';
    Alphabet.Romanji0 := 'pyu';
    Alphabet.Romanji1 := 'pyu';
    Alphabet.Image := 'pyu';
    Alphabet.Sound := 'pyu';
    Dictionary.Add(90, Alphabet);

    Alphabet.Hiragana := 'みゅ';
    Alphabet.Katakana := 'ミュ';
    Alphabet.Romanji0 := 'myu';
    Alphabet.Romanji1 := 'myu';
    Alphabet.Image := 'myu';
    Alphabet.Sound := 'myu';
    Dictionary.Add(91, Alphabet);

    Alphabet.Hiragana := 'りゅ';
    Alphabet.Katakana := 'リュ';
    Alphabet.Romanji0 := 'ryu';
    Alphabet.Romanji1 := 'ryu';
    Alphabet.Image := 'ryu';
    Alphabet.Sound := 'ryu';
    Dictionary.Add(92, Alphabet);
  end;

  if YORow then
  begin
    Alphabet.Hiragana := 'きょ';
    Alphabet.Katakana := 'キョ';
    Alphabet.Romanji0 := 'kyo';
    Alphabet.Romanji1 := 'kyo';
    Alphabet.Image := 'kyo';
    Alphabet.Sound := 'kyo';
    Dictionary.Add(93, Alphabet);

    Alphabet.Hiragana := 'ぎょ';
    Alphabet.Katakana := 'ギョ';
    Alphabet.Romanji0 := 'gyo';
    Alphabet.Romanji1 := 'gyo';
    Alphabet.Image := 'gyo';
    Alphabet.Sound := 'gyo';
    Dictionary.Add(94, Alphabet);

    Alphabet.Hiragana := 'しょ';
    Alphabet.Katakana := 'ショ';
    Alphabet.Romanji0 := 'sho';
    Alphabet.Romanji1 := 'sho';
    Alphabet.Image := 'sho';
    Alphabet.Sound := 'sho';
    Dictionary.Add(95, Alphabet);

    Alphabet.Hiragana := 'じょ';
    Alphabet.Katakana := 'ジョ';
    Alphabet.Romanji0 := 'jo';
    Alphabet.Romanji1 := 'jo';
    Alphabet.Image := 'jo';
    Alphabet.Sound := 'jo';
    Dictionary.Add(96, Alphabet);

    Alphabet.Hiragana := 'ちょ';
    Alphabet.Katakana := 'チョ';
    Alphabet.Romanji0 := 'cho';
    Alphabet.Romanji1 := 'cho';
    Alphabet.Image := 'cho';
    Alphabet.Sound := 'cho';
    Dictionary.Add(97, Alphabet);

    Alphabet.Hiragana := 'にょ';
    Alphabet.Katakana := 'ニョ';
    Alphabet.Romanji0 := 'nyo';
    Alphabet.Romanji1 := 'nyo';
    Alphabet.Image := 'nyo';
    Alphabet.Sound := 'nyo';
    Dictionary.Add(98, Alphabet);

    Alphabet.Hiragana := 'ひょ';
    Alphabet.Katakana := 'ヒョ';
    Alphabet.Romanji0 := 'hyo';
    Alphabet.Romanji1 := 'hyo';
    Alphabet.Image := 'hyo';
    Alphabet.Sound := 'hyo';
    Dictionary.Add(99, Alphabet);

    Alphabet.Hiragana := 'びょ';
    Alphabet.Katakana := 'ビョ';
    Alphabet.Romanji0 := 'byo';
    Alphabet.Romanji1 := 'byo';
    Alphabet.Image := 'byo';
    Alphabet.Sound := 'byo';
    Dictionary.Add(100, Alphabet);

    Alphabet.Hiragana := 'ぴょ';
    Alphabet.Katakana := 'ピョ';
    Alphabet.Romanji0 := 'pyo';
    Alphabet.Romanji1 := 'pyo';
    Alphabet.Image := 'pyo';
    Alphabet.Sound := 'pyo';
    Dictionary.Add(101, Alphabet);

    Alphabet.Hiragana := 'みょ';
    Alphabet.Katakana := 'ミョ';
    Alphabet.Romanji0 := 'myo';
    Alphabet.Romanji1 := 'myo';
    Alphabet.Image := 'myo';
    Alphabet.Sound := 'myo';
    Dictionary.Add(102, Alphabet);

    Alphabet.Hiragana := 'りょ';
    Alphabet.Katakana := 'リョ';
    Alphabet.Romanji0 := 'ryo';
    Alphabet.Romanji1 := 'ryo';
    Alphabet.Image := 'ryo';
    Alphabet.Sound := 'ryo';
    Dictionary.Add(103, Alphabet);
  end;
end;

// Load Resources Sound
// -----------------------------------------------------------------------------
procedure LoadResourceSound(const AResName: String; const AResGroup: String);
var
  ResourceStream: TResourceStream;

begin
  ResourceStream := TResourceStream.Create(HInstance, PChar(AResName),
    PChar(AResGroup));
  try
    ResourceStream.Position := 0;
    sndPlaySound(nil, SND_NODEFAULT);
    sndPlaySound(ResourceStream.Memory, SND_ASYNC or SND_MEMORY);
  finally
    ResourceStream.Free;
  end;
end;

// Load Resources Image
// -----------------------------------------------------------------------------
function LoadResourceImage(const AResName: string; const AResGroup: String)
  : TPngImage;
var
  ResourceStream: TResourceStream;
  PNGImage: TPngImage;

begin
  PNGImage := TPngImage.Create;
  try
    ResourceStream := TResourceStream.Create(HInstance, PChar(AResName),
      PChar(AResGroup));
    try
      PNGImage.LoadFromStream(ResourceStream);
      Result := PNGImage;
    finally
      ResourceStream.Free;
    end;
  finally

  end;
end;

// Load Get Application Version
// -----------------------------------------------------------------------------
function LoadGetAppVersion(): String;
var
  Exe: string;
  Size, Handle: DWORD;
  Buffer: TBytes;
  FixedPtr: PVSFixedFileInfo;
begin
  Exe := ParamStr(0);
  Size := GetFileVersionInfoSize(PChar(Exe), Handle);
  if Size = 0 then
    RaiseLastOSError;
  SetLength(Buffer, Size);
  if not GetFileVersionInfo(PChar(Exe), Handle, Size, Buffer) then
    RaiseLastOSError;
  if not VerQueryValue(Buffer, '\', Pointer(FixedPtr), Size) then
    RaiseLastOSError;
  Result := Format('%d.%d.%d.%d', [LongRec(FixedPtr.dwFileVersionMS).Hi,
    LongRec(FixedPtr.dwFileVersionMS).Lo, LongRec(FixedPtr.dwFileVersionLS).Hi,
    LongRec(FixedPtr.dwFileVersionLS).Lo])
end;

// Load Application Is Running
// -----------------------------------------------------------------------------
function LoadAppIsRunning(prjName: String): Boolean;
begin
  if OpenMutex(MUTEX_ALL_ACCESS, False, PChar(prjName)) <> 0 then
    Result := True
  else
    Result := (CreateMutex(nil, False, PChar(prjName)) = 0);
end;

end.
