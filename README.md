# README

# app name
 鼻歌.com
# 概要
  この「鼻歌.com」はわからない曲を共有し、Q＆Aのような形で回答してもらうアプリケーションになっています。

# 制作背景(意図)
わからない曲があった際にgoogleでの曲探し「what this song」というサービスでメロディーを口ずさむだけで検索できます。しかしそれも完全ではありません。そこで思い出せない曲を共有し、回答できるアプリケーションを作成しました。

# 要件定義
 音声録音機能
・このアプリケーションはわからない歌をユーザーが鼻歌、リズムなどを音声ファイルで共有し、回答をもらうことを想定している。
・投稿を円滑にするため、投稿時に音声録音機能を実装し、その場でファイル生成することができる。

音声再生機能
・ユーザーはトップページ、また投稿の詳細ページにて再生することができる。
・ユーザーはトップページにて、複数の投稿を閲覧、音声ファイルの再生ができる。
・気になった投稿があれば詳細ページに遷移し、コメントする形で回答することができる。

カテゴリー分け機能
・ユーザーはカテゴリー分けされている中から、気になる投稿を閲覧することができる。
・新着投稿には新規投稿した中から数を限定して表示している。
・解決済みの投稿、未解決の投稿はタグで管理しており、もし投稿者が望みの回答が得ることができたら、解決済みのタグに編集。トップページでは解決済みの欄に表示される。

# DEMO(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)
https://gyazo.com/132dc3827ac2dfc72dfcb9ebeb3694c5
# 工夫したポイント


# 使用技術(開発環境) 
ruby/ruby on rails/git hub/javascript

# 課題や今後実装したい機能
カテゴリー分け機能の追加
・今はまだ考えていませんが、今後投稿数が増えたとしたら、より細かいカテゴリーに分けることでアプリケーションの利便性が上がると思います。

# DB設計



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