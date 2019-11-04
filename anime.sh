rm index.html
echo "<body style='background-color:black;'><div align=center >" >> index.html
for i in $(ls);
do
	echo "$i<br>" >> index.html;
	echo "<img src=$i><br>" >> index.html;
done
echo "</div></body>" >> index.html
