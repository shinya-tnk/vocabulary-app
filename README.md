# アプリケーション名
Vocapp

## アプリケーション概要
中・上級者向けの英単語のタイピングゲームです

## URL
https://vocapp4upper-learners.herokuapp.com/

## テスト用アカウント
email: hoge@sample.com
password: hoge1234

## 利用方法
最初にユーザー登録を行ってください。
Googleアカウント、Facebookアカウントからでもサインインできます。
「学習を始める」ボタンからスタートしてください。
デフォルトで用意されていつ100単語のうちランダムな20単語が表示されます。
もし分からなければヒントボタンを押すと1文字ずつスペルが開きます。
各ユーザー毎に単語を新規登録できます。


## 目指した課題解決
市販の単語帳には数多くの単語が載っており
中・上級者にとっては今更覚える必要がない単語も多く載っています。
その人たちのためにTOEIC®845点をとったことがある製作者が
これは覚えておいた方がいい！と思う100単語を選出して問題を作りました。
またユーザーは自分の単語を登録でき、自分だけのオリジナル単語帳を作成できます。


## 実装した機能についてのGIFと説明

### ユーザー機能
![sign-in-using-facebook](https://user-images.githubusercontent.com/70380308/108625056-08fd6600-748c-11eb-9c66-3268c57d7026.gif)
![sign-in-using-google](https://user-images.githubusercontent.com/70380308/108625073-26cacb00-748c-11eb-91c5-29c7d349a798.gif)
- Googleアカウント、Facebookアカウントでのサインアップ、サインインが可能

### 単語新規登録、登録単語一覧表示
![new](https://user-images.githubusercontent.com/70380308/108625027-e66b4d00-748b-11eb-91b8-aff6f824fb5e.gif)

- ユーザー毎にオリジナル単語帳が作成できるようにするため
- 自分で登録した単語を確認するため
### 単語編集機能
![edit](https://user-images.githubusercontent.com/70380308/108625006-c76cbb00-748b-11eb-9d9f-38e796bad46e.gif)
- 誤登録したり単語の意味を追加するため
### 単語削除機能
![delete](https://user-images.githubusercontent.com/70380308/108624995-b2902780-748b-11eb-8029-1ed81b8cd61d.gif)
- 学習不要になった単語を削除するため
### 単語検索機能
![search](https://user-images.githubusercontent.com/70380308/108625041-faaf4a00-748b-11eb-868d-74d631a4a7ce.gif)
- 効率よく単語の編集・削除をするため

### タイピング機能
![app](https://user-images.githubusercontent.com/70380308/108625092-406c1280-748c-11eb-9c0b-67976281ecf2.gif)

## 実装予定の機能
- 間違えた問題の復習
- 総学習時間の表示

# データベース設計

## usersテーブル
| Column   | Type   | Options                   |
| -------- | ------ | ------------------------- |
| nickname | string | null: false               |
| email    | sting  | null: false, unique: true |
| password | string | null: false               |

### Association
- has_many :vocabularies
- has_many :sns_credentials

## vocabulariesテーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| word         | string     | null: false                    |
| description1 | string     | null: false                    |
| description2 | string     |                                |
| description3 | string     |                                |
| description4 | string     |                                |
| description5 | string     |                                |
| user_id      | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## sns_credentialsテーブル
| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| provider | string     |                   |
| uid      | string     |                   |
| user_id  | references | foreign_key: true |

### Association
- belongs_to :user, optional: true

