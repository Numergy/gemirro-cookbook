# -*- coding: utf-8 -*-

require 'rspec/expectations'
require 'chefspec'
require 'chefspec/berkshelf'

ChefSpec::Coverage.start! { add_filter 'gemirro' }

require 'chef/application'

RSpec.configure do |config|
  config.log_level = :error
end

shared_context 'gemirro_stubs' do
  before do
    stub_command('which nginx').and_return(true)
    stub_command('/usr/sbin/apache2 -t').and_return(true)
  end
end
