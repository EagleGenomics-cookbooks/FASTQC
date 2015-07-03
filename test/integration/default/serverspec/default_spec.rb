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


