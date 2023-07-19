##  NAME

* max - calcrates and putputs maximum value. *
* min - (以下同文.sh | sed 's/maximum/minimum/g') *

##  SYNOPSIS

       max [OPTION] [FILE]
       min [Option] [File]

##  DESCRIPTION

       This command(s) porovide(s) you to the maximum/minimum value using integer style values separated by changing line.
       このコマンドは改行で区切られた整数の値の列から最大/最小値を出力します。
       You can use pipe, file and redirection.
       パイプ、ファイル名指定、入力リダイレクトを使用できます。

       For instance, use this file named "date.txt" which contain folowing lines.
       例えば、以下のような整数値を含む"data.txt"を用意します。
       ===
       12
       -1
       123
       -123
       ===
       Then you do in this way, you will get output.
       このようにすると、最大値が出力されます。
       $ max < data.txt
       123

##  OPTIONS

       Remove (unlink) the FILE(s).

       -f, --force
              ignore nonexistent files and arguments, never prompt

       -i     prompt before every removal

       -I     prompt once before removing more than three files, or when
              removing recursively; less intrusive than -i, while still
              giving protection against most mistakes

       --interactive[=WHEN]
              prompt according to WHEN: never, once (-I), or always
              (-i); without WHEN, prompt always

       --one-file-system


       Note that if you use rm to remove a file, it might be possible to
       recover some of its contents, given sufficient expertise and/or
       time.  For greater assurance that the contents are truly
       unrecoverable, consider using shred(1).

##  BUGS
	   It takes too long time to get output.
	   出力までが遅すぎる
	   =>You might use Rust lauguage, C language etc...
	   =>最近話題のRustとかCでたぶん同じことができると思いますよ

	   There are no advantage to write in Shell language.
	   シェルで書く必要があると思えない
	   =>If you rearize so, should it be the time to learn how to use other tool such as Julia , MATLAB or sth like that?
	   だったら別のなんか速いもんでやったら良いと思います
	   そんなに興奮しないでください
	   Unix系OSの環境で手軽に実行・改変できるようなソフトウェアを作る方法としてシェルスクリプトはとても価値があると思っています。
	   手軽さのために犠牲にしているものがあるかもしれません。
	   もしこのソフトウェアのパフォーマンスについて不満があるならば、それは重点を置く場所がわたしとあなたで異なっているということです。

##  AUTHOR

       Written by REN Shimizu.


##  REPORTING BUGS

       Stu-mail in KU or twitter @stspecedjpstuku

##  COPYRIGHT

       Copyright 
       You can change and use this script for any ways.
       There is no warranty, extent limitation by the law.

##  SEE ALSO

       https://jp.mathworks.com/products/matlab.html
       https://julialang.org/