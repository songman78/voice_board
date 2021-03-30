# README


# App name
 鼻歌掲示板

# 概要
  この「鼻歌掲示板」はわからない曲を音声ファイルと共に投稿し、Q＆Aのような形で投稿に対して回答してもらうアプリケーションになっています。
  回答はコメント機能を用いて実装しています。
  投稿する際には投稿ページにて録音し、ファイルを作成します。
  投稿するとトップページにて音声ファイルを再生することができます。


# App URL
<p>safariでは再生機能の対応はされていません</p>
  ### **https://voice-board.herokuapp.com/**  


# 制作背景(意図)
わからない曲があった時にリズムや、メロディーが思い浮かぶが、曲名が思い出せない。
ネットで検索してもなかなか見つからないといった経験があると思います。
そこで鼻歌でメロディーを録音し共有することで、曲探しの1つの手段として使えるのではないかと思い「鼻歌掲示板」を作成しました。

# 要件定義
<h3>音声録音機能</h3>
<p>・わからない歌を鼻歌や、リズムの音声を録音し、音声ファイルを作成します。</p>
<p>・作成したファイルを選択し、PCに保存することができます。</p>

<a href="https://gyazo.com/8b1451518606e9321297cb2a64c7c1cc"><img src="https://i.gyazo.com/8b1451518606e9321297cb2a64c7c1cc.gif" alt="Image from Gyazo" width="1000"/></a>

<h3>音声再生機能</h3>
<p>・ユーザーはトップページ、また投稿の詳細ページにて音声ファイルを再生することができます。</p>

<a href="https://gyazo.com/dc218b08310fd8f88524c481872f3235"><img src="https://i.gyazo.com/dc218b08310fd8f88524c481872f3235.gif" alt="Image from Gyazo" width="1000"/></a>

<h3> コメント機能<h3>
<p>・気になった投稿があれば詳細ページに遷移し、コメントする形で回答することができます。</p>
<a href="https://gyazo.com/a00b65d3d7b6176843dc7864c4336eec"><img src="https://i.gyazo.com/a00b65d3d7b6176843dc7864c4336eec.gif" alt="Image from Gyazo" width="1000"/></a>

<h3>カテゴリー分け機能</h3>
<p>・新着投稿には新規投稿した中から数を限定して表示している。</p>
<p>・解決済みの投稿、未解決の投稿はタグで管理しており、もし投稿者が望みの回答が得ることができたら、解決済みのタグに編集。トップページでは解決済みの欄に表示されます。</p>
<a href="https://gyazo.com/d71caed365ab5144a5cf8c0f9d97bcd3"><img src="https://i.gyazo.com/d71caed365ab5144a5cf8c0f9d97bcd3.gif" alt="Image from Gyazo" width="1000"/></a>



# 使用技術(開発環境)
## バックエンド
<p>Ruby(ver 2.6.5)</p>
<p>Ruby on rails(ver 6.0.3.5) </p>

## フロントエンド
<p>HTML</p>
<p>CSS</p>
<p>JavaScript</p>

## データベース
<p>MySQL(ver 5.6)</p>
<p>SeaquelPro</p>

## アプリケーションサーバー(本番環境)
<p>heroku</p>

## ソース管理
<p>GitHub</p>
<p>GitHubDesktop</p>

## エディタ
<p>VScode</p>
 

# DB設計

<a href="https://gyazo.com/9ab7ca62a09c08a4e5957bce28de4ee9"><img src="https://i.gyazo.com/9ab7ca62a09c08a4e5957bce28de4ee9.png" alt="Image from Gyazo" width="100%"/></a>


# テーブル設計

## users テーブル

| Column              | Type   | Options                 |
| ------------------- | ------ | ----------------------- |
| name                | string | null: false             |
| email               | string | unique: true,null: false|
| encrypted_password  | string | null: false             |

### Association
- has_many :tweets
- has_many :comments

## tweets テーブル

| Column            | Type     | Options                        |
| ----------------- | -------- | ------------------------------ |
| text              | string   | null: false                    |
| file              | string   | null: false                    |
| user              |references| null: false, foreign_key: true |
| check_id          |  integer | null: false                    |

- belongs_to :user
- has_many :comments

## comments テーブル

| Column            | Type     | Options                        |
| ----------------- | -------- | ------------------------------ |
| text              | string   | null: false                    |
| user              |references| null: false, foreign_key: true |
| tweet             |references| null: false, foreign_key: true |

- belongs_to :user
- belongs_to :tweet