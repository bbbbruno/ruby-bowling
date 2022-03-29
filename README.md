# ruby-bowling

ruby で作ったボウリングのスコア計算プログラムです

## 使用方法

以下のようにボウリングの結果を文字列で与えると、その合計スコアを計算します。

```bash
$ ./bin/bowling.rb 6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,6,4,5
139
```

### 表記の意味

`,`:投球の区切り  
`0-10`: 何本倒したか  
`X`: ストライク

## テスト方法

```
$ ruby test/game_test.rb
Run options: --seed 30814

# Running:

.

Finished in 0.000428s, 2336.4486 runs/s, 14018.6916 assertions/s.

1 runs, 6 assertions, 0 failures, 0 errors, 0 skips
```
