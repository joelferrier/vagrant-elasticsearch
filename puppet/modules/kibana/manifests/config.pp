class kibana::config {

  file { 'kibana-install':
    owner   => 'root',
    group   => 'root',
    ensure  => directory,
    recurse => true,
    path    => '/opt/kibana',
    source  => "puppet:///modules/kibana/kibana-4.0.0-linux-x64",
    notify  => Service['kibana-service'],
  }
}
