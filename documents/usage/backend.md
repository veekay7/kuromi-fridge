# コンテナの起動
## 開発環境
```sh
docker compose up -d
```

以下の2つがマージされて実行される（overrideは-fコマンド無しで勝手にマージされる）
- docker-compose.yml
- docker-compose.override.yml

## 本番環境
```sh
docker compose -f docker-compose.yml -f docker-compose.prod.yml up -d
```

以下の2つがマージされて実行される（prodは明示的に書かないとマージされない）
- docker-compose.yml
- docker-compose.prod.yml

# APIサーバーの起動
コンテナに接続
```sh
docker compose exec api sh
```

プロジェクトディレクトリに移動
```sh
cd test_project/
```

- 開発環境はこちら
```sh
python manage.py runserver 0.0.0.0:8000
```

- 本番環境はこちら
```sh
python manage.py runserver 0.0.0.0:80
```

# アクセスポイント
- 開発環境 : 
[http://localhost:8000/api/](http://localhost:8000/api/)
- 本番環境 : 
[https://kuromi.amota.net/api/](https://kuromi.amota.net/api/)
