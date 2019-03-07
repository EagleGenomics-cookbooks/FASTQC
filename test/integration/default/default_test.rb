describe file('/usr/local/FastQC') do
  it { should be_directory }
end

describe file('/usr/local/FastQC/fastqc') do
  it { should be_file }
  it { should be_executable }
end

describe command('which fastqc') do
  its(:exit_status) { should eq 0 }
end

describe command('fastqc -version') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match 'v0.11.5' }
end

# runs fastqc on some small test data and creates output zip file
describe command 'fastqc --outdir=/tmp /tmp/test1.fastq' do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match 'Analysis complete for test1.fastq' }
end

# unzips the output file above
describe command 'unzip /tmp/test1_fastqc.zip -d /tmp' do
  its(:exit_status) { should eq 0 }
end

# test the output of the fastqc command above matches the output we expect
describe file('/tmp/test1_fastqc/summary.txt') do
  it { should be_file }
  its('content') { should match 'PASS' }
end

describe command('rm -rf /tmp/test1_fastqc /tmp/test1_fastqc.html /tmp/test1_fastqc.zip') do
  its(:exit_status) { should eq 0 }
end
