class kibana::config(
  $elasticsearch_host = $::fqdn,
  $elasticsearch_port = '9200'
) {

  file { '/opt/kibana/config.js' :
    ensure  => file,
    mode    => '0644',
    content => template('kibana/config.js.erb')
  }

}
