# Alison K Wright, Evangelos Kontopantelis, Richard Emsley, Ian Buchan, Mamas A Mamas, Naveed Sattar, Darren M Ashcroft, Martin M Rutter, 2024.

import sys, csv, re

codes = [{"code":"B560z00","system":"readv2"},{"code":"B614100","system":"readv2"},{"code":"B550.00","system":"readv2"},{"code":"B602100","system":"readv2"},{"code":"B170.00","system":"readv2"},{"code":"B600100","system":"readv2"},{"code":"B620100","system":"readv2"},{"code":"B62y100","system":"readv2"},{"code":"B615100","system":"readv2"},{"code":"B550000","system":"readv2"},{"code":"B582000","system":"readv2"},{"code":"B310000","system":"readv2"},{"code":"B62z100","system":"readv2"},{"code":"B61z100","system":"readv2"},{"code":"B611100","system":"readv2"},{"code":"B524000","system":"readv2"},{"code":"B310z00","system":"readv2"},{"code":"B550z00","system":"readv2"},{"code":"B623100","system":"readv2"},{"code":"B323300","system":"readv2"},{"code":"B333300","system":"readv2"},{"code":"B610100","system":"readv2"},{"code":"B310.00","system":"readv2"},{"code":"B601100","system":"readv2"},{"code":"B613100","system":"readv2"},{"code":"B560.00","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('charlson-comorbidities-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["charlson-comorbidities-forehead---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["charlson-comorbidities-forehead---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["charlson-comorbidities-forehead---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
