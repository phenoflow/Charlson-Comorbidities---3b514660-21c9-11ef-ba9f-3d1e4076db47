# Alison K Wright, Evangelos Kontopantelis, Richard Emsley, Ian Buchan, Mamas A Mamas, Naveed Sattar, Darren M Ashcroft, Martin M Rutter, 2024.

import sys, csv, re

codes = [{"code":"Byu8.00","system":"readv2"},{"code":"H43..00","system":"readv2"},{"code":"Byu7.00","system":"readv2"},{"code":"Byu7100","system":"readv2"},{"code":"B48yz00","system":"readv2"},{"code":"B48y200","system":"readv2"},{"code":"B1...11","system":"readv2"},{"code":"B48z.00","system":"readv2"},{"code":"H43z.00","system":"readv2"},{"code":"B4Az.00","system":"readv2"},{"code":"B4Ay.00","system":"readv2"},{"code":"B26..00","system":"readv2"},{"code":"B4...00","system":"readv2"},{"code":"B581.00","system":"readv2"},{"code":"B1...00","system":"readv2"},{"code":"B57y.00","system":"readv2"},{"code":"B45X.00","system":"readv2"},{"code":"Byu1.00","system":"readv2"},{"code":"B573.00","system":"readv2"},{"code":"ZV10412","system":"readv2"},{"code":"N000300","system":"readv2"},{"code":"B4...11","system":"readv2"},{"code":"ZV10500","system":"readv2"},{"code":"B45y.00","system":"readv2"},{"code":"B581z00","system":"readv2"},{"code":"ZV10400","system":"readv2"},{"code":"B4Ay000","system":"readv2"},{"code":"B4y..00","system":"readv2"},{"code":"Byu8000","system":"readv2"},{"code":"B4z..00","system":"readv2"},{"code":"B45z.00","system":"readv2"},{"code":"B48..00","system":"readv2"},{"code":"B48y.00","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('charlson-comorbidities-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["inorganic-charlson-comorbidities---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["inorganic-charlson-comorbidities---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["inorganic-charlson-comorbidities---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
