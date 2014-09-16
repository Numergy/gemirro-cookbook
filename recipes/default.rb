# -*- coding: utf-8 -*-
#
# Cookbook Name:: gemirro
# Recipe:: default
#
# Copyright 2014, Numergy
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'apt'

gem_package 'gemirro' do
  options '-n /usr/bin'
  version node['gemirro']['version'] if node['gemirro']['version']
  action :install unless node['gemirro']['force_update']
  action :upgrade if node['gemirro']['force_update']
end

[node['gemirro']['server']['log_directory'], node['gemirro']['directory']].each do |dir|
  directory dir do
    recursive true
    action :create
  end
end

hostsfile_entry '127.0.0.1' do
  hostname node['gemirro']['server']['host']
  action :create
end

if node['gemirro']['server']['type'] == 'apache2'
  include_recipe 'gemirro::apache2'
else
  include_recipe 'gemirro::nginx'
end

include_recipe 'gemirro::configure'
