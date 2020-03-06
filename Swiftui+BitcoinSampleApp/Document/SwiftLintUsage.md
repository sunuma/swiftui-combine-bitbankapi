### SwiftLint運用メモ

- 静的解析によるルール決め
- 自動修正

#### 導入
Homebrewを使ってswiftlintをインストール
```
$ brew install swiftlint
```
設定ファイル`.swiftlint.yml`をPjディレクトリ直下に作成  
lintの解析対象外のパスを追加
```
# Lint対象外のパス
excluded:
- Carthage
- Pods
- Pods
```
プロジェクトファイル > TERGETS > Build Phases > Run Script 追加  
新規Run Scriptの名前変更 `Run Script - SwiftLint`  
ビルド実行時に静的解析が走るように以下のShellを追加
```
if which swiftlint >/dev/null; then
    swiftlint autocorrect --format
    swiftlint
else
    echo "SwiftLint does not exist, download from https://github.com/realm/SwiftLint"
fi
```
一旦、ビルドしLintにひっかかった警告とエラーを確認  
必要ならファイルを修正、警告とエラーのルールを除外したいなら`.swiftlint.yml`に追加  
今回は以下を追加
```
# 1行の文字列制限
line_length:
- 200   # warning
- 300   # error
```
今後も外したいルールが発生した場合はymlファイルに随時追加
