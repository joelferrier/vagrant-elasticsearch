class logstash {
  include logstash::config

  package { 'redis':
    ensure  => installed,
    require => Package['java-1.7.0-openjdk'],
  }

  package { 'logstash':
    ensure  => installed,
    require => Yumrepo['logstash-repo'],
  }

  service { 'redis':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    require    => Package['logstash'],
  }

  service { 'logstash':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    require    => Service['redis'],
  }
}
