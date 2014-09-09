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