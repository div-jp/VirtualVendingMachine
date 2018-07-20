#! /bin/sh



QuantityProcessing()
{
	local PN         #
	local QP         #Quantityの数量

	PN="$1"

	QP=$( grep "\$\.${PN}\.Quantity" ./Data.txt | cut -f2 )

	if [ 0 -lt "${QP}" ]; then
		QP=$(( ${QP} - 1 ))
	fi

	grep -v "\$\.${PN}\.Quantity" ./Data.txt | sort -uo ./Data.txt
	printf "$.${PN}.Quantity\t${QP}" >>./Data.txt

	#数量が0になったらフラグを1に
	if [ 0 -eq "${QP}" ]; then
		grep -v "\$\.${PN}\.SoldOutFlg" ./Data.txt | sort -uo ./Data.txt
		printf "$.${PN}.SoldOutFlg\t1" >>./Data.txt
	fi

}


TestData()
{
	QuantityProcessing N1
}

#TestData







