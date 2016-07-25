name 'FastQC'
maintainer 'Eagle Genomics'
maintainer_email 'chef@eaglegenomics.com'
license 'Apache v2.0'
description 'Installs/Configures FastQC'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.3'

source_url 'https://github.com/EagleGenomics-cookbooks/FastQC'
issues_url 'https://github.com/EagleGenomics-cookbooks/FastQC/issues'

depends 'build-essential'
depends 'magic_shell'
depends 'java'
