# すごろくゲーム設計ドキュメント
## Class:Game
### 属性:players[], masus[], roulette, turnCount, logs
- masus　60マス
- roulette　ランダムな1～6
- turnCount　現在のターン数
- logs　履歴を記録する
### メソッド:startGame(), nextTurn(), update(), drawUI()
- startGame()　ゲームの初期化
- nextTurn()　次のターンに進む処理
- update()　状態を更新
- drawUI()　ターンやログを表示する

## Class:player
### 属性:name, position, point, Rest, characterImage
- name　プレイヤーの名前
- position　現在のマス
- point　所持ポイント
- Rest　休み状態
- playerImage　プレイヤーの見た目
### メソッド:move(int), MasuEffect(Masu), draw()
- move(int)　指定の数移動
- MasuEffect(Masu)　止まったマスのイベントを開始
- draw()　プレイヤーをマス上に表示

## Class:Masu
### 属性:index, type, description, position, color
- index　マス番号
- type　マスのタイプ(イベント)
- position　画面上の座標
### メソッド:draw(), event()
- draw()　マスの見た目を表示
- event()　プレイヤーが止まった時のイベント処理

## Class:Roulette
### 属性:currenVlue
- currenVlue　出目
### メソッド:spin(),draw()
- spin()　出目をランダムで決める
- draw()　出目を表示

## Class:Point
### 属性:value
- value　現在のポイント数
### メソッド:add(int), subtract(int), getValue()
- add(int)　ポイントを増加
- subtract(int)　ポイントを減少
- getValue()　現在のポイントを取得


