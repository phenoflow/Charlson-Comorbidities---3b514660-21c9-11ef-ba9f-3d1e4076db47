# Alison K Wright, Evangelos Kontopantelis, Richard Emsley, Ian Buchan, Mamas A Mamas, Naveed Sattar, Darren M Ashcroft, Martin M Rutter, 2024.

import sys, csv, re

codes = [{"code":"B64z.00","system":"readv2"},{"code":"ZV10611","system":"readv2"},{"code":"B64..11","system":"readv2"},{"code":"B680.00","system":"readv2"},{"code":"B66..12","system":"readv2"},{"code":"ByuD500","system":"readv2"},{"code":"B640.00","system":"readv2"},{"code":"B672.11","system":"readv2"},{"code":"B64..00","system":"readv2"},{"code":"ZV10600","system":"readv2"},{"code":"B650.00","system":"readv2"},{"code":"B65yz00","system":"readv2"},{"code":"B642.00","system":"readv2"},{"code":"B65z.00","system":"readv2"},{"code":"B652.00","system":"readv2"},{"code":"B66..11","system":"readv2"},{"code":"B65..00","system":"readv2"},{"code":"B64y100","system":"readv2"},{"code":"B64y.00","system":"readv2"},{"code":"B68z.00","system":"readv2"},{"code":"ByuD600","system":"readv2"},{"code":"B64yz00","system":"readv2"},{"code":"B672.00","system":"readv2"},{"code":"B682.00","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('charlson-comorbidities-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["leukaemic-charlson-comorbidities---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["leukaemic-charlson-comorbidities---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["leukaemic-charlson-comorbidities---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
