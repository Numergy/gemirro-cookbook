# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'gemirro::apache2' do
  include_context 'gemirro_stubs'

  subject { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'does includes recipes' do
    expect(subject).to include_recipe('apache2')
  end
end
