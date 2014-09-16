# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'gemirro::configure' do
  include_context 'gemirro_stubs'

  subject { ChefSpec::Runner.new.converge(described_recipe) }

  it 'should initialize gemirro' do
    expect(subject).to run_execute('init-gemirro').with(
      cwd: '/opt/gemirro',
      command: 'gemirro init'
    )
  end

  it 'should create config.rb' do
    expect(subject).to create_template('/opt/gemirro/config.rb').with(
      source: 'config.rb.erb'
    )
  end

  it 'should update gemirro' do
    expect(subject).to run_execute('update-gemirro').with(
      cwd: '/opt/gemirro',
      command: 'gemirro update'
    )
  end

  it 'should index gemirro' do
    expect(subject).to run_execute('index-gemirro').with(
      cwd: '/opt/gemirro',
      command: 'gemirro index'
    )
  end

  it 'should create init.d/gemirro' do
    expect(subject).to create_template('/etc/init.d/gemirro').with(
      source: 'service-gemirro.erb',
      mode: '0755'
    )
  end

  it 'should restart the gemirro service' do
    expect(subject).to restart_service('gemirro')
  end
end
