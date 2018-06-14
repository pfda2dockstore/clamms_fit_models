baseCommand: []
class: CommandLineTool
cwlVersion: v1.0
id: clamms_fit_models
inputs:
  clamms_windows_bed_file:
    doc: BED file of pre-computed CLAMMS windows
    inputBinding:
      position: 3
      prefix: --clamms_windows_bed_file
    type: File
  reference_panel_config_file:
    doc: Tab-separated text file containing list of reference panel samples to build
      the model on (column 1, BED filenames) and their sexes (column 2, 'M' or 'F')
    inputBinding:
      position: 2
      prefix: --reference_panel_config_file
    type: File
  reference_panel_normcov_beds_tarball:
    doc: Archive (.tar.gz) of all normalized coverage BED files for the reference
      panel samples
    inputBinding:
      position: 1
      prefix: --reference_panel_normcov_beds_tarball
    type: File
label: 'CLAMMS: Fit mixture models for target windows from a reference panel'
outputs:
  model_file:
    doc: Fit model file (BED format) based on input reference panel samples
    outputBinding:
      glob: model_file/*
    type: File
requirements:
- class: DockerRequirement
  dockerOutputDirectory: /data/out
  dockerPull: pfda2dockstore/clamms_fit_models:11
s:author:
  class: s:Person
  s:name: Evan Maxwell
