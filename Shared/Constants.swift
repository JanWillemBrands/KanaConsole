//
//  Constants.swift
//  KanaKana
//
//  Created by JW on 11/28/19.
//  Copyright © 2019 JW. All rights reserved.
//

import Foundation

public let kanaCount = 116
public let basicKanaCount = 55

public let englishWord = [
    "ant", "strawberry", "cow", "pencil", "ghost",
    "turtle", "mushroom", "bear", "cake", "koala",
    "fish", "square", "watermellon", "chicada", "soft cream",
    "sun", "home", "blocks", "talisman", "bird",
    "eggplant", "rainbow", "coloring", "cat", "sushi roll",
    "scissors", "sheep", "owl", "snake", "broom",
    "window", "water", "magnifying glass", "glasses", "peach",
    "kettle", "NA", "snowman", "NA", "yacht",
    "lion", "apple", "house sitter", "lemon", "candle",
    "crocodile", "NA", "washing hands", "NA", "book",
    "NA", "table", "NA", "cup", "NA",
    
    "school", "guitar", "rock", "clogs", "gorilla",
    "crayfish", "bicycle", "picture book", "jelly", "elephant",
    "radish", "nosebleed", "new moon", "train", "donut",
    "banana", "biscuit", "pig", "bed", "ball",
    "pineapple", "bellpepper", "pool", "penguin", "post",
    
    "cabbage", "cucumber", "dinosaur", "meow", "thunderclouds", "slithering",
    "reverse", "milk", "potsticker", "100 yen", "whizz", "list",
    "photo", "creampuffs", "fire engine", "300 yen", "wind", "hospital",
    "potato", "gun", "female", "800 yen", "whoosh", "hopping",
    "green tea", "tulips", "butterfly", "mountain range", "music", "couple",
    "rice bowl", "worldwide", "festival lantern", "acronym", "circulation", "cooking",
]

public let romajiWord = [
    "ari", "ichigo", "ushi", "enpitsu", "obake",
    "kame", "kinoko", "kuma", "kēki", "koara",
    "sakana", "shikaku", "suika", "semi", "sofuto-kurīmu",
    "taiyō", "uchi", "tsumiki", "teru-teru-bōzu", "tori",
    "nasu", "niji", "nurie", "neko", "norimaki",
    "hasami", "hitsuji", "fukurō", "hebi", "hōki",
    "mado", "mizu", "mushi-megane", "megane", "momo",
    "yakan", "", "yukidaruma", "", "yotto",
    "raion", "ringo", "rusuban", "remon", "rōsoku",
    "wani", "", "te-o-arau", "", "hon",
    "", "tēburu", "", "kap'pu", "",
    
    "gakkō", "gitā", "gū", "geta", "gorira",
    "zarigani", "jitensha", "zukan", "zerī", "zō",
    "daikon", "hanadji", "mikadzuki", "densha", "dōnatsu", //hanadji mikadzuki
    "banana", "bisuketto", "buta", "beddo", "bōru",
    "painappuru", "piiman", "pūru", "pengin", "posuto",
    
    "kyabetsu", "kyūri", "kyōryū", "nyā", "nyūdōgumo", "nyoro-nyoro",
    "gyaku", "gyūnyū", "gyōza", "hyaku-en", "hyū", "hyō",
    "shashin", "shūkurīmu", "shōbōsha", "sanbyaku-en", "byū", "byōin",
    "jagaimo", "jū", "josei", "happyaku-en", "pyū", "pyon-pyon",
    "matcha", "chūrippu", "chōcho", "sanmyaku", "myūjikku", "myōto",
    "gohandjawan", "sekaidjū", "bondjōchin", "ryakugo", "ryūtsū", "ryōri", //gohandjawan sekaidjū bondjōchin
]

// macron tē¯buru

