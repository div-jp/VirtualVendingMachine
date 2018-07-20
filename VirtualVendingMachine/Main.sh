#! /bin/sh

# 仮想自動販売機

. ./AddMoney.sh
. ./checkNum.sh
. ./Display.sh 
. ./OutputProcessing.sh
. ./QuantityProcessing.sh


Main()
{
	local status=""     #入力
	money=0       #金額グローバル

	while [ "Q" != "${status}" ] && [ "q" != "${status}" ]; do
		Display
		read status

		case "${status}" in
			"1" | "2" | "3" | "4" ) OutputProcessing ${status} ;;
			"9" ) AddMoney ;;
			"Q" | "q" ) ;;
			* ) printf "もう一度入力してください。\n\n"
		esac
	done

	printf "ありがとうございました。\n\n"
}


Main







