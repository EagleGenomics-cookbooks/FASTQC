#
# Cookbook Name:: FASTQC
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'build-essential'
include_recipe 'java'

package ['unzip'] do
  action :install
end

remote_file "#{Chef::Config[:file_cache_path]}/#{node['FASTQC']['filename']}" do
  source node['FASTQC']['url']
  action :create_if_missing
end

execute "unzip #{Chef::Config[:file_cache_path]}/#{node['FASTQC']['filename']} -d #{node['FASTQC']['install_dir']}" do
  not_if { ::File.exist?("#{node['FASTQC']['install_dir']}/FastQC/fastqc") }
end

execute "chmod 755 fastqc" do
  cwd "#{node['FASTQC']['install_dir']}/FastQC"
end

link "#{node['FASTQC']['bin_path']}/fastqc" do
  to "#{node['FASTQC']['install_dir']}/FastQC/fastqc"
end
