#!/usr/bin/env rspec

require 'spec_helper'

describe 'kibana' do
  let (:facts) { {
      :osfamily => 'RedHat'
  } }

  it { should contain_class 'kibana' }
end