public let hiraganaWord = [
    "あり", "いちご", "うし", "えんぴつ", "おばけ",
    "かめ", "きのこ", "くま", "けえき", "こあら",
    "さかな", "しかく", "すいか", "せみ", "そふとくりいむ",
    "たいよう", "うち", "つみき", "てるてるぼうず", "とり",
    "なす", "にじ", "ぬりえ", "ねこ", "のりまき",
    "はさみ", "ひつじ", "ふくろう", "へび", "ほうき",
    "まど", "みず", "むしめがね", "めがね", "もも",
    "やかん", "", "ゆきだるま", "", "よっと",
    "らいおん", "りんご", "るすばん", "れもん", "ろうそく",
    "わに", "", "てをあらう", "", "ほん",
    "", "てえぶる", "", "かっぷ", "",
    
    "がっこう", "ぎたあ", "ぐう", "げた", "ごりら",
    "ざりがに", "じてんしゃ", "ずかん", "ぜりい", "ぞう",
    "だいこん", "はなぢ", "みかづき", "でんしゃ", "どうなつ",
    "ばなな", "びすけっと", "ぶた", "べっど", "ぼおる",
    "ぱいなっぷる", "ぴいまん", "ぷうる", "ぺんぎん", "ぽすと",
    
    "きゃべつ", "きゅうり", "きょうりゅう", "にゃあ", "にゅうどうぐも", "にょろにょろ",
    "ぎゃく", "ぎゅうにゅう", "ぎょおざ", "ひゃくえん", "ひゅう", "ひょう",
    "しゃしん", "しゅうくりいむ", "しょうぼうしゃ", "さんびゃくえん", "びゅう", "びょういん",
    "じゃがいも", "じゅう", "じょせい", "はっぴゃくえん", "ぴゅう", "ぴょんぴょん",
    "まっちゃ", "ちゅうりっぷ", "ちょうちょ", "さんみゃく", "みゅうじっく", "みょうと",
    "ごはんぢゃわん", "せかいぢゅう", "ぼんぢょうちん", "りゃくご", "りゅうつう", "りょうり",
]

public let pronounceWord = [
    //    "蟻", "蟻!", "蟻?", "蟻.", "蟻,",
    //    "蟻,.", "蟻です", "蟻。", "蟻・", "蟻くそ野や郎",
    "蟻", "苺", "牛", "鉛筆", "お化け",
    "亀", "木の子", "熊", "ケーキ", "コアラ",
    "魚", "四角", "西瓜", "蝉", "ソフトクリーム",
    "太陽", "うち", "積み木", "てるてる坊主", "鳥",
    "茄子", "虹", "塗り絵", "猫", "海苔巻き",
    "はさみ", "羊", "梟", "蛇", "ほうき",
    "窓", "水", "虫眼鏡", "眼鏡", "桃",
    "約款", "", "雪だるま", "", "ヨット",
    "ライオン", "林檎", "留守番", "レモン", "蝋燭",
    "鰐", "", "手を洗う", "", "本",
    "", "テーブル", "", "カップ", "",
    
    "学校", "ギター", "グー", "下駄", "ゴリラ",
    "ざりがに", "自転車", "図鑑", "ゼリー", "象",
    "大根", "鼻血", "三日月", "電車", "ドーナツ",
    "バナナ", "ビスケット", "豚", "ベッド", "ボール",
    "パイナップル", "ピーマン", "プール", "ペンギン", "ポスト",
    
    "キャベツ", "胡瓜", "恐竜", "ニャー", "入道雲", "にょろにょろ",
    "逆", "牛乳", "餃子", "100円", "ヒュー", "ひょう",
    "写真", "シュークリーム", "消防車", "300円", "ビュー", "病院",
    "じゃがいも", "銃", "女性", "800円", "ピュー", "ぴょんぴょん",
    "抹茶", "チューリップ", "蝶々", "山脈", "ミュージック", "みょうと",
    "ご飯茶碗 ", "世界中", "盆提灯", "略語", "流通", "料理",
]

