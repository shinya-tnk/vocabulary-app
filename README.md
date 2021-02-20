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

## 洗い出した要件


## 実装した機能についてのGIFと説明
未実装

## 実装予定の機能
間違えた問題の復習

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

## ローカルでの動作方法
未実装