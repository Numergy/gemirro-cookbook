# -*- coding: utf-8 -*-
#
# Cookbook Name:: gemirro
# Recipe:: configure
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

execute 'init-gemirro' do
  cwd node['gemirro']['directory']
  command 'gemirro init'
  not_if do
    File.exist?("#{node['gemirro']['directory']}/config.rb")
  end
end

template "#{node['gemirro']['directory']}/config.rb" do
  source 'config.rb.erb'
end

execute 'update-gemirro' do
  cwd node['gemirro']['directory']
  command 'gemirro update'
end

execute 'index-gemirro' do
  cwd node['gemirro']['directory']
  command 'gemirro index'
end

template '/etc/init.d/gemirro' do
  source 'service-gemirro.erb'
  mode '0755'
end

service 'gemirro' do
  action :restart
end
