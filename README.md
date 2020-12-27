# アプリケーション名
vocabulary_app

## アプリケーション概要
中・上級者向けの英単語を学習できます

## URL
未実装

## テスト用アカウント
未実装

## 利用方法
最初にユーザー登録を行ってください。
「学習を始める」ボタンからスタートしてください。

## 目指した課題解決
市販の単語帳には数多くの単語が載っており
中・上級者にとっては今更覚える必要がない単語も多く載っています。
その人たちのためにTOEIC®845点をとったことがある製作者が
これは覚えておいた方がいい！と思う重要単語のみを選出して問題を作りました。

## 洗い出した要件
未実装

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

### Association
- has_many: assignments

## assignmentsテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| vocabulary_id | integer    | null: false                    |

### Association
- belongs_to: user
- belongs_to_active_hash: vocabulary

## ローカルでの動作方法
未実装