# README

| User |
| :--- |
| text | name |
| string  | email |
| string | password_digest |

| Task |
| :--- |
| text | title |
| text | content |
| date | deadline |
| datetime | created_at |
| string | priority |
|string | status |
| bigint | user_id |

| Task_section |
| :--- |
| bigint | task_id |
| bigint | label_id |

| Label |
| :--- |
| string | name1 |
| string | name2 |
| string | name3 |


### デプロイの手順
- デプロイしたいappのディレクトリにいるか確認
- git status でコミット漏れがないか確認
- herokuにログイン
  - $ heroku login
- herokuに新規アプリを作成する
  - $ heroku create
- Failed to install gems via Bundler.となるので下記コマンドを実行
  - $ bundle lock --add-platform x86_64-linux
  - $ git add .
  - $ git commit -m "Gemfile.lock fix"
- デプロイする
  - git push heroku master
  - masterとは別のブランチにいる際は $ git push heroku step2:master