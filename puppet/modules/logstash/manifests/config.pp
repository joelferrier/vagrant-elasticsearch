class logstash::config {

  yumrepo { 'logstash-repo':
    name     => 'logsash-1.4',
    ensure   => present,
    baseurl  => 'http://packages.elasticsearch.org/logstash/1.4/centos',
    enabled  => true,
    gpgcheck => true,
    gpgkey   => 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch',
    require  => Package['redis'],
  }

  file { 'logstash-indexer':
    owner  => 'root',
    group  => 'root',
    path   => '/etc/logstash/conf.d/indexer.conf',
    ensure => present,
    source => "puppet:///modules/logstash/indexer.conf",
  }

  # include symlink for logstash?
}
