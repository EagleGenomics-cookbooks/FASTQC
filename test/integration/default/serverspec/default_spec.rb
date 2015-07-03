require 'serverspec'
require_relative './spec_helper'

# Required by serverspec
set :backend, :exec

describe file("#{ENV['FASTQC_INSTALL_DIR']}/FastQC") do
  it { should be_directory }
end

describe file("#{ENV['FASTQC_INSTALL_DIR']}/FastQC/fastqc") do
  it { should be_file }
  it { should be_executable }
end

describe command('which fastqc') do
  its(:exit_status) { should eq 0 }
end

describe command('fastqc -version') do
  its(:exit_status) { should eq 0 }
end

describe command 'fastqc --outdir=/tmp /tmp/test1.fastq' do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should contain('Analysis complete for test1.fastq') }
end

describe command 'unzip /tmp/test1_fastqc.zip -d /tmp' do
  its(:exit_status) { should eq 0 }
end

describe file("/tmp/test1_fastqc/summary.txt") do
  it { should be_file }
  it { should contain 'PASS' }
end

describe command('rm -rf /tmp/test1_fastqc /tmp/test1_fastqc.html /tmp/test1_fastqc.zip') do
  its(:exit_status) { should eq 0 }
end
