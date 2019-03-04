#
# Cookbook Name:: FastQC
# Recipe:: default
#
# Copyright (c) 2016 Eagle Genomics Ltd, Apache License, Version 2.0.
##########################################################

apt_update
build_essential 'install essential' do
  action :install
end

include_recipe 'java'

##########################################################
# here for use by serverspec

magic_shell_environment 'FASTQC_INSTALL_DIR' do
  value node['FastQC']['install_dir']
end

magic_shell_environment 'FASTQC_VERSION' do
  value node['FastQC']['version']
end

cookbook_file 'test1.fastq' do
  path '/tmp/test1.fastq'
  action :create
  owner 'root'
  group 'root'
  mode 0o644
end

##########################################################

package ['unzip'] do
  action :install
end

##########################################################

remote_file "#{Chef::Config[:file_cache_path]}/#{node['FastQC']['filename']}" do
  source node['FastQC']['url']
  action :create_if_missing
end

execute "unzip #{Chef::Config[:file_cache_path]}/#{node['FastQC']['filename']} -d #{node['FastQC']['install_dir']}" do
  not_if { ::File.exist?("#{node['FastQC']['install_dir']}/FastQC/fastqc") }
end

file "#{node['FastQC']['install_dir']}/FastQC/fastqc" do
  mode '755'
end

link "#{node['FastQC']['bin_path']}/fastqc" do
  to "#{node['FastQC']['install_dir']}/FastQC/fastqc"
end

##########################################################
