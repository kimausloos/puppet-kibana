#!/usr/bin/env rspec

require 'spec_helper'

describe 'kibana' do
  it { should contain_class 'kibana' }
end
