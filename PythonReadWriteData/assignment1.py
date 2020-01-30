import csv
# just like java
reader = csv.reader(open('data/athlete_events.csv', 'r'), delimiter=",")
# r is open for read , w is open for write  ,rw/r+ for both open and write / a for appand same file
# if use tab intead of , use delimiter="\t"
writer = open('data/Thai.csv','w')
print("Name,Sex,Age,Height,Weight,Team,NOC,Year,Season,City,Sport,Event,Medal")
writer.write("Name,Sex,Age,Height,Weight,Team,NOC,Year,Season,City,Sport,Event,Medal"+"\n")
for row in reader:
    if row[5] == "Thailand" and row[12]!="NA":
        
        print(row[0] + "," + row[1] + ","+ row[2] + ","+ row[3] + ","+ row[4] + ","+ row[5] +
         ","+ row[6] + ","+ row[7] + ","+ row[8] + ","+ row[9] + ","+ row[10] + ","+ row[11] + ","+ row[12])

        writer.write(row[0] + "," + row[1] + ","+ row[2] + ","+ row[3] + ","+ row[4] + ","+ row[5] +
         ","+ row[6] + ","+ row[7] + ","+ row[8] + ","+ row[9] + ","+ row[10] + ","+ row[11] + ","+ row[12]+"\n")


writer.close()