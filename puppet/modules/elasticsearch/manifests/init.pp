class elasticsearch {
  include elasticsearch::packages
  include elasticsearch::config

  service { 'elasticsearch':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    require    => Package['elasticsearch'],
  }
}
