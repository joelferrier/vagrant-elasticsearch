class elasticsearch::packages {

  package { 'java-1.7.0-openjdk':
    ensure => "installed",
    require => Yumrepo["elasticsearch"],
  }

  package { 'elasticsearch':
    ensure  => "installed",
    require => Package["java-1.7.0-openjdk"],
  }
}
