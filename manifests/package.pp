class kibana::package($version = 'present') {

  case $version {
    'present', 'latest': { $version_real = $version }
    default:             { fail('Class[kibana::package]: parameter version must be present or latest') }
  }

  package { 'kibana' :
    ensure => $version_real
  }

}
