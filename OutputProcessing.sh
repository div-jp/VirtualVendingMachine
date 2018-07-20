#! /bin/sh


OutputProcessing()
{

	local PriceNum="N"$1      #商品の番号

	local flg=""              #売り切れフラグ
	local PName=""            #商品名
	local P=""                #値段


	flg=$( grep "\$\.${PriceNum}\.SoldOutFlg" ./Data.txt | cut -f2 )
	PName=$( grep "\$\.${PriceNum}\.ProductName" ./Data.txt | cut -f2 )

	if [ 1 -eq "${flg}" ]; then
		printf "${PName}は売り切れです。\n"
		return 0
	fi

	P=$( grep "\$\.${PriceNum}\.Price" ./Data.txt | cut -f2 )
	if [ "${money}" -lt "${P}" ]; then
		printf "金額が不足しています。\n"
		return 0
	else
		printf "${PName}を1本購入しました。\n"
		QuantityProcessing ${PriceNum}
		money=$(( ${money} - ${P} ))
	fi

}


TestData()
{
	money=0
	OutputProcessing 1
	printf "${money}\n"

	money=1000
	OutputProcessing 1
	printf "${money}\n"
}

#TestData




