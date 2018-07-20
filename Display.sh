#! /bin/sh




Display()
{
	local number=1   #カウント用
	local str1=""    #
	local str2=""    #
	local str3=""    #

	printf "いらっしゃいませ。\n\n"
	for i in $(awk 'BEGIN{FS="."}{print $2}' ./Data.txt | sort | grep -v "^$" | uniq)
	do
		str1=$(grep "\$\.$i\.ProductName" ./Data.txt | cut -f 2)
		str2=$(grep "\$\.$i\.Price" ./Data.txt | cut -f 2)
		str3=$(grep "\$\.$i\.SoldOutFlg" ./Data.txt | cut -f 2)
		if [ 1 -eq "${str3}" ]; then
			printf "%d %-25s%s円 *売り切れ\n" ${number} ${str1} ${str2}
		else
			printf "%d %-25s%s円\n" ${number} ${str1} ${str2}
		fi
		number=$(( ${number} + 1 ))
	done

	printf "\n9 金額投入\nQ 終了\n\n"
	printf "ただ今%d円\n" ${money}
}



TestData()
{
	Display
}

#TestData




