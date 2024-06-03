# Alison K Wright, Evangelos Kontopantelis, Richard Emsley, Ian Buchan, Mamas A Mamas, Naveed Sattar, Darren M Ashcroft, Martin M Rutter, 2024.

import sys, csv, re

codes = [{"code":"K05..00","system":"readv2"},{"code":"J614100","system":"readv2"},{"code":"K02y300","system":"readv2"},{"code":"J111111","system":"readv2"},{"code":"J131.00","system":"readv2"},{"code":"K02z.00","system":"readv2"},{"code":"B661.00","system":"readv2"},{"code":"H464000","system":"readv2"},{"code":"J62z.00","system":"readv2"},{"code":"1Z11.00","system":"readv2"},{"code":"1Z12.00","system":"readv2"},{"code":"Kyu2100","system":"readv2"},{"code":"J62y.00","system":"readv2"},{"code":"J111100","system":"readv2"},{"code":"J111200","system":"readv2"},{"code":"J131z00","system":"readv2"},{"code":"J111.00","system":"readv2"},{"code":"B691.00","system":"readv2"},{"code":"J141.00","system":"readv2"},{"code":"H320z00","system":"readv2"},{"code":"J121.00","system":"readv2"},{"code":"J121000","system":"readv2"},{"code":"1Z13.00","system":"readv2"},{"code":"B651.00","system":"readv2"},{"code":"K02..00","system":"readv2"},{"code":"J131000","system":"readv2"},{"code":"J131200","system":"readv2"},{"code":"K02..12","system":"readv2"},{"code":"K02yz00","system":"readv2"},{"code":"B641.11","system":"readv2"},{"code":"J131400","system":"readv2"},{"code":"J61..00","system":"readv2"},{"code":"B681.00","system":"readv2"},{"code":"J121111","system":"readv2"},{"code":"B651.11","system":"readv2"},{"code":"J111211","system":"readv2"},{"code":"B651200","system":"readv2"},{"code":"G580100","system":"readv2"},{"code":"K02y000","system":"readv2"},{"code":"H3z..11","system":"readv2"},{"code":"J121300","system":"readv2"},{"code":"J131100","system":"readv2"},{"code":"B651000","system":"readv2"},{"code":"J111400","system":"readv2"},{"code":"B671.00","system":"readv2"},{"code":"1Z14.00","system":"readv2"},{"code":"J111z00","system":"readv2"},{"code":"J121400","system":"readv2"},{"code":"1Z10.00","system":"readv2"},{"code":"J111300","system":"readv2"},{"code":"J614.00","system":"readv2"},{"code":"J614z00","system":"readv2"},{"code":"J111000","system":"readv2"},{"code":"B651z00","system":"readv2"},{"code":"H320.00","system":"readv2"},{"code":"J121z00","system":"readv2"},{"code":"B641.00","system":"readv2"},{"code":"J617000","system":"readv2"},{"code":"J614200","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('charlson-comorbidities-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["charlson-comorbidities-chron---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["charlson-comorbidities-chron---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["charlson-comorbidities-chron---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
