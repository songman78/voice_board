# README


# app name
 鼻歌検索

# 概要
  この「鼻歌検索」はわからない曲を音声ファイルと共に投稿し、Q＆Aのような形でコメントで投稿に回答してもらうアプリケーションになっています。
  音声ファイルを投稿する際には投稿ページにて録音し、ファイルを作成します。
  投稿するとトップページにて音声ファイルを再生することができます。

# 制作背景(意図)
わからない曲があった際にgoogleでの曲探し「what this song」というサービスでメロディーを口ずさむだけで検索できます。しかしそれも完全ではありません。そこで思い出せない曲を共有し、回答できるアプリケーションを作成しました。

# 要件定義
<h3>音声録音機能</h3>
<p>・このアプリケーションはわからない歌をユーザーが鼻歌、リズムなどを音声ファイルに録音し、投稿、その後コメントをされる形で回答をもらうことを想定している。</p>
<p>・投稿時に音声録音機能を実装し、その場でファイル生成することができる。</p>
<p>・作成したファイルを選択し、PCに保存することができる。</p>

<h3>音声再生機能</h3>
<p>・ユーザーはトップページ、また投稿の詳細ページにて再生することができる。</p>
<p>・ユーザーはトップページにて、複数の投稿を閲覧、音声ファイルの再生ができる。</p>
<p>・気になった投稿があれば詳細ページに遷移し、コメントする形で回答することができる。</p>

<h3>カテゴリー分け機能</h3>
<p>・ユーザーはカテゴリー分けされている中から、投稿を閲覧することができる。</p>
<p>・新着投稿には新規投稿した中から数を限定して表示している。</p>
<p>・解決済みの投稿、未解決の投稿はタグで管理しており、もし投稿者が望みの回答が得ることができたら、解決済みのタグに編集。トップページでは解決済みの欄に表示される。</p>

# DEMO

<p>投稿する際に録音をし、音声ファイルを作成しています<p>
<a href="https://gyazo.com/132dc3827ac2dfc72dfcb9ebeb3694c5"><img src="https://i.gyazo.com/132dc3827ac2dfc72dfcb9ebeb3694c5.gif" alt="Image from Gyazo" width="1000"/></a>

<p>実際に投稿すると、新着、未解決の欄に表示されます<p>
<a href="https://gyazo.com/ac6ec346bb4513dd73adb221e3f5f30f"><img src="https://i.gyazo.com/ac6ec346bb4513dd73adb221e3f5f30f.png" alt="Image from Gyazo" width="1026"/></a>


# 使用技術(開発環境) 
<p>ruby-version 2.6.5</p>
<p>ruby on rails</p>
<p>git hub</p>
<p>javascript</p>
 

# 環境構築
$ git clone https://github.com/songman78/voice_board
$ cd voice_board
$ bundle install
$ yarn install
$ rails db:create
$ rails db:migrate
$ rails s
👉 http://localhost:3000

# 課題や今後実装したい機能
カテゴリー分け機能の追加
・今はまだ考えていませんが、今後投稿数が増えたとしたら、より細かいカテゴリーに分けることでアプリケーションの利便性が上がると思います。

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