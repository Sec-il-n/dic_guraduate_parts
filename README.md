# README

# 個人事業主と企業のためのソーシャルワークツール(仮)

## 概要
- 当該機能を利用する事で、コロナ禍で苦境に立たされている業種などを支援する
- 個人や小規模な企業が持つ、技術や知識等を新規提案やプロジェクト等で発揮できる機会を提供する

## コンセプト
企業や個人事業主等が異なる分野や技術を持つ、他の企業・個人事業主と出会い、
コラボレーションすることで、新しいプロジェクトやビジネスチャンスを創造する機会を提供する。

~不特定多数が対象ではなく、安心して利用可能できるサービス~

## バージョン
Ruby 2.6.5
Rails 5.2.4

## 機能一覧
- [ ] ログイン、ログアウト機能
- [ ] ユーザー登録機能
- [ ] ユーザー編集・削除機能
  - [ ] メールアドレス、名前、パスワードは必須
- [ ] 新規提案・プロジェクト等一覧表示機能
- [ ] 新規提案・プロジェクト等一覧ページネーション機能
- [ ] 新規提案・プロジェクト等投稿機能
  - [ ] タイトルと詳細は必須
- [ ] 新規提案・プロジェクト等編集・削除機能
  - [ ] 管理者のみ実行可能
- [ ] 新規提案・プロジェクト等カテゴリ別検索機能
- [ ] 新規提案・プロジェクト等タグ検索機能
- [ ] コメント投稿・一覧表示機能
- [ ] コメント編集・削除機能
  - [ ] コメント編集・削除はコメントした本人のみ可能
- [ ] プロフィール掲載機能
 - [ ] 企業名・詳細は必須
 - [ ] ユーザーに紐づいた各企業、個人事業主のプロフィールを登録できる
 - [ ] プロフィール画像を登録できる
- [ ] プロフィール編集機能
 - [ ] ユーザーに紐づいた各企業、個人事業主のプロフィールを編集できる
- [ ] メッセージ(チャット)機能
- [ ] メッセージ(チャット)編集機能
- [ ] お問い合わせ機能
- [ ] SNSログイン機能

## カタログ設計
https://docs.google.com/spreadsheets/d/e/2PACX-1vRqVSkgMzEYhO3Q55r1VYW0oP68CUHS_8YqNlmYYpF-6ZLfTgY3M7u19xKSkVRdRnqvShrncaNOp-JZ/pubhtml

## テーブル定義
https://docs.google.com/spreadsheets/d/e/2PACX-1vTChefi9-fdM72q9wIsmll3aKLKR106-yFp-IUqluMBMcXsm65pyOUDGduJCjhqUkGAmD5l2zeqQu15/pubhtml

## 画面遷移図
https://docs.google.com/spreadsheets/d/e/2PACX-1vR2YlYCiR5SfQbLuZS9L510u0G9624ibTMqRqyMTqaYFHcRXNdoRrELONQT_QLY0nIjAaV-d4wTvN9U/pubhtml

## 画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/e/2PACX-1vS_UUS7VNY9v1dpvMowaxw6J5hyjFCVdKeaj3CpTsbfQPxwxbFcl2JbgZlduFpUA4fOQ7HGmiBPkJpj/pubhtml

## 使用予定Gem
* devise
* carrierwave
* mini_magick
* kaminari
* aws-sdk-s3
* fog-aws
* jquery-rails
* turbolinks

## 使用技術
- 就職Term
  - aws EC2、S3の使用
  - Deviseを使用したログイン機能の実装
  - Ajaxを使用したコメント投稿/表示機能
  
- カリキュラム外
  - ActionCableを使用したメッセージ機能