public let katakanaWord = [
    "アリ",       "イチゴ",      "ウシ",       "エンピツ",        "オバケ",
    "カメ",       "キノコ",      "クマ",       "ケーキ",          "コアラ",
    "サカナ",      "シカク",      "スイカ",      "セミ",           "ソフトクリーム",
    "タイヨウ",     "ウチ",       "ツミキ",      "テルテルボウズ",   "トリ",
    "ナス",       "ニジ",       "ヌリエ",       "ネコ",           "ノリマキ",
    "ハサミ",      "ヒツジ",      "フクロウ",     "ヘビ",           "ホウキ",
    "マド",       "ミズ",       "ムシメガネ",    "メガネ",          "モモ",
    "ヤカン",      "",         "ユキダルマ",     "",                "ヨット",
    "ライオン",     "リンゴ",      "ルスバン",     "レモン",          "ロウソク",
    "ワニ",       "",           "テヲアラウ",    "",             "ホン",
    "",         "テーブル",     "",             "カップ",          "",
    
    "ガッコウ",     "ギター",      "グー",       "ゲタ",           "ゴリラ",
    "ザリガニ",    "ジテンシャ",  "ズカン",         "ゼリー",       "ゾウ",
    "ダイコン",     "ハナヂ",      "ミカヅキ",     "デンシャ",     "ドーナツ",
    "バナナ",      "ビスケット",    "ブタ",       "ベッド",      "ボール",
    "パイナップル", "ピーマン",       "プール",      "ペンギン",     "ポスト",
    
    "キャベツ",     "キュウリ",     "キョウリュウ", "ニャー",        "ニュウドウグモ",  "ニョロニョロ",
    "ギャク",      "ギュウニュウ",   "ギョウザ",     "ヒャクエン",    "ヒュー",      "ヒョウ",
    "シャシン",     "シュークリーム", "ショウボウシャ", "サンビャクエン","ビュー",      "ビョウイン",
    "ジャガイモ",    "ジュー",      "ジョセイ",     "ハッピャクエン",  "ピュー",      "ピョンピョン",
    "マッチャ",     "チューリップ",    "チョウチョ",    "サンミャク",      "ミュージック",   "ミョウト",
    "ゴハンヂャワン", "セカイヂュウ", "ボンヂョウチン", "リャクゴ",         "リューツー", "リョウリ",
]

// In the Hepburn method, both ZI (ジ) and DI (ヂ) are represented by "ji" and both ZU (ズ) and DU (ヅ) are represented by "zu". A slightly amended version of Hepburn, that uses "dji" for DI and "dzu" for DU, is unambiguous.

public let romaji = [
    "a",   "i",   "u",   "e",   "o",
    "ka",  "ki",  "ku",  "ke",  "ko",
    "sa",  "shi", "su",  "se",  "so",
    "ta",  "chi", "tsu", "te",  "to",
    "na",  "ni",  "nu",  "ne",  "no",
    "ha",  "hi",  "fu",  "he",  "ho",
    "ma",  "mi",  "mu",  "me",  "mo",
    "ya",  "",    "yu",  "",    "yo",
    "ra",  "ri",  "ru",  "re",  "ro",
    "wa",  "",    "o",   "",    "n",
    "",    "-",   "",    "'",   "", // ē¯
    
    "ga",  "gi",  "gu",  "ge",  "go",
    "za",  "ji",  "zu",  "ze",  "zo",
    "da",  "dji", "dzu", "de",  "do", //dji dzu
    "ba",  "bi",  "bu",  "be",  "bo",
    "pa",  "pi",  "pu",  "pe",  "po",
    
    "kya", "kyu", "kyo", "nya", "nyu", "nyo",
    "gya", "gyu", "gyo", "hya", "hyu", "hyo",
    "sha", "shu", "sho", "bya", "byu", "byo",
    "ja",  "ju",  "jo",  "pya", "pyu", "pyo",
    "cha", "chu", "cho", "mya", "myu", "myo",
    "dja", "dju", "djo", "rya", "ryu", "ryo", //dja dju djo
]

