cwlVersion: v1.0
steps:
  read-potential-cases-fhir:
    run: read-potential-cases-fhir.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  charlson-comorbidities-articulr---primary:
    run: charlson-comorbidities-articulr---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-fhir/output
  charlson-comorbidities-subacute---primary:
    run: charlson-comorbidities-subacute---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-articulr---primary/output
  intestinal-charlson-comorbidities---primary:
    run: intestinal-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-subacute---primary/output
  charlson-comorbidities-depletion---primary:
    run: charlson-comorbidities-depletion---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: intestinal-charlson-comorbidities---primary/output
  charlson-comorbidities-sleep---primary:
    run: charlson-comorbidities-sleep---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-depletion---primary/output
  charlson-comorbidities-neopl---primary:
    run: charlson-comorbidities-neopl---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-sleep---primary/output
  charlson-comorbidities-unspecif---primary:
    run: charlson-comorbidities-unspecif---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-neopl---primary/output
  charlson-comorbidities-spleen---primary:
    run: charlson-comorbidities-spleen---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-unspecif---primary/output
  charlson-comorbidities-erythraemia---primary:
    run: charlson-comorbidities-erythraemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-spleen---primary/output
  charlson---primary:
    run: charlson---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-erythraemia---primary/output
  charlson-comorbidities-chron---primary:
    run: charlson-comorbidities-chron---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: charlson---primary/output
  myelomonocytic-charlson-comorbidities---primary:
    run: myelomonocytic-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-chron---primary/output
  charlson-comorbidities-tumour---primary:
    run: charlson-comorbidities-tumour---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: myelomonocytic-charlson-comorbidities---primary/output
  tonsillar-charlson-comorbidities---primary:
    run: tonsillar-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-tumour---primary/output
  charlson-comorbidities-vagina---primary:
    run: charlson-comorbidities-vagina---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: tonsillar-charlson-comorbidities---primary/output
  charlson-comorbidities-limbunspfd---primary:
    run: charlson-comorbidities-limbunspfd---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-vagina---primary/output
  charlson-comorbidities-trunkunspecified---primary:
    run: charlson-comorbidities-trunkunspecified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule18
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-limbunspfd---primary/output
  charlson-comorbidities-neoplsm---primary:
    run: charlson-comorbidities-neoplsm---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule19
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-trunkunspecified---primary/output
  systemic-charlson-comorbidities---primary:
    run: systemic-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule20
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-neoplsm---primary/output
  central-charlson-comorbidities---primary:
    run: central-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule21
      potentialCases:
        id: potentialCases
        source: systemic-charlson-comorbidities---primary/output
  charlson-comorbidities-abdoman---primary:
    run: charlson-comorbidities-abdoman---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule22
      potentialCases:
        id: potentialCases
        source: central-charlson-comorbidities---primary/output
  charlson-comorbidities-angiosarcoma---primary:
    run: charlson-comorbidities-angiosarcoma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule23
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-abdoman---primary/output
  charlson-comorbidities-cheek---primary:
    run: charlson-comorbidities-cheek---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule24
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-angiosarcoma---primary/output
  charlson-comorbidities-orbit---primary:
    run: charlson-comorbidities-orbit---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule25
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-cheek---primary/output
  charlson-comorbidities-bagassosis---primary:
    run: charlson-comorbidities-bagassosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule26
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-orbit---primary/output
  popliteal-charlson-comorbidities---primary:
    run: popliteal-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule27
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-bagassosis---primary/output
  charlson-comorbidities-cancer---primary:
    run: charlson-comorbidities-cancer---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule28
      potentialCases:
        id: potentialCases
        source: popliteal-charlson-comorbidities---primary/output
  abdominal-charlson-comorbidities---primary:
    run: abdominal-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule29
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-cancer---primary/output
  charlson-comorbidities-endocervix---primary:
    run: charlson-comorbidities-endocervix---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule30
      potentialCases:
        id: potentialCases
        source: abdominal-charlson-comorbidities---primary/output
  charlson-comorbidities-diffuse---primary:
    run: charlson-comorbidities-diffuse---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule31
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-endocervix---primary/output
  charlson-comorbidities-immunodeficiency---primary:
    run: charlson-comorbidities-immunodeficiency---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule32
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-diffuse---primary/output
  short-charlson-comorbidities---primary:
    run: short-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule33
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-immunodeficiency---primary/output
  charlson-comorbidities-reticuloendotheliosis---primary:
    run: charlson-comorbidities-reticuloendotheliosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule34
      potentialCases:
        id: potentialCases
        source: short-charlson-comorbidities---primary/output
  charlson-comorbidities-forearm---primary:
    run: charlson-comorbidities-forearm---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule35
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-reticuloendotheliosis---primary/output
  charlson-comorbidities-bcell---primary:
    run: charlson-comorbidities-bcell---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule36
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-forearm---primary/output
  pancreatic-charlson-comorbidities---primary:
    run: pancreatic-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule37
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-bcell---primary/output
  charlson-comorbidities-forehead---primary:
    run: charlson-comorbidities-forehead---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule38
      potentialCases:
        id: potentialCases
        source: pancreatic-charlson-comorbidities---primary/output
  charlson-comorbidities-sclerosis---primary:
    run: charlson-comorbidities-sclerosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule39
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-forehead---primary/output
  charlson-comorbidities-osteodystrophy---primary:
    run: charlson-comorbidities-osteodystrophy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule40
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-sclerosis---primary/output
  congestive-charlson-comorbidities---primary:
    run: congestive-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule41
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-osteodystrophy---primary/output
  rheumatoid-charlson-comorbidities---primary:
    run: rheumatoid-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule42
      potentialCases:
        id: potentialCases
        source: congestive-charlson-comorbidities---primary/output
  charlson-comorbidities-asthmaticu---primary:
    run: charlson-comorbidities-asthmaticu---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule43
      potentialCases:
        id: potentialCases
        source: rheumatoid-charlson-comorbidities---primary/output
  charlson-comorbidities-respiratory---primary:
    run: charlson-comorbidities-respiratory---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule44
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-asthmaticu---primary/output
  charlson-comorbidities-polyarthritis---primary:
    run: charlson-comorbidities-polyarthritis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule45
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-respiratory---primary/output
  charlson-comorbidities-lymphoma---primary:
    run: charlson-comorbidities-lymphoma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule46
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-polyarthritis---primary/output
  charlson-comorbidities-pneumoconiosis---primary:
    run: charlson-comorbidities-pneumoconiosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule47
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-lymphoma---primary/output
  charlson-comorbidities-multi---primary:
    run: charlson-comorbidities-multi---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule48
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-pneumoconiosis---primary/output
  charlson-comorbidities-majora---primary:
    run: charlson-comorbidities-majora---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule49
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-multi---primary/output
  pituitary-charlson-comorbidities---primary:
    run: pituitary-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule50
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-majora---primary/output
  charlson-comorbidities-cortex---primary:
    run: charlson-comorbidities-cortex---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule51
      potentialCases:
        id: potentialCases
        source: pituitary-charlson-comorbidities---primary/output
  charlson-comorbidities-lipstick---primary:
    run: charlson-comorbidities-lipstick---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule52
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-cortex---primary/output
  primary-charlson-comorbidities---primary:
    run: primary-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule53
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-lipstick---primary/output
  lymphatic-charlson-comorbidities---primary:
    run: lymphatic-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule54
      potentialCases:
        id: potentialCases
        source: primary-charlson-comorbidities---primary/output
  charlson-comorbidities-canthu---primary:
    run: charlson-comorbidities-canthu---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule55
      potentialCases:
        id: potentialCases
        source: lymphatic-charlson-comorbidities---primary/output
  charlson-comorbidities-silica---primary:
    run: charlson-comorbidities-silica---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule56
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-canthu---primary/output
  charlson-comorbidities---primary:
    run: charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule57
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-silica---primary/output
  congenital-charlson-comorbidities---primary:
    run: congenital-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule58
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities---primary/output
  charlson-comorbidities-phalange---primary:
    run: charlson-comorbidities-phalange---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule59
      potentialCases:
        id: potentialCases
        source: congenital-charlson-comorbidities---primary/output
  occipital-charlson-comorbidities---primary:
    run: occipital-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule60
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-phalange---primary/output
  birdfancier-charlson-comorbidities---primary:
    run: birdfancier-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule61
      potentialCases:
        id: potentialCases
        source: occipital-charlson-comorbidities---primary/output
  charlson-comorbidities-lymphosarcoma---primary:
    run: charlson-comorbidities-lymphosarcoma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule62
      potentialCases:
        id: potentialCases
        source: birdfancier-charlson-comorbidities---primary/output
  pharyngeal-charlson-comorbidities---primary:
    run: pharyngeal-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule63
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-lymphosarcoma---primary/output
  charlson-comorbidities-unspcf---primary:
    run: charlson-comorbidities-unspcf---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule64
      potentialCases:
        id: potentialCases
        source: pharyngeal-charlson-comorbidities---primary/output
  charlson-comorbidities-function---primary:
    run: charlson-comorbidities-function---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule65
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-unspcf---primary/output
  charlson-comorbidities-greater---primary:
    run: charlson-comorbidities-greater---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule66
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-function---primary/output
  charlson-comorbidities-melanoma---primary:
    run: charlson-comorbidities-melanoma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule67
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-greater---primary/output
  charlson-comorbidities-tracheobronchitis---primary:
    run: charlson-comorbidities-tracheobronchitis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule68
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-melanoma---primary/output
  charlson-comorbidities-paraplegia---primary:
    run: charlson-comorbidities-paraplegia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule69
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-tracheobronchitis---primary/output
  charlson-comorbidities-induced---primary:
    run: charlson-comorbidities-induced---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule70
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-paraplegia---primary/output
  charlson-comorbidities-operation---primary:
    run: charlson-comorbidities-operation---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule71
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-induced---primary/output
  charlson-comorbidities-isthmu---primary:
    run: charlson-comorbidities-isthmu---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule72
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-operation---primary/output
  gastrointestinal-charlson-comorbidities---primary:
    run: gastrointestinal-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule73
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-isthmu---primary/output
  charlson-comorbidities-cardia---primary:
    run: charlson-comorbidities-cardia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule74
      potentialCases:
        id: potentialCases
        source: gastrointestinal-charlson-comorbidities---primary/output
  charlson-comorbidities-uncomplicated---primary:
    run: charlson-comorbidities-uncomplicated---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule75
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-cardia---primary/output
  charlson-comorbidities-flexure---primary:
    run: charlson-comorbidities-flexure---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule76
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-uncomplicated---primary/output
  pillar-charlson-comorbidities---primary:
    run: pillar-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule77
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-flexure---primary/output
  charlson-comorbidities-letterersiwe---primary:
    run: charlson-comorbidities-letterersiwe---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule78
      potentialCases:
        id: potentialCases
        source: pillar-charlson-comorbidities---primary/output
  charlson-comorbidities-disseminated---primary:
    run: charlson-comorbidities-disseminated---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule79
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-letterersiwe---primary/output
  haematopoietic-charlson-comorbidities---primary:
    run: haematopoietic-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule80
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-disseminated---primary/output
  charlson-comorbidities-alveolitis---primary:
    run: charlson-comorbidities-alveolitis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule81
      potentialCases:
        id: potentialCases
        source: haematopoietic-charlson-comorbidities---primary/output
  charlson-comorbidities-abnormsnec---primary:
    run: charlson-comorbidities-abnormsnec---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule82
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-alveolitis---primary/output
  charlson-comorbidities-siderosis---primary:
    run: charlson-comorbidities-siderosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule83
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-abnormsnec---primary/output
  charlson-comorbidities-perineum---primary:
    run: charlson-comorbidities-perineum---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule84
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-siderosis---primary/output
  leukaemic-charlson-comorbidities---primary:
    run: leukaemic-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule85
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-perineum---primary/output
  charlson-comorbidities-mesothelioma---primary:
    run: charlson-comorbidities-mesothelioma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule86
      potentialCases:
        id: potentialCases
        source: leukaemic-charlson-comorbidities---primary/output
  charlson-comorbidities-cornea---primary:
    run: charlson-comorbidities-cornea---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule87
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-mesothelioma---primary/output
  adrenal-charlson-comorbidities---primary:
    run: adrenal-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule88
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-cornea---primary/output
  charlson-comorbidities-atrophy---primary:
    run: charlson-comorbidities-atrophy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule89
      potentialCases:
        id: potentialCases
        source: adrenal-charlson-comorbidities---primary/output
  charlson-comorbidities-carcinoma---primary:
    run: charlson-comorbidities-carcinoma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule90
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-atrophy---primary/output
  charlson-comorbidities-biliary---primary:
    run: charlson-comorbidities-biliary---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule91
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-carcinoma---primary/output
  charlson-comorbidities-fibrositis---primary:
    run: charlson-comorbidities-fibrositis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule92
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-biliary---primary/output
  portal-charlson-comorbidities---primary:
    run: portal-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule93
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-fibrositis---primary/output
  charlson-comorbidities-predominance---primary:
    run: charlson-comorbidities-predominance---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule94
      potentialCases:
        id: potentialCases
        source: portal-charlson-comorbidities---primary/output
  cutaneous-charlson-comorbidities---primary:
    run: cutaneous-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule95
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-predominance---primary/output
  ventricular-charlson-comorbidities---primary:
    run: ventricular-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule96
      potentialCases:
        id: potentialCases
        source: cutaneous-charlson-comorbidities---primary/output
  subcortical-charlson-comorbidities---primary:
    run: subcortical-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule97
      potentialCases:
        id: potentialCases
        source: ventricular-charlson-comorbidities---primary/output
  charlson-comorbidities-membranoprolif---primary:
    run: charlson-comorbidities-membranoprolif---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule98
      potentialCases:
        id: potentialCases
        source: subcortical-charlson-comorbidities---primary/output
  recurrent-charlson-comorbidities---primary:
    run: recurrent-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule99
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-membranoprolif---primary/output
  charlson-comorbidities-cannabinosis---primary:
    run: charlson-comorbidities-cannabinosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule100
      potentialCases:
        id: potentialCases
        source: recurrent-charlson-comorbidities---primary/output
  immunoproliferative-charlson-comorbidities---primary:
    run: immunoproliferative-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule101
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-cannabinosis---primary/output
  gastric-charlson-comorbidities---primary:
    run: gastric-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule102
      potentialCases:
        id: potentialCases
        source: immunoproliferative-charlson-comorbidities---primary/output
  charlson-comorbidities-result---primary:
    run: charlson-comorbidities-result---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule103
      potentialCases:
        id: potentialCases
        source: gastric-charlson-comorbidities---primary/output
  charlson-comorbidities-meatus---primary:
    run: charlson-comorbidities-meatus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule104
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-result---primary/output
  charlson-comorbidities-bronchiectasis---primary:
    run: charlson-comorbidities-bronchiectasis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule105
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-meatus---primary/output
  charlson-comorbidities-sulcu---primary:
    run: charlson-comorbidities-sulcu---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule106
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-bronchiectasis---primary/output
  charlson-comorbidities-quadrant---primary:
    run: charlson-comorbidities-quadrant---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule107
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-sulcu---primary/output
  charlson-comorbidities-complication---primary:
    run: charlson-comorbidities-complication---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule108
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-quadrant---primary/output
  frontal-charlson-comorbidities---primary:
    run: frontal-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule109
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-complication---primary/output
  charlson-comorbidities-erythematosus---primary:
    run: charlson-comorbidities-erythematosus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule110
      potentialCases:
        id: potentialCases
        source: frontal-charlson-comorbidities---primary/output
  thyroid-charlson-comorbidities---primary:
    run: thyroid-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule111
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-erythematosus---primary/output
  right-charlson-comorbidities---primary:
    run: right-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule112
      potentialCases:
        id: potentialCases
        source: thyroid-charlson-comorbidities---primary/output
  charlson-comorbidities-epididymi---primary:
    run: charlson-comorbidities-epididymi---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule113
      potentialCases:
        id: potentialCases
        source: right-charlson-comorbidities---primary/output
  charlson-comorbidities-emphysema---primary:
    run: charlson-comorbidities-emphysema---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule114
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-epididymi---primary/output
  vertebral-charlson-comorbidities---primary:
    run: vertebral-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule115
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-emphysema---primary/output
  inorganic-charlson-comorbidities---primary:
    run: inorganic-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule116
      potentialCases:
        id: potentialCases
        source: vertebral-charlson-comorbidities---primary/output
  thoracic-charlson-comorbidities---primary:
    run: thoracic-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule117
      potentialCases:
        id: potentialCases
        source: inorganic-charlson-comorbidities---primary/output
  axillary-charlson-comorbidities---primary:
    run: axillary-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule118
      potentialCases:
        id: potentialCases
        source: thoracic-charlson-comorbidities---primary/output
  charlson-comorbidities-never---primary:
    run: charlson-comorbidities-never---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule119
      potentialCases:
        id: potentialCases
        source: axillary-charlson-comorbidities---primary/output
  charlson-comorbidities-third---primary:
    run: charlson-comorbidities-third---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule120
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-never---primary/output
  genitourinary-charlson-comorbidities---primary:
    run: genitourinary-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule121
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-third---primary/output
  charlson-comorbidities-dementiaalzheimer---primary:
    run: charlson-comorbidities-dementiaalzheimer---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule122
      potentialCases:
        id: potentialCases
        source: genitourinary-charlson-comorbidities---primary/output
  charlson-comorbidities-areola---primary:
    run: charlson-comorbidities-areola---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule123
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-dementiaalzheimer---primary/output
  nonarticular-charlson-comorbidities---primary:
    run: nonarticular-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule124
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-areola---primary/output
  choroid-charlson-comorbidities---primary:
    run: choroid-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule125
      potentialCases:
        id: potentialCases
        source: nonarticular-charlson-comorbidities---primary/output
  mediastinal-charlson-comorbidities---primary:
    run: mediastinal-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule126
      potentialCases:
        id: potentialCases
        source: choroid-charlson-comorbidities---primary/output
  charlson-comorbidities-carpal---primary:
    run: charlson-comorbidities-carpal---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule127
      potentialCases:
        id: potentialCases
        source: mediastinal-charlson-comorbidities---primary/output
  pelvic-charlson-comorbidities---primary:
    run: pelvic-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule128
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-carpal---primary/output
  charlson-comorbidities-burkitt---primary:
    run: charlson-comorbidities-burkitt---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule129
      potentialCases:
        id: potentialCases
        source: pelvic-charlson-comorbidities---primary/output
  charlson-comorbidities-libmansacks---primary:
    run: charlson-comorbidities-libmansacks---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule130
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-burkitt---primary/output
  rectosigmoid-charlson-comorbidities---primary:
    run: rectosigmoid-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule131
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-libmansacks---primary/output
  charlson-comorbidities-shoulder---primary:
    run: charlson-comorbidities-shoulder---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule132
      potentialCases:
        id: potentialCases
        source: rectosigmoid-charlson-comorbidities---primary/output
  charlson-comorbidities-including---primary:
    run: charlson-comorbidities-including---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule133
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-shoulder---primary/output
  charlson-comorbidities-bleeding---primary:
    run: charlson-comorbidities-bleeding---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule134
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-including---primary/output
  endocervical-charlson-comorbidities---primary:
    run: endocervical-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule135
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-bleeding---primary/output
  charlson-comorbidities-month---primary:
    run: charlson-comorbidities-month---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule136
      potentialCases:
        id: potentialCases
        source: endocervical-charlson-comorbidities---primary/output
  perianal-charlson-comorbidities---primary:
    run: perianal-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule137
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-month---primary/output
  spastic-charlson-comorbidities---primary:
    run: spastic-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule138
      potentialCases:
        id: potentialCases
        source: perianal-charlson-comorbidities---primary/output
  charlson-comorbidities-frenulum---primary:
    run: charlson-comorbidities-frenulum---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule139
      potentialCases:
        id: potentialCases
        source: spastic-charlson-comorbidities---primary/output
  charlson-comorbidities-gallbladder---primary:
    run: charlson-comorbidities-gallbladder---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule140
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-frenulum---primary/output
  pyloric-charlson-comorbidities---primary:
    run: pyloric-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule141
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-gallbladder---primary/output
  charlson-comorbidities-medulla---primary:
    run: charlson-comorbidities-medulla---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule142
      potentialCases:
        id: potentialCases
        source: pyloric-charlson-comorbidities---primary/output
  charlson-comorbidities-presenile---primary:
    run: charlson-comorbidities-presenile---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule143
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-medulla---primary/output
  charlson-comorbidities-eyeball---primary:
    run: charlson-comorbidities-eyeball---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule144
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-presenile---primary/output
  mucopurulent-charlson-comorbidities---primary:
    run: mucopurulent-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule145
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-eyeball---primary/output
  charlson-comorbidities-epiglotti---primary:
    run: charlson-comorbidities-epiglotti---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule146
      potentialCases:
        id: potentialCases
        source: mucopurulent-charlson-comorbidities---primary/output
  extrinsic-charlson-comorbidities---primary:
    run: extrinsic-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule147
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-epiglotti---primary/output
  charlson-comorbidities-osteoma---primary:
    run: charlson-comorbidities-osteoma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule148
      potentialCases:
        id: potentialCases
        source: extrinsic-charlson-comorbidities---primary/output
  ectopic-charlson-comorbidities---primary:
    run: ectopic-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule149
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-osteoma---primary/output
  female-charlson-comorbidities---primary:
    run: female-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule150
      potentialCases:
        id: potentialCases
        source: ectopic-charlson-comorbidities---primary/output
  obstructive-charlson-comorbidities---primary:
    run: obstructive-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule151
      potentialCases:
        id: potentialCases
        source: female-charlson-comorbidities---primary/output
  charlson-comorbidities-chloroma---primary:
    run: charlson-comorbidities-chloroma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule152
      potentialCases:
        id: potentialCases
        source: obstructive-charlson-comorbidities---primary/output
  junctional-charlson-comorbidities---primary:
    run: junctional-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule153
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-chloroma---primary/output
  charlson-comorbidities-nonhodgkin---primary:
    run: charlson-comorbidities-nonhodgkin---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule154
      potentialCases:
        id: potentialCases
        source: junctional-charlson-comorbidities---primary/output
  unknown-charlson-comorbidities---primary:
    run: unknown-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule155
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-nonhodgkin---primary/output
  charlson-comorbidities-restricts---primary:
    run: charlson-comorbidities-restricts---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule156
      potentialCases:
        id: potentialCases
        source: unknown-charlson-comorbidities---primary/output
  charlson-comorbidities-pylorus---primary:
    run: charlson-comorbidities-pylorus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule157
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-restricts---primary/output
  extrahepatic-charlson-comorbidities---primary:
    run: extrahepatic-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule158
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-pylorus---primary/output
  nephritic-charlson-comorbidities---primary:
    run: nephritic-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule159
      potentialCases:
        id: potentialCases
        source: extrahepatic-charlson-comorbidities---primary/output
  charlson-comorbidities-caecum---primary:
    run: charlson-comorbidities-caecum---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule160
      potentialCases:
        id: potentialCases
        source: nephritic-charlson-comorbidities---primary/output
  charlson-comorbidities-larynx---primary:
    run: charlson-comorbidities-larynx---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule161
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-caecum---primary/output
  coccygeal-charlson-comorbidities---primary:
    run: coccygeal-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule162
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-larynx---primary/output
  charlson-comorbidities-night---primary:
    run: charlson-comorbidities-night---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule163
      potentialCases:
        id: potentialCases
        source: coccygeal-charlson-comorbidities---primary/output
  charlson-comorbidities-column---primary:
    run: charlson-comorbidities-column---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule164
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-night---primary/output
  charlson-comorbidities-heart---primary:
    run: charlson-comorbidities-heart---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule165
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-column---primary/output
  charlson-comorbidities-polymyositis---primary:
    run: charlson-comorbidities-polymyositis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule166
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-heart---primary/output
  charlson-comorbidities-finger---primary:
    run: charlson-comorbidities-finger---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule167
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-polymyositis---primary/output
  charlson-comorbidities-vestibule---primary:
    run: charlson-comorbidities-vestibule---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule168
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-finger---primary/output
  buccal-charlson-comorbidities---primary:
    run: buccal-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule169
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-vestibule---primary/output
  charlson-comorbidities-felty's---primary:
    run: charlson-comorbidities-felty's---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule170
      potentialCases:
        id: potentialCases
        source: buccal-charlson-comorbidities---primary/output
  alcoholic-charlson-comorbidities---primary:
    run: alcoholic-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule171
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-felty's---primary/output
  gastrojejunal-charlson-comorbidities---primary:
    run: gastrojejunal-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule172
      potentialCases:
        id: potentialCases
        source: alcoholic-charlson-comorbidities---primary/output
  charlson-comorbidities-acquired---primary:
    run: charlson-comorbidities-acquired---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule173
      potentialCases:
        id: potentialCases
        source: gastrojejunal-charlson-comorbidities---primary/output
  external-charlson-comorbidities---primary:
    run: external-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule174
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-acquired---primary/output
  charlson-comorbidities-thigh---primary:
    run: charlson-comorbidities-thigh---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule175
      potentialCases:
        id: potentialCases
        source: external-charlson-comorbidities---primary/output
  charlson-comorbidities-attack---primary:
    run: charlson-comorbidities-attack---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule176
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-thigh---primary/output
  charlson-comorbidities-metastas---primary:
    run: charlson-comorbidities-metastas---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule177
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-attack---primary/output
  tympanic-charlson-comorbidities---primary:
    run: tympanic-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule178
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-metastas---primary/output
  temporal-charlson-comorbidities---primary:
    run: temporal-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule179
      potentialCases:
        id: potentialCases
        source: tympanic-charlson-comorbidities---primary/output
  charlson-comorbidities-scalp---primary:
    run: charlson-comorbidities-scalp---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule180
      potentialCases:
        id: potentialCases
        source: temporal-charlson-comorbidities---primary/output
  charlson-comorbidities-ulcer---primary:
    run: charlson-comorbidities-ulcer---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule181
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-scalp---primary/output
  charlson-comorbidities-myeloma---primary:
    run: charlson-comorbidities-myeloma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule182
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-ulcer---primary/output
  charlson-comorbidities-reticulosarcoma---primary:
    run: charlson-comorbidities-reticulosarcoma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule183
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-myeloma---primary/output
  duodenal-charlson-comorbidities---primary:
    run: duodenal-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule184
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-reticulosarcoma---primary/output
  charlson-comorbidities-dementium---primary:
    run: charlson-comorbidities-dementium---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule185
      potentialCases:
        id: potentialCases
        source: duodenal-charlson-comorbidities---primary/output
  nodular-charlson-comorbidities---primary:
    run: nodular-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule186
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-dementium---primary/output
  eyelid-charlson-comorbidities---primary:
    run: eyelid-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule187
      potentialCases:
        id: potentialCases
        source: nodular-charlson-comorbidities---primary/output
  charlson-comorbidities-worker---primary:
    run: charlson-comorbidities-worker---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule188
      potentialCases:
        id: potentialCases
        source: eyelid-charlson-comorbidities---primary/output
  charlson-comorbidities-buttock---primary:
    run: charlson-comorbidities-buttock---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule189
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-worker---primary/output
  charlson-comorbidities-classified---primary:
    run: charlson-comorbidities-classified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule190
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-buttock---primary/output
  charlson-comorbidities-spine---primary:
    run: charlson-comorbidities-spine---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule191
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-classified---primary/output
  sacral-charlson-comorbidities---primary:
    run: sacral-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule192
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-spine---primary/output
  charlson-comorbidities-malignant---primary:
    run: charlson-comorbidities-malignant---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule193
      potentialCases:
        id: potentialCases
        source: sacral-charlson-comorbidities---primary/output
  charlson-comorbidities-uterus---primary:
    run: charlson-comorbidities-uterus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule194
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-malignant---primary/output
  charlson-comorbidities-flaccid---primary:
    run: charlson-comorbidities-flaccid---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule195
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-uterus---primary/output
  charlson-comorbidities-paraganglia---primary:
    run: charlson-comorbidities-paraganglia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule196
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-flaccid---primary/output
  charlson-comorbidities-scrotum---primary:
    run: charlson-comorbidities-scrotum---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule197
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-paraganglia---primary/output
  follicular-charlson-comorbidities---primary:
    run: follicular-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule198
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-scrotum---primary/output
  charlson-comorbidities-hemiplegia---primary:
    run: charlson-comorbidities-hemiplegia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule199
      potentialCases:
        id: potentialCases
        source: follicular-charlson-comorbidities---primary/output
  charlson-comorbidities-oesophagu---primary:
    run: charlson-comorbidities-oesophagu---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule200
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-hemiplegia---primary/output
  charlson-comorbidities-rheumatism---primary:
    run: charlson-comorbidities-rheumatism---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule201
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-oesophagu---primary/output
  tracheobronchial-charlson-comorbidities---primary:
    run: tracheobronchial-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule202
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-rheumatism---primary/output
  charlson-comorbidities-fundu---primary:
    run: charlson-comorbidities-fundu---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule203
      potentialCases:
        id: potentialCases
        source: tracheobronchial-charlson-comorbidities---primary/output
  charlson-comorbidities-conjunctiva---primary:
    run: charlson-comorbidities-conjunctiva---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule204
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-fundu---primary/output
  giant-charlson-comorbidities---primary:
    run: giant-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule205
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-conjunctiva---primary/output
  nephrotic-charlson-comorbidities---primary:
    run: nephrotic-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule206
      potentialCases:
        id: potentialCases
        source: giant-charlson-comorbidities---primary/output
  persistent-charlson-comorbidities---primary:
    run: persistent-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule207
      potentialCases:
        id: potentialCases
        source: nephrotic-charlson-comorbidities---primary/output
  charlson-comorbidities-breast---primary:
    run: charlson-comorbidities-breast---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule208
      potentialCases:
        id: potentialCases
        source: persistent-charlson-comorbidities---primary/output
  submandibular-charlson-comorbidities---primary:
    run: submandibular-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule209
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-breast---primary/output
  charlson-comorbidities-chest---primary:
    run: charlson-comorbidities-chest---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule210
      potentialCases:
        id: potentialCases
        source: submandibular-charlson-comorbidities---primary/output
  arteriosclerotic-charlson-comorbidities---primary:
    run: arteriosclerotic-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule211
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-chest---primary/output
  charlson-comorbidities-pericardium---primary:
    run: charlson-comorbidities-pericardium---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule212
      potentialCases:
        id: potentialCases
        source: arteriosclerotic-charlson-comorbidities---primary/output
  charlson-comorbidities-confirmed---primary:
    run: charlson-comorbidities-confirmed---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule213
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-pericardium---primary/output
  progressive-charlson-comorbidities---primary:
    run: progressive-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule214
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-confirmed---primary/output
  charlson-comorbidities-scleroderma---primary:
    run: charlson-comorbidities-scleroderma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule215
      potentialCases:
        id: potentialCases
        source: progressive-charlson-comorbidities---primary/output
  bronchial-charlson-comorbidities---primary:
    run: bronchial-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule216
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-scleroderma---primary/output
  charlson-comorbidities-umbilicu---primary:
    run: charlson-comorbidities-umbilicu---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule217
      potentialCases:
        id: potentialCases
        source: bronchial-charlson-comorbidities---primary/output
  charlson-comorbidities-hypopharynx---primary:
    run: charlson-comorbidities-hypopharynx---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule218
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-umbilicu---primary/output
  independent-charlson-comorbidities---primary:
    run: independent-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule219
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-hypopharynx---primary/output
  charlson-comorbidities-periph---primary:
    run: charlson-comorbidities-periph---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule220
      potentialCases:
        id: potentialCases
        source: independent-charlson-comorbidities---primary/output
  charlson-comorbidities-asbestosis---primary:
    run: charlson-comorbidities-asbestosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule221
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-periph---primary/output
  charlson-comorbidities-fever---primary:
    run: charlson-comorbidities-fever---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule222
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-asbestosis---primary/output
  charlson-comorbidities-cirrhosis---primary:
    run: charlson-comorbidities-cirrhosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule223
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-fever---primary/output
  charlson-comorbidities-ureter---primary:
    run: charlson-comorbidities-ureter---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule224
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-cirrhosis---primary/output
  charlson-comorbidities-clavicle---primary:
    run: charlson-comorbidities-clavicle---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule225
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-ureter---primary/output
  charlson-comorbidities-accessory---primary:
    run: charlson-comorbidities-accessory---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule226
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-clavicle---primary/output
  charlson-comorbidities-antrum---primary:
    run: charlson-comorbidities-antrum---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule227
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-accessory---primary/output
  charlson-comorbidities-eyebrow---primary:
    run: charlson-comorbidities-eyebrow---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule228
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-antrum---primary/output
  charlson-comorbidities-fungoide---primary:
    run: charlson-comorbidities-fungoide---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule229
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-eyebrow---primary/output
  charlson-comorbidities-chondroma---primary:
    run: charlson-comorbidities-chondroma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule230
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-fungoide---primary/output
  ethmoid-charlson-comorbidities---primary:
    run: ethmoid-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule231
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-chondroma---primary/output
  charlson-comorbidities-sacrum---primary:
    run: charlson-comorbidities-sacrum---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule232
      potentialCases:
        id: potentialCases
        source: ethmoid-charlson-comorbidities---primary/output
  charlson-comorbidities-overlap---primary:
    run: charlson-comorbidities-overlap---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule233
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-sacrum---primary/output
  charlson-comorbidities-forms---primary:
    run: charlson-comorbidities-forms---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule234
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-overlap---primary/output
  charlson-comorbidities-related---primary:
    run: charlson-comorbidities-related---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule235
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-forms---primary/output
  membranous-charlson-comorbidities---primary:
    run: membranous-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule236
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-related---primary/output
  nephropathy-charlson-comorbidities---primary:
    run: nephropathy-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule237
      potentialCases:
        id: potentialCases
        source: membranous-charlson-comorbidities---primary/output
  chemical-charlson-comorbidities---primary:
    run: chemical-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule238
      potentialCases:
        id: potentialCases
        source: nephropathy-charlson-comorbidities---primary/output
  myeloid-charlson-comorbidities---primary:
    run: myeloid-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule239
      potentialCases:
        id: potentialCases
        source: chemical-charlson-comorbidities---primary/output
  charlson-comorbidities-trachea---primary:
    run: charlson-comorbidities-trachea---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule240
      potentialCases:
        id: potentialCases
        source: myeloid-charlson-comorbidities---primary/output
  charlson-comorbidities-labia---primary:
    run: charlson-comorbidities-labia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule241
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-trachea---primary/output
  charlson-comorbidities-sternum---primary:
    run: charlson-comorbidities-sternum---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule242
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-labia---primary/output
  charlson-comorbidities-varice---primary:
    run: charlson-comorbidities-varice---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule243
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-sternum---primary/output
  charlson-comorbidities-endometrium---primary:
    run: charlson-comorbidities-endometrium---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule244
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-varice---primary/output
  charlson-comorbidities-auricle---primary:
    run: charlson-comorbidities-auricle---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule245
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-endometrium---primary/output
  charlson-comorbidities-liver---primary:
    run: charlson-comorbidities-liver---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule246
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-auricle---primary/output
  charlson-comorbidities-thumb---primary:
    run: charlson-comorbidities-thumb---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule247
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-liver---primary/output
  charlson-comorbidities-hypersensitivity---primary:
    run: charlson-comorbidities-hypersensitivity---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule248
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-thumb---primary/output
  charlson-comorbidities-histiocytosis---primary:
    run: charlson-comorbidities-histiocytosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule249
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-hypersensitivity---primary/output
  charlson-comorbidities-rheumatica---primary:
    run: charlson-comorbidities-rheumatica---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule250
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-histiocytosis---primary/output
  aortic-charlson-comorbidities---primary:
    run: aortic-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule251
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-rheumatica---primary/output
  charlson-comorbidities-scapula---primary:
    run: charlson-comorbidities-scapula---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule252
      potentialCases:
        id: potentialCases
        source: aortic-charlson-comorbidities---primary/output
  charlson-comorbidities-temple---primary:
    run: charlson-comorbidities-temple---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule253
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-scapula---primary/output
  charlson-comorbidities-cerebrum---primary:
    run: charlson-comorbidities-cerebrum---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule254
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-temple---primary/output
  charlson-comorbidities-condition---primary:
    run: charlson-comorbidities-condition---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule255
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-cerebrum---primary/output
  myeloproliferative-charlson-comorbidities---primary:
    run: myeloproliferative-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule256
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-condition---primary/output
  charlson-comorbidities-tcell---primary:
    run: charlson-comorbidities-tcell---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule257
      potentialCases:
        id: potentialCases
        source: myeloproliferative-charlson-comorbidities---primary/output
  cranial-charlson-comorbidities---primary:
    run: cranial-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule258
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-tcell---primary/output
  charlson-comorbidities-urethra---primary:
    run: charlson-comorbidities-urethra---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule259
      potentialCases:
        id: potentialCases
        source: cranial-charlson-comorbidities---primary/output
  parietal-charlson-comorbidities---primary:
    run: parietal-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule260
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-urethra---primary/output
  charlson-comorbidities-skull---primary:
    run: charlson-comorbidities-skull---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule261
      potentialCases:
        id: potentialCases
        source: parietal-charlson-comorbidities---primary/output
  charlson-comorbidities-adnexa---primary:
    run: charlson-comorbidities-adnexa---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule262
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-skull---primary/output
  charlson-comorbidities-rectum---primary:
    run: charlson-comorbidities-rectum---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule263
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-adnexa---primary/output
  charlson-comorbidities-lesser---primary:
    run: charlson-comorbidities-lesser---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule264
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-rectum---primary/output
  viral-charlson-comorbidities---primary:
    run: viral-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule265
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-lesser---primary/output
  bullous-charlson-comorbidities---primary:
    run: bullous-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule266
      potentialCases:
        id: potentialCases
        source: viral-charlson-comorbidities---primary/output
  charlson-comorbidities-groin---primary:
    run: charlson-comorbidities-groin---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule267
      potentialCases:
        id: potentialCases
        source: bullous-charlson-comorbidities---primary/output
  charlson-comorbidities-emergency---primary:
    run: charlson-comorbidities-emergency---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule268
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-groin---primary/output
  charlson-comorbidities-cleaved---primary:
    run: charlson-comorbidities-cleaved---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule269
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-emergency---primary/output
  vascular-charlson-comorbidities---primary:
    run: vascular-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule270
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-cleaved---primary/output
  charlson-comorbidities-cellularity---primary:
    run: charlson-comorbidities-cellularity---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule271
      potentialCases:
        id: potentialCases
        source: vascular-charlson-comorbidities---primary/output
  lymphocytichistiocytic-charlson-comorbidities---primary:
    run: lymphocytichistiocytic-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule272
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-cellularity---primary/output
  charlson-comorbidities-prostate---primary:
    run: charlson-comorbidities-prostate---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule273
      potentialCases:
        id: potentialCases
        source: lymphocytichistiocytic-charlson-comorbidities---primary/output
  charlson-comorbidities-epithelioma---primary:
    run: charlson-comorbidities-epithelioma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule274
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-prostate---primary/output
  charlson-comorbidities-granuloma---primary:
    run: charlson-comorbidities-granuloma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule275
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-epithelioma---primary/output
  charlson-comorbidities-portion---primary:
    run: charlson-comorbidities-portion---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule276
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-granuloma---primary/output
  common-charlson-comorbidities---primary:
    run: common-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule277
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-portion---primary/output
  charlson-comorbidities-sarcoma---primary:
    run: charlson-comorbidities-sarcoma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule278
      potentialCases:
        id: potentialCases
        source: common-charlson-comorbidities---primary/output
  charlson-comorbidities-orifice---primary:
    run: charlson-comorbidities-orifice---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule279
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-sarcoma---primary/output
  charlson-comorbidities-injection---primary:
    run: charlson-comorbidities-injection---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule280
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-orifice---primary/output
  peptic-charlson-comorbidities---primary:
    run: peptic-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule281
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-injection---primary/output
  lacrimal-charlson-comorbidities---primary:
    run: lacrimal-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule282
      potentialCases:
        id: potentialCases
        source: peptic-charlson-comorbidities---primary/output
  myopathy-charlson-comorbidities---primary:
    run: myopathy-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule283
      potentialCases:
        id: potentialCases
        source: lacrimal-charlson-comorbidities---primary/output
  parotid-charlson-comorbidities---primary:
    run: parotid-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule284
      potentialCases:
        id: potentialCases
        source: myopathy-charlson-comorbidities---primary/output
  charlson-comorbidities-auditory---primary:
    run: charlson-comorbidities-auditory---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule285
      potentialCases:
        id: potentialCases
        source: parotid-charlson-comorbidities---primary/output
  charlson-comorbidities-kahler's---primary:
    run: charlson-comorbidities-kahler's---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule286
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-auditory---primary/output
  charlson-comorbidities-berylliosis---primary:
    run: charlson-comorbidities-berylliosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule287
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-kahler's---primary/output
  charlson-comorbidities-bones---primary:
    run: charlson-comorbidities-bones---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule288
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-berylliosis---primary/output
  charlson-comorbidities-ankle---primary:
    run: charlson-comorbidities-ankle---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule289
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-bones---primary/output
  charlson-comorbidities-guglielmo's---primary:
    run: charlson-comorbidities-guglielmo's---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule290
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-ankle---primary/output
  charlson-comorbidities-thymu---primary:
    run: charlson-comorbidities-thymu---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule291
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-guglielmo's---primary/output
  charlson-comorbidities-fibrosis---primary:
    run: charlson-comorbidities-fibrosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule292
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-thymu---primary/output
  charlson-comorbidities-retroperitoneum---primary:
    run: charlson-comorbidities-retroperitoneum---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule293
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-fibrosis---primary/output
  charlson-comorbidities-degen---primary:
    run: charlson-comorbidities-degen---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule294
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-retroperitoneum---primary/output
  mesenteric-charlson-comorbidities---primary:
    run: mesenteric-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule295
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-degen---primary/output
  autonomic-charlson-comorbidities---primary:
    run: autonomic-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule296
      potentialCases:
        id: potentialCases
        source: mesenteric-charlson-comorbidities---primary/output
  charlson-comorbidities-sequoiosis---primary:
    run: charlson-comorbidities-sequoiosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule297
      potentialCases:
        id: potentialCases
        source: autonomic-charlson-comorbidities---primary/output
  charlson-comorbidities-ileum---primary:
    run: charlson-comorbidities-ileum---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule298
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-sequoiosis---primary/output
  charlson-comorbidities-surface---primary:
    run: charlson-comorbidities-surface---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule299
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-ileum---primary/output
  charlson-comorbidities-caplan's---primary:
    run: charlson-comorbidities-caplan's---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule300
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-surface---primary/output
  charlson-comorbidities-byssinosis---primary:
    run: charlson-comorbidities-byssinosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule301
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-caplan's---primary/output
  charlson-comorbidities-sezary---primary:
    run: charlson-comorbidities-sezary---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule302
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-byssinosis---primary/output
  charlson-comorbidities-ovary---primary:
    run: charlson-comorbidities-ovary---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule303
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-sezary---primary/output
  charlson-comorbidities-cuneiform---primary:
    run: charlson-comorbidities-cuneiform---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule304
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-ovary---primary/output
  faucial-charlson-comorbidities---primary:
    run: faucial-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule305
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-cuneiform---primary/output
  charlson-comorbidities-vulva---primary:
    run: charlson-comorbidities-vulva---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule306
      potentialCases:
        id: potentialCases
        source: faucial-charlson-comorbidities---primary/output
  charlson-comorbidities-pancoast's---primary:
    run: charlson-comorbidities-pancoast's---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule307
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-vulva---primary/output
  severe-charlson-comorbidities---primary:
    run: severe-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule308
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-pancoast's---primary/output
  interstitial-charlson-comorbidities---primary:
    run: interstitial-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule309
      potentialCases:
        id: potentialCases
        source: severe-charlson-comorbidities---primary/output
  charlson-comorbidities-suberosis---primary:
    run: charlson-comorbidities-suberosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule310
      potentialCases:
        id: potentialCases
        source: interstitial-charlson-comorbidities---primary/output
  charlson-comorbidities-stannosis---primary:
    run: charlson-comorbidities-stannosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule311
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-suberosis---primary/output
  charlson-comorbidities-onset---primary:
    run: charlson-comorbidities-onset---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule312
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-stannosis---primary/output
  lateral-charlson-comorbidities---primary:
    run: lateral-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule313
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-onset---primary/output
  charlson-comorbidities-phaeochromocytoma---primary:
    run: charlson-comorbidities-phaeochromocytoma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule314
      potentialCases:
        id: potentialCases
        source: lateral-charlson-comorbidities---primary/output
  charlson-comorbidities-dorsal---primary:
    run: charlson-comorbidities-dorsal---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule315
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-phaeochromocytoma---primary/output
  charlson-comorbidities-plasmacytoma---primary:
    run: charlson-comorbidities-plasmacytoma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule316
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-dorsal---primary/output
  focal-charlson-comorbidities---primary:
    run: focal-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule317
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-plasmacytoma---primary/output
  charlson-comorbidities-septum---primary:
    run: charlson-comorbidities-septum---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule318
      potentialCases:
        id: potentialCases
        source: focal-charlson-comorbidities---primary/output
  charlson-comorbidities-lung---primary:
    run: charlson-comorbidities-lung---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule319
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-septum---primary/output
  charlson-comorbidities-hypernephroma---primary:
    run: charlson-comorbidities-hypernephroma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule320
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-lung---primary/output
  renal-charlson-comorbidities---primary:
    run: renal-charlson-comorbidities---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule321
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-hypernephroma---primary/output
  charlson-comorbidities-perforated---primary:
    run: charlson-comorbidities-perforated---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule322
      potentialCases:
        id: potentialCases
        source: renal-charlson-comorbidities---primary/output
  charlson-comorbidities-retina---primary:
    run: charlson-comorbidities-retina---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule323
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-perforated---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule324
      potentialCases:
        id: potentialCases
        source: charlson-comorbidities-retina---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
  inputModule18:
    id: inputModule18
    doc: Python implementation unit
    type: File
  inputModule19:
    id: inputModule19
    doc: Python implementation unit
    type: File
  inputModule20:
    id: inputModule20
    doc: Python implementation unit
    type: File
  inputModule21:
    id: inputModule21
    doc: Python implementation unit
    type: File
  inputModule22:
    id: inputModule22
    doc: Python implementation unit
    type: File
  inputModule23:
    id: inputModule23
    doc: Python implementation unit
    type: File
  inputModule24:
    id: inputModule24
    doc: Python implementation unit
    type: File
  inputModule25:
    id: inputModule25
    doc: Python implementation unit
    type: File
  inputModule26:
    id: inputModule26
    doc: Python implementation unit
    type: File
  inputModule27:
    id: inputModule27
    doc: Python implementation unit
    type: File
  inputModule28:
    id: inputModule28
    doc: Python implementation unit
    type: File
  inputModule29:
    id: inputModule29
    doc: Python implementation unit
    type: File
  inputModule30:
    id: inputModule30
    doc: Python implementation unit
    type: File
  inputModule31:
    id: inputModule31
    doc: Python implementation unit
    type: File
  inputModule32:
    id: inputModule32
    doc: Python implementation unit
    type: File
  inputModule33:
    id: inputModule33
    doc: Python implementation unit
    type: File
  inputModule34:
    id: inputModule34
    doc: Python implementation unit
    type: File
  inputModule35:
    id: inputModule35
    doc: Python implementation unit
    type: File
  inputModule36:
    id: inputModule36
    doc: Python implementation unit
    type: File
  inputModule37:
    id: inputModule37
    doc: Python implementation unit
    type: File
  inputModule38:
    id: inputModule38
    doc: Python implementation unit
    type: File
  inputModule39:
    id: inputModule39
    doc: Python implementation unit
    type: File
  inputModule40:
    id: inputModule40
    doc: Python implementation unit
    type: File
  inputModule41:
    id: inputModule41
    doc: Python implementation unit
    type: File
  inputModule42:
    id: inputModule42
    doc: Python implementation unit
    type: File
  inputModule43:
    id: inputModule43
    doc: Python implementation unit
    type: File
  inputModule44:
    id: inputModule44
    doc: Python implementation unit
    type: File
  inputModule45:
    id: inputModule45
    doc: Python implementation unit
    type: File
  inputModule46:
    id: inputModule46
    doc: Python implementation unit
    type: File
  inputModule47:
    id: inputModule47
    doc: Python implementation unit
    type: File
  inputModule48:
    id: inputModule48
    doc: Python implementation unit
    type: File
  inputModule49:
    id: inputModule49
    doc: Python implementation unit
    type: File
  inputModule50:
    id: inputModule50
    doc: Python implementation unit
    type: File
  inputModule51:
    id: inputModule51
    doc: Python implementation unit
    type: File
  inputModule52:
    id: inputModule52
    doc: Python implementation unit
    type: File
  inputModule53:
    id: inputModule53
    doc: Python implementation unit
    type: File
  inputModule54:
    id: inputModule54
    doc: Python implementation unit
    type: File
  inputModule55:
    id: inputModule55
    doc: Python implementation unit
    type: File
  inputModule56:
    id: inputModule56
    doc: Python implementation unit
    type: File
  inputModule57:
    id: inputModule57
    doc: Python implementation unit
    type: File
  inputModule58:
    id: inputModule58
    doc: Python implementation unit
    type: File
  inputModule59:
    id: inputModule59
    doc: Python implementation unit
    type: File
  inputModule60:
    id: inputModule60
    doc: Python implementation unit
    type: File
  inputModule61:
    id: inputModule61
    doc: Python implementation unit
    type: File
  inputModule62:
    id: inputModule62
    doc: Python implementation unit
    type: File
  inputModule63:
    id: inputModule63
    doc: Python implementation unit
    type: File
  inputModule64:
    id: inputModule64
    doc: Python implementation unit
    type: File
  inputModule65:
    id: inputModule65
    doc: Python implementation unit
    type: File
  inputModule66:
    id: inputModule66
    doc: Python implementation unit
    type: File
  inputModule67:
    id: inputModule67
    doc: Python implementation unit
    type: File
  inputModule68:
    id: inputModule68
    doc: Python implementation unit
    type: File
  inputModule69:
    id: inputModule69
    doc: Python implementation unit
    type: File
  inputModule70:
    id: inputModule70
    doc: Python implementation unit
    type: File
  inputModule71:
    id: inputModule71
    doc: Python implementation unit
    type: File
  inputModule72:
    id: inputModule72
    doc: Python implementation unit
    type: File
  inputModule73:
    id: inputModule73
    doc: Python implementation unit
    type: File
  inputModule74:
    id: inputModule74
    doc: Python implementation unit
    type: File
  inputModule75:
    id: inputModule75
    doc: Python implementation unit
    type: File
  inputModule76:
    id: inputModule76
    doc: Python implementation unit
    type: File
  inputModule77:
    id: inputModule77
    doc: Python implementation unit
    type: File
  inputModule78:
    id: inputModule78
    doc: Python implementation unit
    type: File
  inputModule79:
    id: inputModule79
    doc: Python implementation unit
    type: File
  inputModule80:
    id: inputModule80
    doc: Python implementation unit
    type: File
  inputModule81:
    id: inputModule81
    doc: Python implementation unit
    type: File
  inputModule82:
    id: inputModule82
    doc: Python implementation unit
    type: File
  inputModule83:
    id: inputModule83
    doc: Python implementation unit
    type: File
  inputModule84:
    id: inputModule84
    doc: Python implementation unit
    type: File
  inputModule85:
    id: inputModule85
    doc: Python implementation unit
    type: File
  inputModule86:
    id: inputModule86
    doc: Python implementation unit
    type: File
  inputModule87:
    id: inputModule87
    doc: Python implementation unit
    type: File
  inputModule88:
    id: inputModule88
    doc: Python implementation unit
    type: File
  inputModule89:
    id: inputModule89
    doc: Python implementation unit
    type: File
  inputModule90:
    id: inputModule90
    doc: Python implementation unit
    type: File
  inputModule91:
    id: inputModule91
    doc: Python implementation unit
    type: File
  inputModule92:
    id: inputModule92
    doc: Python implementation unit
    type: File
  inputModule93:
    id: inputModule93
    doc: Python implementation unit
    type: File
  inputModule94:
    id: inputModule94
    doc: Python implementation unit
    type: File
  inputModule95:
    id: inputModule95
    doc: Python implementation unit
    type: File
  inputModule96:
    id: inputModule96
    doc: Python implementation unit
    type: File
  inputModule97:
    id: inputModule97
    doc: Python implementation unit
    type: File
  inputModule98:
    id: inputModule98
    doc: Python implementation unit
    type: File
  inputModule99:
    id: inputModule99
    doc: Python implementation unit
    type: File
  inputModule100:
    id: inputModule100
    doc: Python implementation unit
    type: File
  inputModule101:
    id: inputModule101
    doc: Python implementation unit
    type: File
  inputModule102:
    id: inputModule102
    doc: Python implementation unit
    type: File
  inputModule103:
    id: inputModule103
    doc: Python implementation unit
    type: File
  inputModule104:
    id: inputModule104
    doc: Python implementation unit
    type: File
  inputModule105:
    id: inputModule105
    doc: Python implementation unit
    type: File
  inputModule106:
    id: inputModule106
    doc: Python implementation unit
    type: File
  inputModule107:
    id: inputModule107
    doc: Python implementation unit
    type: File
  inputModule108:
    id: inputModule108
    doc: Python implementation unit
    type: File
  inputModule109:
    id: inputModule109
    doc: Python implementation unit
    type: File
  inputModule110:
    id: inputModule110
    doc: Python implementation unit
    type: File
  inputModule111:
    id: inputModule111
    doc: Python implementation unit
    type: File
  inputModule112:
    id: inputModule112
    doc: Python implementation unit
    type: File
  inputModule113:
    id: inputModule113
    doc: Python implementation unit
    type: File
  inputModule114:
    id: inputModule114
    doc: Python implementation unit
    type: File
  inputModule115:
    id: inputModule115
    doc: Python implementation unit
    type: File
  inputModule116:
    id: inputModule116
    doc: Python implementation unit
    type: File
  inputModule117:
    id: inputModule117
    doc: Python implementation unit
    type: File
  inputModule118:
    id: inputModule118
    doc: Python implementation unit
    type: File
  inputModule119:
    id: inputModule119
    doc: Python implementation unit
    type: File
  inputModule120:
    id: inputModule120
    doc: Python implementation unit
    type: File
  inputModule121:
    id: inputModule121
    doc: Python implementation unit
    type: File
  inputModule122:
    id: inputModule122
    doc: Python implementation unit
    type: File
  inputModule123:
    id: inputModule123
    doc: Python implementation unit
    type: File
  inputModule124:
    id: inputModule124
    doc: Python implementation unit
    type: File
  inputModule125:
    id: inputModule125
    doc: Python implementation unit
    type: File
  inputModule126:
    id: inputModule126
    doc: Python implementation unit
    type: File
  inputModule127:
    id: inputModule127
    doc: Python implementation unit
    type: File
  inputModule128:
    id: inputModule128
    doc: Python implementation unit
    type: File
  inputModule129:
    id: inputModule129
    doc: Python implementation unit
    type: File
  inputModule130:
    id: inputModule130
    doc: Python implementation unit
    type: File
  inputModule131:
    id: inputModule131
    doc: Python implementation unit
    type: File
  inputModule132:
    id: inputModule132
    doc: Python implementation unit
    type: File
  inputModule133:
    id: inputModule133
    doc: Python implementation unit
    type: File
  inputModule134:
    id: inputModule134
    doc: Python implementation unit
    type: File
  inputModule135:
    id: inputModule135
    doc: Python implementation unit
    type: File
  inputModule136:
    id: inputModule136
    doc: Python implementation unit
    type: File
  inputModule137:
    id: inputModule137
    doc: Python implementation unit
    type: File
  inputModule138:
    id: inputModule138
    doc: Python implementation unit
    type: File
  inputModule139:
    id: inputModule139
    doc: Python implementation unit
    type: File
  inputModule140:
    id: inputModule140
    doc: Python implementation unit
    type: File
  inputModule141:
    id: inputModule141
    doc: Python implementation unit
    type: File
  inputModule142:
    id: inputModule142
    doc: Python implementation unit
    type: File
  inputModule143:
    id: inputModule143
    doc: Python implementation unit
    type: File
  inputModule144:
    id: inputModule144
    doc: Python implementation unit
    type: File
  inputModule145:
    id: inputModule145
    doc: Python implementation unit
    type: File
  inputModule146:
    id: inputModule146
    doc: Python implementation unit
    type: File
  inputModule147:
    id: inputModule147
    doc: Python implementation unit
    type: File
  inputModule148:
    id: inputModule148
    doc: Python implementation unit
    type: File
  inputModule149:
    id: inputModule149
    doc: Python implementation unit
    type: File
  inputModule150:
    id: inputModule150
    doc: Python implementation unit
    type: File
  inputModule151:
    id: inputModule151
    doc: Python implementation unit
    type: File
  inputModule152:
    id: inputModule152
    doc: Python implementation unit
    type: File
  inputModule153:
    id: inputModule153
    doc: Python implementation unit
    type: File
  inputModule154:
    id: inputModule154
    doc: Python implementation unit
    type: File
  inputModule155:
    id: inputModule155
    doc: Python implementation unit
    type: File
  inputModule156:
    id: inputModule156
    doc: Python implementation unit
    type: File
  inputModule157:
    id: inputModule157
    doc: Python implementation unit
    type: File
  inputModule158:
    id: inputModule158
    doc: Python implementation unit
    type: File
  inputModule159:
    id: inputModule159
    doc: Python implementation unit
    type: File
  inputModule160:
    id: inputModule160
    doc: Python implementation unit
    type: File
  inputModule161:
    id: inputModule161
    doc: Python implementation unit
    type: File
  inputModule162:
    id: inputModule162
    doc: Python implementation unit
    type: File
  inputModule163:
    id: inputModule163
    doc: Python implementation unit
    type: File
  inputModule164:
    id: inputModule164
    doc: Python implementation unit
    type: File
  inputModule165:
    id: inputModule165
    doc: Python implementation unit
    type: File
  inputModule166:
    id: inputModule166
    doc: Python implementation unit
    type: File
  inputModule167:
    id: inputModule167
    doc: Python implementation unit
    type: File
  inputModule168:
    id: inputModule168
    doc: Python implementation unit
    type: File
  inputModule169:
    id: inputModule169
    doc: Python implementation unit
    type: File
  inputModule170:
    id: inputModule170
    doc: Python implementation unit
    type: File
  inputModule171:
    id: inputModule171
    doc: Python implementation unit
    type: File
  inputModule172:
    id: inputModule172
    doc: Python implementation unit
    type: File
  inputModule173:
    id: inputModule173
    doc: Python implementation unit
    type: File
  inputModule174:
    id: inputModule174
    doc: Python implementation unit
    type: File
  inputModule175:
    id: inputModule175
    doc: Python implementation unit
    type: File
  inputModule176:
    id: inputModule176
    doc: Python implementation unit
    type: File
  inputModule177:
    id: inputModule177
    doc: Python implementation unit
    type: File
  inputModule178:
    id: inputModule178
    doc: Python implementation unit
    type: File
  inputModule179:
    id: inputModule179
    doc: Python implementation unit
    type: File
  inputModule180:
    id: inputModule180
    doc: Python implementation unit
    type: File
  inputModule181:
    id: inputModule181
    doc: Python implementation unit
    type: File
  inputModule182:
    id: inputModule182
    doc: Python implementation unit
    type: File
  inputModule183:
    id: inputModule183
    doc: Python implementation unit
    type: File
  inputModule184:
    id: inputModule184
    doc: Python implementation unit
    type: File
  inputModule185:
    id: inputModule185
    doc: Python implementation unit
    type: File
  inputModule186:
    id: inputModule186
    doc: Python implementation unit
    type: File
  inputModule187:
    id: inputModule187
    doc: Python implementation unit
    type: File
  inputModule188:
    id: inputModule188
    doc: Python implementation unit
    type: File
  inputModule189:
    id: inputModule189
    doc: Python implementation unit
    type: File
  inputModule190:
    id: inputModule190
    doc: Python implementation unit
    type: File
  inputModule191:
    id: inputModule191
    doc: Python implementation unit
    type: File
  inputModule192:
    id: inputModule192
    doc: Python implementation unit
    type: File
  inputModule193:
    id: inputModule193
    doc: Python implementation unit
    type: File
  inputModule194:
    id: inputModule194
    doc: Python implementation unit
    type: File
  inputModule195:
    id: inputModule195
    doc: Python implementation unit
    type: File
  inputModule196:
    id: inputModule196
    doc: Python implementation unit
    type: File
  inputModule197:
    id: inputModule197
    doc: Python implementation unit
    type: File
  inputModule198:
    id: inputModule198
    doc: Python implementation unit
    type: File
  inputModule199:
    id: inputModule199
    doc: Python implementation unit
    type: File
  inputModule200:
    id: inputModule200
    doc: Python implementation unit
    type: File
  inputModule201:
    id: inputModule201
    doc: Python implementation unit
    type: File
  inputModule202:
    id: inputModule202
    doc: Python implementation unit
    type: File
  inputModule203:
    id: inputModule203
    doc: Python implementation unit
    type: File
  inputModule204:
    id: inputModule204
    doc: Python implementation unit
    type: File
  inputModule205:
    id: inputModule205
    doc: Python implementation unit
    type: File
  inputModule206:
    id: inputModule206
    doc: Python implementation unit
    type: File
  inputModule207:
    id: inputModule207
    doc: Python implementation unit
    type: File
  inputModule208:
    id: inputModule208
    doc: Python implementation unit
    type: File
  inputModule209:
    id: inputModule209
    doc: Python implementation unit
    type: File
  inputModule210:
    id: inputModule210
    doc: Python implementation unit
    type: File
  inputModule211:
    id: inputModule211
    doc: Python implementation unit
    type: File
  inputModule212:
    id: inputModule212
    doc: Python implementation unit
    type: File
  inputModule213:
    id: inputModule213
    doc: Python implementation unit
    type: File
  inputModule214:
    id: inputModule214
    doc: Python implementation unit
    type: File
  inputModule215:
    id: inputModule215
    doc: Python implementation unit
    type: File
  inputModule216:
    id: inputModule216
    doc: Python implementation unit
    type: File
  inputModule217:
    id: inputModule217
    doc: Python implementation unit
    type: File
  inputModule218:
    id: inputModule218
    doc: Python implementation unit
    type: File
  inputModule219:
    id: inputModule219
    doc: Python implementation unit
    type: File
  inputModule220:
    id: inputModule220
    doc: Python implementation unit
    type: File
  inputModule221:
    id: inputModule221
    doc: Python implementation unit
    type: File
  inputModule222:
    id: inputModule222
    doc: Python implementation unit
    type: File
  inputModule223:
    id: inputModule223
    doc: Python implementation unit
    type: File
  inputModule224:
    id: inputModule224
    doc: Python implementation unit
    type: File
  inputModule225:
    id: inputModule225
    doc: Python implementation unit
    type: File
  inputModule226:
    id: inputModule226
    doc: Python implementation unit
    type: File
  inputModule227:
    id: inputModule227
    doc: Python implementation unit
    type: File
  inputModule228:
    id: inputModule228
    doc: Python implementation unit
    type: File
  inputModule229:
    id: inputModule229
    doc: Python implementation unit
    type: File
  inputModule230:
    id: inputModule230
    doc: Python implementation unit
    type: File
  inputModule231:
    id: inputModule231
    doc: Python implementation unit
    type: File
  inputModule232:
    id: inputModule232
    doc: Python implementation unit
    type: File
  inputModule233:
    id: inputModule233
    doc: Python implementation unit
    type: File
  inputModule234:
    id: inputModule234
    doc: Python implementation unit
    type: File
  inputModule235:
    id: inputModule235
    doc: Python implementation unit
    type: File
  inputModule236:
    id: inputModule236
    doc: Python implementation unit
    type: File
  inputModule237:
    id: inputModule237
    doc: Python implementation unit
    type: File
  inputModule238:
    id: inputModule238
    doc: Python implementation unit
    type: File
  inputModule239:
    id: inputModule239
    doc: Python implementation unit
    type: File
  inputModule240:
    id: inputModule240
    doc: Python implementation unit
    type: File
  inputModule241:
    id: inputModule241
    doc: Python implementation unit
    type: File
  inputModule242:
    id: inputModule242
    doc: Python implementation unit
    type: File
  inputModule243:
    id: inputModule243
    doc: Python implementation unit
    type: File
  inputModule244:
    id: inputModule244
    doc: Python implementation unit
    type: File
  inputModule245:
    id: inputModule245
    doc: Python implementation unit
    type: File
  inputModule246:
    id: inputModule246
    doc: Python implementation unit
    type: File
  inputModule247:
    id: inputModule247
    doc: Python implementation unit
    type: File
  inputModule248:
    id: inputModule248
    doc: Python implementation unit
    type: File
  inputModule249:
    id: inputModule249
    doc: Python implementation unit
    type: File
  inputModule250:
    id: inputModule250
    doc: Python implementation unit
    type: File
  inputModule251:
    id: inputModule251
    doc: Python implementation unit
    type: File
  inputModule252:
    id: inputModule252
    doc: Python implementation unit
    type: File
  inputModule253:
    id: inputModule253
    doc: Python implementation unit
    type: File
  inputModule254:
    id: inputModule254
    doc: Python implementation unit
    type: File
  inputModule255:
    id: inputModule255
    doc: Python implementation unit
    type: File
  inputModule256:
    id: inputModule256
    doc: Python implementation unit
    type: File
  inputModule257:
    id: inputModule257
    doc: Python implementation unit
    type: File
  inputModule258:
    id: inputModule258
    doc: Python implementation unit
    type: File
  inputModule259:
    id: inputModule259
    doc: Python implementation unit
    type: File
  inputModule260:
    id: inputModule260
    doc: Python implementation unit
    type: File
  inputModule261:
    id: inputModule261
    doc: Python implementation unit
    type: File
  inputModule262:
    id: inputModule262
    doc: Python implementation unit
    type: File
  inputModule263:
    id: inputModule263
    doc: Python implementation unit
    type: File
  inputModule264:
    id: inputModule264
    doc: Python implementation unit
    type: File
  inputModule265:
    id: inputModule265
    doc: Python implementation unit
    type: File
  inputModule266:
    id: inputModule266
    doc: Python implementation unit
    type: File
  inputModule267:
    id: inputModule267
    doc: Python implementation unit
    type: File
  inputModule268:
    id: inputModule268
    doc: Python implementation unit
    type: File
  inputModule269:
    id: inputModule269
    doc: Python implementation unit
    type: File
  inputModule270:
    id: inputModule270
    doc: Python implementation unit
    type: File
  inputModule271:
    id: inputModule271
    doc: Python implementation unit
    type: File
  inputModule272:
    id: inputModule272
    doc: Python implementation unit
    type: File
  inputModule273:
    id: inputModule273
    doc: Python implementation unit
    type: File
  inputModule274:
    id: inputModule274
    doc: Python implementation unit
    type: File
  inputModule275:
    id: inputModule275
    doc: Python implementation unit
    type: File
  inputModule276:
    id: inputModule276
    doc: Python implementation unit
    type: File
  inputModule277:
    id: inputModule277
    doc: Python implementation unit
    type: File
  inputModule278:
    id: inputModule278
    doc: Python implementation unit
    type: File
  inputModule279:
    id: inputModule279
    doc: Python implementation unit
    type: File
  inputModule280:
    id: inputModule280
    doc: Python implementation unit
    type: File
  inputModule281:
    id: inputModule281
    doc: Python implementation unit
    type: File
  inputModule282:
    id: inputModule282
    doc: Python implementation unit
    type: File
  inputModule283:
    id: inputModule283
    doc: Python implementation unit
    type: File
  inputModule284:
    id: inputModule284
    doc: Python implementation unit
    type: File
  inputModule285:
    id: inputModule285
    doc: Python implementation unit
    type: File
  inputModule286:
    id: inputModule286
    doc: Python implementation unit
    type: File
  inputModule287:
    id: inputModule287
    doc: Python implementation unit
    type: File
  inputModule288:
    id: inputModule288
    doc: Python implementation unit
    type: File
  inputModule289:
    id: inputModule289
    doc: Python implementation unit
    type: File
  inputModule290:
    id: inputModule290
    doc: Python implementation unit
    type: File
  inputModule291:
    id: inputModule291
    doc: Python implementation unit
    type: File
  inputModule292:
    id: inputModule292
    doc: Python implementation unit
    type: File
  inputModule293:
    id: inputModule293
    doc: Python implementation unit
    type: File
  inputModule294:
    id: inputModule294
    doc: Python implementation unit
    type: File
  inputModule295:
    id: inputModule295
    doc: Python implementation unit
    type: File
  inputModule296:
    id: inputModule296
    doc: Python implementation unit
    type: File
  inputModule297:
    id: inputModule297
    doc: Python implementation unit
    type: File
  inputModule298:
    id: inputModule298
    doc: Python implementation unit
    type: File
  inputModule299:
    id: inputModule299
    doc: Python implementation unit
    type: File
  inputModule300:
    id: inputModule300
    doc: Python implementation unit
    type: File
  inputModule301:
    id: inputModule301
    doc: Python implementation unit
    type: File
  inputModule302:
    id: inputModule302
    doc: Python implementation unit
    type: File
  inputModule303:
    id: inputModule303
    doc: Python implementation unit
    type: File
  inputModule304:
    id: inputModule304
    doc: Python implementation unit
    type: File
  inputModule305:
    id: inputModule305
    doc: Python implementation unit
    type: File
  inputModule306:
    id: inputModule306
    doc: Python implementation unit
    type: File
  inputModule307:
    id: inputModule307
    doc: Python implementation unit
    type: File
  inputModule308:
    id: inputModule308
    doc: Python implementation unit
    type: File
  inputModule309:
    id: inputModule309
    doc: Python implementation unit
    type: File
  inputModule310:
    id: inputModule310
    doc: Python implementation unit
    type: File
  inputModule311:
    id: inputModule311
    doc: Python implementation unit
    type: File
  inputModule312:
    id: inputModule312
    doc: Python implementation unit
    type: File
  inputModule313:
    id: inputModule313
    doc: Python implementation unit
    type: File
  inputModule314:
    id: inputModule314
    doc: Python implementation unit
    type: File
  inputModule315:
    id: inputModule315
    doc: Python implementation unit
    type: File
  inputModule316:
    id: inputModule316
    doc: Python implementation unit
    type: File
  inputModule317:
    id: inputModule317
    doc: Python implementation unit
    type: File
  inputModule318:
    id: inputModule318
    doc: Python implementation unit
    type: File
  inputModule319:
    id: inputModule319
    doc: Python implementation unit
    type: File
  inputModule320:
    id: inputModule320
    doc: Python implementation unit
    type: File
  inputModule321:
    id: inputModule321
    doc: Python implementation unit
    type: File
  inputModule322:
    id: inputModule322
    doc: Python implementation unit
    type: File
  inputModule323:
    id: inputModule323
    doc: Python implementation unit
    type: File
  inputModule324:
    id: inputModule324
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
