# max

Calculates and outputs maximum value.  
最大値を計算し、出力します。  

## SYNOPSIS

`max [OPTION] [FILE]`

## DESCRIPTION

Using option "-i, --min", you can get minimum value.  
オプション "-iもしくは--min" で最小値を出力します。  

These commands provide you the maximum/minimum value using integer style value separated by changing line.  
このコマンドは改行で区切られた整数の値の列から最大/最小値を出力します。  

For persons who think "To be working, or not to be, that is the question." about this command, number of the line processed will be put into the default error output (2>)  
1000行ごとに処理した行の番号を標準エラー出力します、ちゃんと動いているか心配な方のために。  

You can use pipe, file input and redirection.
パイプ、ファイル名指定、入力リダイレクトを使用できます。

## OPTIONS

- `-i/--min` - work as "min"(calculating minimum one). 最小値を出力します。
- `-h/--help` - shows help page. ヘルプページを表示します。
- `--` - Use to escape. エスケープするために使用します。

## BUGS

It takes too long time to get output. 出力までが遅すぎる。  
=>You might use Rust language, C language etc...  
=>最近話題のRustとかCでたぶん同じことができると思います。  

There are no advantage to write in Shell language.  
シェルで書く必要があると思えない   
=>If you realize so, should it be the time to learn how to use other tool such as Julia , MATLAB or sth like that? Please do not be so angry. I find Shell scripts as easily fixable, executable and remarkable tools.  
だったら別のなんか速い言語でやったら良いと思います  
そんなに興奮しないでください  
Unix系OSの環境で手軽に実行・改変できるようなソフトウェアを作る方法としてシェルスクリプトはとても価値があると思っています。  
手軽さのために犠牲にしているものがあるかもしれません。  
もしこのソフトウェアのパフォーマンスについて不満があるならば、それは重点を置く場所がわたしとあなたで異なっているということです。  

## AUTHOR

Written by REN Shimizu  
Grammarly support by ChatGPT  

## REPORTING BUGS

Stu-mail in KU or twitter @stspecedjpstuku

## COPYRIGHT

You can change and use this script for any ways. There is no warranty, extent limitation by the law.  
このスクリプトはあなたが任意の方法で変更し使用することができます。保証はありません、法律による制約範囲内で。  

## SEE ALSO

[https://jp.mathworks.com/products/matlab.html](https://jp.mathworks.com/products/matlab.html)

[https://julialang.org/](https://julialang.org/)
