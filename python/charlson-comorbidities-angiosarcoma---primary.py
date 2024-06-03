# Alison K Wright, Evangelos Kontopantelis, Richard Emsley, Ian Buchan, Mamas A Mamas, Naveed Sattar, Darren M Ashcroft, Martin M Rutter, 2024.

import sys, csv, re

codes = [{"code":"B612.00","system":"readv2"},{"code":"B653100","system":"readv2"},{"code":"B6z0.00","system":"readv2"},{"code":"B592X00","system":"readv2"},{"code":"J622.00","system":"readv2"},{"code":"B05z000","system":"readv2"},{"code":"B31z000","system":"readv2"},{"code":"B612400","system":"readv2"},{"code":"B59zX00","system":"readv2"},{"code":"B1z1000","system":"readv2"},{"code":"B150200","system":"readv2"},{"code":"B33z000","system":"readv2"},{"code":"Byu5300","system":"readv2"},{"code":"B3...12","system":"readv2"},{"code":"B653.00","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('charlson-comorbidities-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["charlson-comorbidities-angiosarcoma---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["charlson-comorbidities-angiosarcoma---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["charlson-comorbidities-angiosarcoma---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
