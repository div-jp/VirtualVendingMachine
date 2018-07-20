#! /bin/sh



AddMoney()
{
	local value          #金額
	local st             #チェックステータス用

	#local money="$1"    #引数

	printf "金額を入力してください。"
	read value

	st=$(checkNum $value)

	if [ "false" = "$st" ]; then
		printf "数値を入力してください。\n"
	else
		money=$(( $money + $value ))
	fi

}

TestData()
{
	. ./checkNum.sh

	money=0
	AddMoney
	printf "${money}\n"

}

#TestData




