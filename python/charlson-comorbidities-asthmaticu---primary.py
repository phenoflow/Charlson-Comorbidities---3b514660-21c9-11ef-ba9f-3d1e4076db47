# Alison K Wright, Evangelos Kontopantelis, Richard Emsley, Ian Buchan, Mamas A Mamas, Naveed Sattar, Darren M Ashcroft, Martin M Rutter, 2024.

import sys, csv, re

codes = [{"code":"173A.00","system":"readv2"},{"code":"H330.12","system":"readv2"},{"code":"H33z200","system":"readv2"},{"code":"H331000","system":"readv2"},{"code":"1780","system":"readv2"},{"code":"H330z00","system":"readv2"},{"code":"H330.14","system":"readv2"},{"code":"H33..00","system":"readv2"},{"code":"H330000","system":"readv2"},{"code":"663v.00","system":"readv2"},{"code":"663q.00","system":"readv2"},{"code":"663V200","system":"readv2"},{"code":"H33zz11","system":"readv2"},{"code":"H331z00","system":"readv2"},{"code":"663P.00","system":"readv2"},{"code":"663u.00","system":"readv2"},{"code":"H334.00","system":"readv2"},{"code":"9OJA.11","system":"readv2"},{"code":"H35y700","system":"readv2"},{"code":"H331.00","system":"readv2"},{"code":"663V000","system":"readv2"},{"code":"H330.00","system":"readv2"},{"code":"H331100","system":"readv2"},{"code":"H33z000","system":"readv2"},{"code":"H333.00","system":"readv2"},{"code":"663V100","system":"readv2"},{"code":"9OJ1.00","system":"readv2"},{"code":"663p.00","system":"readv2"},{"code":"663w.00","system":"readv2"},{"code":"H47y000","system":"readv2"},{"code":"173c.00","system":"readv2"},{"code":"14B4.00","system":"readv2"},{"code":"663W.00","system":"readv2"},{"code":"H332.00","system":"readv2"},{"code":"663h.00","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('charlson-comorbidities-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["charlson-comorbidities-asthmaticu---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["charlson-comorbidities-asthmaticu---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["charlson-comorbidities-asthmaticu---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
