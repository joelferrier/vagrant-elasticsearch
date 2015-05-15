class elasticsearch::config {

  yumrepo { 'elasticsearch':
    name     => 'elasticsearch-1.4',
    ensure   => present,
    baseurl  => "http://packages.elasticsearch.org/elasticsearch/1.4/centos",
    enabled  => true,
    gpgcheck => true,
    gpgkey   => "http://packages.elasticsearch.org/GPG-KEY-elasticsearch",
  }
}
