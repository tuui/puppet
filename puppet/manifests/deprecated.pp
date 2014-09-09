Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

class system-update {
  exec { 'apt-get update':
    command => 'apt-get update',
  }

  $sysPackages = [ "build-essential" ]
  package { $sysPackages:
    ensure => "installed",
    require => Exec['apt-get update'],
  }
}

class tomcat {
  package { "tomcat7":
    ensure  => present,
    require => Class["system-update"],
  }

  service { "tomcat7":
    ensure  => "running",
    require => Package["tomcat7"],
  }

}

class jenkins {
  package { "jenkins":
    ensure => present,
    require => Class["system-update"],
  }

  service { "jenkins":
    ensure => "running",
    require => Package["jenkins"],
  }
}

include system-update
include tomcat
include jenkins