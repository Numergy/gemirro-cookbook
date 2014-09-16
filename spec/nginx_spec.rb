# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'gemirro::nginx' do
  include_context 'gemirro_stubs'

  subject { ChefSpec::Runner.new.converge(described_recipe) }

  it 'does includes recipes' do
    expect(subject).to include_recipe('nginx')
  end

  it 'should create template' do
    expect(subject).to create_template('/etc/nginx/sites-available/gemirro').with(
      source: 'gemirro-nginx.erb'
    )
  end
end
