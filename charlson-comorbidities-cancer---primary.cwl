$namespaces:
  s: http://phenomics.kcl.ac.uk/phenoflow/
baseCommand: python
class: CommandLineTool
cwlVersion: v1.0
doc: Identify Charlson Comorbidities cancer - primary
inputs:
- doc: Python implementation unit
  id: inputModule
  inputBinding:
    position: 1
  type: File
- doc: Potential cases of Charlson-Comorbidities
  id: potentialCases
  inputBinding:
    position: 2
  type: File
outputs:
- doc: Patients with clinical codes indicating Charlson-Comorbidities related events
    in electronic health record.
  id: output
  outputBinding:
    glob: '*.csv'
  type: File
requirements:
  DockerRequirement:
    dockerPull: kclhi/python:latest
s:type: logic
