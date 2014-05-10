# Class: kibana
#
# This module manages kibana
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class kibana(
  $version = 'present',
  $elasticsearch_host = $::fqdn,
  $elasticsearch_port = '9200'
) {

  case $version {
    'present', 'latest': { $version_real = $version }
    default:             { fail('Class[kibana]: parameter version must be present or latest') }
  }

  case $::osfamily {
    'RedHat': {
      class { 'kibana::package':
        version => $version_real
      }
      class { 'kibana::config':
        elasticsearch_host => $elasticsearch_host,
        elasticsearch_port => $elasticsearch_port
      }

      Class['kibana::package'] -> Class['kibana::config']
    }
    default: {
      fail("Class['kibana']: osfamily ${::osfamily} is not supported")
    }
  }

}