// macron "ē¯"

public let hiragana = [
    "あ", "い", "う", "え", "お",
    "か", "き", "く", "け", "こ",
    "さ", "し", "す", "せ", "そ",
    "た", "ち", "つ", "て", "と",
    "な", "に", "ぬ", "ね", "の",
    "は", "ひ", "ふ", "へ", "ほ",
    "ま", "み", "む", "め", "も",
    "や", "", "ゆ", "", "よ",
    "ら", "り", "る", "れ", "ろ",
    "わ", "", "を", "", "ん",
    "", "ー", "", "っ", "",
    
    "が", "ぎ", "ぐ", "げ", "ご",
    "ざ", "じ", "ず", "ぜ", "ぞ",
    "だ", "ぢ", "づ", "で", "ど",
    "ば", "び", "ぶ", "べ", "ぼ",
    "ぱ", "ぴ", "ぷ", "ぺ", "ぽ",
    
    "きゃ", "きゅ", "きょ", "にゃ", "にゅ", "にょ",
    "ぎゃ", "ぎゅ", "ぎょ", "ひゃ", "ひゅ", "ひょ",
    "しゃ", "しゅ", "しょ", "びゃ", "びゅ", "びょ",
    "じゃ", "じゅ", "じょ", "ぴゃ", "ぴゅ", "ぴょ",
    "ちゃ", "ちゅ", "ちょ", "みゃ", "みゅ", "みょ",
    "ぢゃ", "ぢゅ", "ぢょ", "りゃ", "りゅ", "りょ",
]

public let katakana = [
    "ア", "イ", "ウ", "エ", "オ",
    "カ", "キ", "ク", "ケ", "コ",
    "サ", "シ", "ス", "セ", "ソ",
    "タ", "チ", "ツ", "テ", "ト",
    "ナ", "ニ", "ヌ", "ネ", "ノ",
    "ハ", "ヒ", "フ", "ヘ", "ホ",
    "マ", "ミ", "ム", "メ", "モ",
    "ヤ", "", "ユ", "", "ヨ",
    "ラ", "リ", "ル", "レ", "ロ",
    "ワ", "", "ヲ", "", "ン",
    "", "ー", "", "ッ", "",
    
    "ガ", "ギ", "グ", "ゲ", "ゴ",
    "ザ", "ジ", "ズ", "ゼ", "ゾ",
    "ダ", "ヂ", "ヅ", "デ", "ド",
    "バ", "ビ", "ブ", "ベ", "ボ",
    "パ", "ピ", "プ", "ペ", "ポ",
    
    "キャ", "キュ", "キョ", "ニャ", "ニュ", "ニョ",
    "ギャ", "ギュ", "ギョ", "ヒャ", "ヒュ", "ヒョ",
    "シャ", "シュ", "ショ", "ビャ", "ビュ", "ビョ",
    "ジャ", "ジュ", "ジョ", "ピャ", "ピュ", "ピョ",
    "チャ", "チュ", "チョ", "ミャ", "ミュ", "ミョ",
    "ヂャ", "ヂュ", "ヂョ", "リャ", "リュ", "リョ",
]

private let hiraganaLookalikes: [Set<String>] = [
    ["あ", "お"],
    ["の", "ゆ", "ぬ"],
    ["は", "ま", "ほ"],
    ["も", "む"],
    ["ち", "さ", "き"],
    ["ち", "ら"],
    ["お", "む"],
    ["こ", "て"],
    ["こ", "た", "に"],
    ["た", "な"],
    ["ね", "れ", "わ", "ゐ"],
    ["る", "ろ", "そ"],
    ["う", "つ", "っ"],
    ["い", "り"],
]

