# Alison K Wright, Evangelos Kontopantelis, Richard Emsley, Ian Buchan, Mamas A Mamas, Naveed Sattar, Darren M Ashcroft, Martin M Rutter, 2024.

import sys, csv, re

codes = [{"code":"B561900","system":"readv2"},{"code":"B542z00","system":"readv2"},{"code":"B54z.00","system":"readv2"},{"code":"B562300","system":"readv2"},{"code":"B561000","system":"readv2"},{"code":"B500.00","system":"readv2"},{"code":"B312z00","system":"readv2"},{"code":"B52W.00","system":"readv2"},{"code":"B563300","system":"readv2"},{"code":"B313z00","system":"readv2"},{"code":"B62z300","system":"readv2"},{"code":"B561300","system":"readv2"},{"code":"B3y..00","system":"readv2"},{"code":"B52..00","system":"readv2"},{"code":"B562400","system":"readv2"},{"code":"B560900","system":"readv2"},{"code":"B62z800","system":"readv2"},{"code":"ZV10000","system":"readv2"},{"code":"B565300","system":"readv2"},{"code":"B564100","system":"readv2"},{"code":"B57z.00","system":"readv2"},{"code":"B3...00","system":"readv2"},{"code":"B563z00","system":"readv2"},{"code":"B564z00","system":"readv2"},{"code":"B563.00","system":"readv2"},{"code":"B316.00","system":"readv2"},{"code":"B560200","system":"readv2"},{"code":"B62z600","system":"readv2"},{"code":"B332z00","system":"readv2"},{"code":"B576.00","system":"readv2"},{"code":"B311.00","system":"readv2"},{"code":"B575z00","system":"readv2"},{"code":"B45..00","system":"readv2"},{"code":"B57..00","system":"readv2"},{"code":"B314z00","system":"readv2"},{"code":"B312200","system":"readv2"},{"code":"B560600","system":"readv2"},{"code":"B312.00","system":"readv2"},{"code":"B56y.00","system":"readv2"},{"code":"B563100","system":"readv2"},{"code":"B31y.00","system":"readv2"},{"code":"B564.00","system":"readv2"},{"code":"B62z000","system":"readv2"},{"code":"B562200","system":"readv2"},{"code":"B24y.00","system":"readv2"},{"code":"B562100","system":"readv2"},{"code":"B201.00","system":"readv2"},{"code":"B314000","system":"readv2"},{"code":"B0z..00","system":"readv2"},{"code":"B574z00","system":"readv2"},{"code":"B562.00","system":"readv2"},{"code":"B560700","system":"readv2"},{"code":"B563000","system":"readv2"},{"code":"B3z..00","system":"readv2"},{"code":"B315z00","system":"readv2"},{"code":"B561100","system":"readv2"},{"code":"B564000","system":"readv2"},{"code":"B560800","system":"readv2"},{"code":"B62z400","system":"readv2"},{"code":"B561200","system":"readv2"},{"code":"B562000","system":"readv2"},{"code":"B565200","system":"readv2"},{"code":"B20y.00","system":"readv2"},{"code":"B576z00","system":"readv2"},{"code":"B560500","system":"readv2"},{"code":"B56z.00","system":"readv2"},{"code":"B2z0.00","system":"readv2"},{"code":"B560000","system":"readv2"},{"code":"Byu1300","system":"readv2"},{"code":"ZV10012","system":"readv2"},{"code":"B565z00","system":"readv2"},{"code":"B201z00","system":"readv2"},{"code":"B54..00","system":"readv2"},{"code":"B312100","system":"readv2"},{"code":"B14y.00","system":"readv2"},{"code":"B561500","system":"readv2"},{"code":"B62z500","system":"readv2"},{"code":"B565.00","system":"readv2"},{"code":"B20..00","system":"readv2"},{"code":"B562z00","system":"readv2"},{"code":"B565000","system":"readv2"},{"code":"B563200","system":"readv2"},{"code":"ByuA300","system":"readv2"},{"code":"B560400","system":"readv2"},{"code":"B4A..00","system":"readv2"},{"code":"B315100","system":"readv2"},{"code":"B1z..00","system":"readv2"},{"code":"ZV10100","system":"readv2"},{"code":"B304z00","system":"readv2"},{"code":"B561400","system":"readv2"},{"code":"ByuDA00","system":"readv2"},{"code":"B524.00","system":"readv2"},{"code":"B311z00","system":"readv2"},{"code":"B25..00","system":"readv2"},{"code":"B312300","system":"readv2"},{"code":"B561800","system":"readv2"},{"code":"A789X00","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('charlson-comorbidities-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["charlson-comorbidities-neoplsm---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["charlson-comorbidities-neoplsm---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["charlson-comorbidities-neoplsm---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
