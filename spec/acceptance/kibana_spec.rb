require 'spec_helper_acceptance'

describe 'kibana' do
  describe 'running puppet code' do
    it 'should work with no errors' do
      pp = <<-EOS
        include yum
        include stdlib
        include stdlib::stages
        include profile::package_management

        class { 'cegekarepos' : stage => 'setup_repo' }

        Yum::Repo <| title == 'custom' |>
        Yum::Repo <| title == 'custom-noarch' |>
        Yum::Repo <| title == 'cegeka-unsigned' |>

        file { '/data':
          ensure => directory,
          mode   => '0755'
        }

        file { '/data/logs/':
          ensure => directory,
          mode   => '0755'
        }

        class { 'kibana':
          version           => 'latest'
        }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end
    describe package('kibana') do
      it { should be_installed }
    end
  end
end
