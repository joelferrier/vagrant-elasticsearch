class kibana {
  include kibana::config

  file { 'kibana-service':
    owner   => 'root',
    group   => 'root',
    path    => '/usr/lib/systemd/system/kibana.service',
    source  => "puppet:///modules/kibana/kibana.service",
    require => File['kibana-install'],
    notify  => Service['kibana-service'],
  }

  service { 'kibana-service':
    name    => 'kibana',
    ensure  => running,
    enable  => true,
    require => File['kibana-service'],
  }

}
