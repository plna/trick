import PyPDF2
import os
import re
from PyPDF2 import PdfFileMerger, PdfFileReader


name = []
number = []
item = os.listdir()
# print(item)

for i in item:
  if re.match(r"^[a-zA-Z].*(pdf)$", i):
    name.append(i)
    
  elif re.match(r"^\d.*(pdf)$", i):
    number.append(i)


print(name)
print(number)
print("-------------------------------------")

for i in name:
  for j in number:
    # print(j[-7:])
    if j[-7:] == i[-7:]:
      print(i,j)
      if not os.path.exists("Done"):
        os.makedirs("Done")
      with open (os.path.join('Done', i), 'wb') as out:
        mergeFile = PyPDF2.PdfFileMerger()

        mergeFile.append(PyPDF2.PdfFileReader(i, 'rb'))
        mergeFile.append(PyPDF2.PdfFileReader(j, 'rb'))

        mergeFile.write(out)
