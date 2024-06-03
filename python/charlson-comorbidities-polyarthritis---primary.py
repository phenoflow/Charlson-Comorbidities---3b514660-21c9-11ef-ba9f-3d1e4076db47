# Alison K Wright, Evangelos Kontopantelis, Richard Emsley, Ian Buchan, Mamas A Mamas, Naveed Sattar, Darren M Ashcroft, Martin M Rutter, 2024.

import sys, csv, re

codes = [{"code":"N040K00","system":"readv2"},{"code":"N040F00","system":"readv2"},{"code":"N040C00","system":"readv2"},{"code":"Nyu1200","system":"readv2"},{"code":"N040600","system":"readv2"},{"code":"N040B00","system":"readv2"},{"code":"N040H00","system":"readv2"},{"code":"F371200","system":"readv2"},{"code":"N040800","system":"readv2"},{"code":"N040900","system":"readv2"},{"code":"N04..00","system":"readv2"},{"code":"N040G00","system":"readv2"},{"code":"N040400","system":"readv2"},{"code":"F396400","system":"readv2"},{"code":"N040J00","system":"readv2"},{"code":"Nyu1000","system":"readv2"},{"code":"N060.11","system":"readv2"},{"code":"N04y012","system":"readv2"},{"code":"N040A00","system":"readv2"},{"code":"N047.00","system":"readv2"},{"code":"N040T00","system":"readv2"},{"code":"N040700","system":"readv2"},{"code":"N04y111","system":"readv2"},{"code":"N040M00","system":"readv2"},{"code":"N04X.00","system":"readv2"},{"code":"N040300","system":"readv2"},{"code":"N040D00","system":"readv2"},{"code":"N040E00","system":"readv2"},{"code":"N040.00","system":"readv2"},{"code":"N040500","system":"readv2"},{"code":"N040200","system":"readv2"},{"code":"Nyu1100","system":"readv2"},{"code":"Nyu1G00","system":"readv2"},{"code":"N040P00","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('charlson-comorbidities-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["charlson-comorbidities-polyarthritis---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["charlson-comorbidities-polyarthritis---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["charlson-comorbidities-polyarthritis---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
