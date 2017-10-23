# AppAuthDemo-iOS

## 開発環境
* Xcode 9.0.1
* Swift4
* CocoaPods 1.2.1
* iOS 10.1以上
* AppAuth for iOS 0.90.0

## 実装済み機能
* Google Accountsを使ったサインイン
* リフレッシュトークンを使ったアクセストークンの更新

## 直近実装予定の機能
- [ ] UserInfoエンドポイントからのユーザ情報の取得
- [ ] KeyChainServiceへのAccessToken, RefreshTokenの保存

## 遊び方
* AppAuthDemo-iOS/AppAuthDemo-iOS/ViewController.swiftを編集します
  - kClientIDへClientIDを設定してください
  - iOSのURLスキームをkRedirectURIへ設定してください
* AppAuthDemo-iOS/AppAuthDemo-iOS/info.plistを編集します
  - URLTypes/URLSchemasへiOSのURLスキームを設定してください
* Xcodeでこのプロジェクトを開き・ビルドします 
