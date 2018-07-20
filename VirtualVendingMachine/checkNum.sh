#! /bin/sh


checkNum()
{
	# 入力された変数が数字だけかどうかチェックする関数
	# 引数が数字だけの文字列ならfalseを表示し、そうでない場合にはtrueを表示する。

	local compressed="$(echo $1 | sed -e 's/[[:digit:]]//g')"

	if [ ! -n "$compressed" ] ; then 
		printf "true"
		#return 0
	else
		printf "false"
		#return 1
	fi 
}








