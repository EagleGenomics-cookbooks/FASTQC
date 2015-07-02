# FASTQC
Chef recipe for FASTQC - FastQC aims to provide a simple way to do some quality control checks on raw sequence data coming from high throughput sequencing pipelines

Description
===========

http://www.bioinformatics.babraham.ac.uk/projects/fastqc/

Requirements
============

## Platform:

* Centos 6.5
* RHEL 6.5


Notes
=====
The file is unzip in /usr/local/FastQC so need to run from here. 

Usage
=====

To test the recipe we use chef test kitchen

kitchen converge default-centos65 | tee kitchen.log

kitchen login default-centos65

kitchen verify default-centos65

kitchen destroy default-centos65
    
License and Authors
===================

* Authors:: Bart Ailey (<chef@eaglegenomics.com>)
    
Copyright:: 2015, Eagle Genomics Ltd
    
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
    
ToDo
====

Package install for Ubuntu.
Set paths/environment.
Tests.
