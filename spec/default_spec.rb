# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'gemirro::default' do
  include_context 'gemirro_stubs'

  describe 'with default attributes' do
    subject { ChefSpec::ServerRunner.new.converge(described_recipe) }

    it 'does includes recipes' do
      expect(subject).to include_recipe('apt')
      expect(subject).to include_recipe('nginx')
      expect(subject).to include_recipe('gemirro::configure')
    end

    it 'should install gemirro' do
      expect(subject).to install_gem_package('gemirro').with(
        options: '-n /usr/bin'
      )
    end

    it 'should create directory' do
      expect(subject).to create_directory('/opt/gemirro').with(
        recursive: true
      )
      expect(subject).to create_directory('/var/log/gemirro').with(
        recursive: true
      )
    end

    it 'should create hostfile entry' do
      expect(subject).to create_hostsfile_entry('127.0.0.1').with(
        hostname: 'chefspec.local',
        aliases: ['localhost']
      )
    end
  end

  describe 'with overriden attributes' do
    let(:subject) do
      ChefSpec::ServerRunner.new do |node|
        node.set['gemirro']['directory'] = '/var/www/gemirro'
        node.set['gemirro']['server']['host'] = 'gemirro-mirror'
        node.set['gemirro']['server']['port'] = '8088'
        node.set['gemirro']['server']['type'] = 'apache2'
        node.set['gemirro']['server']['log_directory'] = '/var/log/apache2/gemirro'
        node.set['gemirro']['force_update'] = true
      end.converge described_recipe
    end

    it 'does includes recipes' do
      expect(subject).to include_recipe('gemirro::apache2')
    end

    it 'should install gemirro' do
      expect(subject).to upgrade_gem_package('gemirro').with(
        options: '-n /usr/bin'
      )
    end

    it 'should create directory' do
      expect(subject).to create_directory('/var/www/gemirro').with(
        recursive: true
      )
      expect(subject).to create_directory('/var/log/apache2/gemirro').with(
        recursive: true
      )
    end

    it 'should create config.rb' do
      expect(subject).to create_template('/var/www/gemirro/config.rb').with(
        source: 'config.rb.erb'
      )
    end

    it 'should create hostfile entry' do
      expect(subject).to create_hostsfile_entry('127.0.0.1').with(
        hostname: 'gemirro-mirror',
        aliases: ['localhost']
      )
    end
  end
end
