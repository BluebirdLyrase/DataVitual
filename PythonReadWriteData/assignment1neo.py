import csv
# just like java
reader = csv.reader(open('data/athlete_events.csv', 'r'), delimiter=",")
lists = []
lists.append("Name,Sex,Age,Height,Weight,Team,NOC,Year,Season,City,Sport,Event,Medal")
# print("Name,Sex,Age,Height,Weight,Team,NOC,Year,Season,City,Sport,Event,Medal")
for row in reader:
    if row[5] == "Thailand" and row[12]!="NA":
        
        # print(row[0] + "," + row[1] + ","+ row[2] + ","+ row[3] + ","+ row[4] + ","+ row[5] +
        #  ","+ row[6] + ","+ row[7] + ","+ row[8] + ","+ row[9] + ","+ row[10] + ","+ row[11] + ","+ row[12])

        lists.append(row[0] + "," + row[1] + ","+ row[2] + ","+ row[3] + ","+ row[4] + ","+ row[5] +
         ","+ row[6] + ","+ row[7] + ","+ row[8] + ","+ row[9] + ","+ row[10] + ","+ row[11] + ","+ row[12])

writer = open('data/ThaiList.csv','w')

for writeRow in lists:
    print(writeRow)
    writer.write(writeRow+'\n')
writer.close()