import csv
# just like java
reader = csv.reader(open('data/wunder-data.txt', 'r'), delimiter=",")
# r is open for read , w is open for write  ,rw/r+ for both open and write / a for appand same file
# if use tab intead of , use delimiter="\t"
for row in reader:
    if int(row[1]) <= 32:
        is_freezing = '1'
    else:
        is_freezing = '0'
    print(row[0] + "," + row[1] + "," + is_freezing)