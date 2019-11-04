import os

a = os.chdir(os.path.dirname(__file__))

f = open("anime.html", "w+")

f.write("<html>\n\t<body style='background-color:black;'>\n\t<div align=center >" +"\n")


for i in (os.listdir(a)):
    if i.endswith('.png'):
        f.write('\t\t<img src="' + i + '"><br>' + "\n")

f.write("\t</div>\n\t</body>\n</html>")