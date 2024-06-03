# Alison K Wright, Evangelos Kontopantelis, Richard Emsley, Ian Buchan, Mamas A Mamas, Naveed Sattar, Darren M Ashcroft, Martin M Rutter, 2024.

import sys, csv, re

codes = [{"code":"J110.00","system":"readv2"},{"code":"G582.00","system":"readv2"},{"code":"J110100","system":"readv2"},{"code":"J140200","system":"readv2"},{"code":"J110300","system":"readv2"},{"code":"J120000","system":"readv2"},{"code":"H32y000","system":"readv2"},{"code":"J110200","system":"readv2"},{"code":"B674.00","system":"readv2"},{"code":"J140z00","system":"readv2"},{"code":"J110000","system":"readv2"},{"code":"J120300","system":"readv2"},{"code":"J140100","system":"readv2"},{"code":"J120200","system":"readv2"},{"code":"J140.00","system":"readv2"},{"code":"J110z00","system":"readv2"},{"code":"J120100","system":"readv2"},{"code":"J120z00","system":"readv2"},{"code":"J130z00","system":"readv2"},{"code":"J140300","system":"readv2"},{"code":"J130200","system":"readv2"},{"code":"J130.00","system":"readv2"},{"code":"J130100","system":"readv2"},{"code":"J130000","system":"readv2"},{"code":"J110111","system":"readv2"},{"code":"J120.00","system":"readv2"},{"code":"J130300","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('charlson-comorbidities-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["charlson-comorbidities-subacute---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["charlson-comorbidities-subacute---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["charlson-comorbidities-subacute---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
