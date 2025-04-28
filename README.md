

# Instagram クローンアプリケーション

<img width="860" alt="image" src="https://github.com/user-attachments/assets/107bf741-8eb9-446e-8a2f-ab84c9d6aa3d" />

<img width="417" alt="image" src="https://github.com/user-attachments/assets/da47eca2-3c0b-4e3e-bb92-fb1f417de478" />

## プロジェクト概要
このアプリケーションは、Instagramの主要機能を模倣したRails 7ベースのSNSアプリケーションです。

## 必要条件
- Ruby: `.ruby-version` ファイルを参照 (現在のバージョン)
- Rails: 7.x
- Docker & Docker Compose

## セットアップ手順

### 1. リポジトリのクローン
```bash
git clone https://github.com/your-username/rails7_instagram_parody.git
cd rails7_instagram_parody
```

### 2. 環境設定
```bash
# Dockerコンテナのビルドと起動
docker-compose build
docker-compose up -d
```

### 3. データベースの準備
```bash
# データベースの作成とマイグレーション
docker-compose run web rails db:create
docker-compose run web rails db:migrate
```

### 4. テストの実行
```bash
# RSpecテストスイートの実行
docker-compose run web bundle exec rspec
```

## 主な機能
- ユーザー認証
- 投稿の作成、編集、削除
- いいね機能
- コメント機能
- プロフィール編集

## 使用技術
- Ruby on Rails 7
- PostgreSQL
- Docker
- RSpec (テスティングフレームワーク)

## 開発環境
- OS: macOS
- Ruby: 3.x
- Rails: 7.x

## デプロイ
現在、デプロイ方法は準備中です。

## ライセンス
[ライセンス情報を追加]

## 貢献
プルリクエストは歓迎します。大きな変更を行う前に、まずissueで議論してください。