private let katakanaLookalikes: [Set<String>] = [
    ["ユ", "エ", "コ"],
    ["シ", "ツ", "ッ"],
    ["テ", "ラ"],
    ["タ", "ク"],
    ["ス", "ヌ", "ケ", "ア"],
    ["ン", "ソ"],
    ["フ", "ワ", "ウ", "ラ"],
    ["ナ", "メ"],
    ["ハ", "ヘ"],
    ["マ", "ム"],
    ["ヨ", "ヲ"],
]

public let isVisible = [
    true,  true,  true,  true,  true,
    true,  true,  true,  true,  true,
    true,  true,  true,  true,  true,
    true,  true,  true,  true,  true,
    true,  true,  true,  true,  true,
    true,  true,  true,  true,  true,
    true,  true,  true,  true,  true,
    true,  false, true,  false, true,
    true,  true,  true,  true,  true,
    true,  false, true,  false, true,
    false, true,  false, true, false,
    
    true,  true,  true,  true,  true,
    true,  true,  true,  true,  true,
    true,  true,  true,  true,  true,
    true,  true,  true,  true,  true,
    true,  true,  true,  true,  true,
    
    true,  true,  true,  true,  true, true,
    true,  true,  true,  true,  true, true,
    true,  true,  true,  true,  true, true,
    true,  true,  true,  true,  true, true,
    true,  true,  true,  true,  true, true,
    true,  true,  true,  true,  true, true,
]

// return kana in range from...upto
// BUG: enters an endless loop when isVisible[upto] == false
public func nextKana(index: KanaIndex, from: KanaIndex = 0, upto: KanaIndex = kanaCount-1) -> KanaIndex {
    var i = index
    repeat {
        i = i + 1
        if i > upto {
            i = from
        }
    } while isVisible[i] == false
    return i
}

public func previousKana(index: KanaIndex, from: KanaIndex = 0, upto: KanaIndex = kanaCount-1) -> KanaIndex {
    var i = index
    repeat {
        i = i - 1
        if i < from {
            i = upto
        }
    } while isVisible[i] == false
    return i
}

public func visibleCount(from: KanaIndex, upto: KanaIndex) -> KanaIndex {
    var x = 0
    for i in from...upto {
        if isVisible[i] {
            x = x + 1
        }
    }
    return x
}

public func looksLike(this index: KanaIndex, _ isHiragana: Bool, before: Int = kanaCount) -> Set<Int> {
    var likes: Set<Int> = []
    if isHiragana {
        let kana = hiragana[index]
        for set in hiraganaLookalikes {
            if set.contains(kana) {
                let indices = set.map { k in hiragana.firstIndex(of: k) ?? index }
                likes = likes.union(indices)
            }
        }
    }
    else {
        let kana = katakana[index]
        for set in katakanaLookalikes {
            if set.contains(kana) {
                let indices = set.map { k in katakana.firstIndex(of: k) ?? index }
                likes = likes.union(indices)
            }
        }
    }
    likes = likes.filter { index in index < before }
    likes.remove(index)
    return likes
}

public func randomVisible(in range: Range<Int>) -> KanaIndex {
    let visibleIndexes: [KanaIndex] = range.filter { index in isVisible[index] }
    return visibleIndexes.randomElement()!
}

public typealias KanaIndex = Int   // range 0..<kanaCount

public enum KanaMode: String, Codable, CaseIterable {
//    public enum KanaMode: Int, Codable, CaseIterable {
    case H2R, K2R, R2H, R2K, H2K, K2H, none
    static let hiraganaModes: Set<KanaMode> = [H2R, R2H, H2K]
    static let katakanaModes: Set<KanaMode> = [K2R, R2K, K2H]
    static func random() -> KanaMode { allCases.randomElement() ?? .H2R }
//    static func random() -> KanaMode { [H2R, K2R, R2H, R2K, H2K, K2H].randomElement()! }

    var description: String { String(describing: self) }
}
