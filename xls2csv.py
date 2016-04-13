# -*- coding: utf-8 -*-

import xlrd
import csv

wb = xlrd.open_workbook('201301.xls', encoding_override='cp1251')
sh = wb.sheet_by_index(0)
your_csv_file = open('201301.csv', 'wb')
wr = csv.writer(your_csv_file, quoting=csv.QUOTE_ALL)

for rownum in xrange(1, sh.nrows - 1):
    wr.writerow([unicode(entry).encode("utf-8") for entry in sh.row_values(rownum)])

your_csv_file.close()
#import pandas as pd
#data_xls = pd.read_excel('your_workbook.xls', u'普通漫游', index_col=None)
#data_xls.to_csv('your_csv.csv', encoding='utf-8')