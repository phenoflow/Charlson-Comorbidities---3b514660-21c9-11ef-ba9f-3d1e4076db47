# Alison K Wright, Evangelos Kontopantelis, Richard Emsley, Ian Buchan, Mamas A Mamas, Naveed Sattar, Darren M Ashcroft, Martin M Rutter, 2024.

import sys, csv, re

codes = [{"code":"H460z00","system":"readv2"},{"code":"H313.00","system":"readv2"},{"code":"H311.00","system":"readv2"},{"code":"H312100","system":"readv2"},{"code":"H31..00","system":"readv2"},{"code":"H310000","system":"readv2"},{"code":"H31y.00","system":"readv2"},{"code":"H311100","system":"readv2"},{"code":"H31z.00","system":"readv2"},{"code":"H30..00","system":"readv2"},{"code":"H30z.00","system":"readv2"},{"code":"H31yz00","system":"readv2"},{"code":"H312z00","system":"readv2"},{"code":"H311z00","system":"readv2"},{"code":"H460.00","system":"readv2"},{"code":"H312011","system":"readv2"},{"code":"H312.00","system":"readv2"},{"code":"H310z00","system":"readv2"},{"code":"H312000","system":"readv2"},{"code":"H311000","system":"readv2"},{"code":"H30..11","system":"readv2"},{"code":"H310.00","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('charlson-comorbidities-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["charlson-comorbidities-tracheobronchitis---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["charlson-comorbidities-tracheobronchitis---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["charlson-comorbidities-tracheobronchitis---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
