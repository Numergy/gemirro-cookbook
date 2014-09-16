# -*- coding: utf-8 -*-

require 'spec_helper'

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

describe service('gemirro') do
  it { should be_running }
end

%w(
  gemirro-0.0.1
  gemirro-0.1.0
  gemirro-0.3.0
  rake-10.3.0
  rake-10.3.2
  gemirro-0.0.2
  gemirro-0.2.0
  rake-10.3.1
).each do |f|
  describe file("/opt/gemirro/public/gems/#{f}.gem") do
    it { should be_file }
  end
end

%w(
  specs.4.8
  latest_specs.4.8
  prerelease_specs.4.8
).each do |f|
  describe file("/opt/gemirro/public/#{f}.gz") do
    it { should be_file }
  end
end

describe command('/usr/bin/gemirro server --status -c /opt/gemirro/config.rb') do
  it { should return_stdout 'gemirro is running' }
end

describe port(80) do
  it { should be_listenning }
end
