class tomcat7(
    $tomcat_archive = "apache-tomcat-7.0.55.tar.gz",
    $tomcat_home = "/usr/lib/apache-tomcat-7.0.55/",
    $tomcat_folder = "apache-tomcat-7.0.55")
    {

    Exec {
        path => [ "/usr/bin", "/bin", "/usr/sbin"]
    }

    file { "/tmp/${tomcat_archive}" :
        ensure => "present",
        source => "puppet:///modules/tomcat7/${tomcat_archive}",
        owner  => vagrant,
        mode   => 755
    }
    
    exec { 'extract tomcat':
        cwd => '/tmp',
        command => "tar xfv ${tomcat_archive}",
        creates => $tomcat_home,
        require => File["/tmp/${tomcat_archive}"],
    }

    file { '/usr/lib' :
        ensure => directory,
        owner => vagrant,
        require => Exec['extract tomcat']
    }
    
    exec { 'move tomcat':
        cwd => '/tmp',
        creates => $tomcat_home,
        require => File['/usr/lib'],
        command => "mv ${tomcat_folder} /usr/lib/"
    }

	exec { 'start tomcat':
		cwd => "$tomcat_home/bin/",
		command => "sh startup.sh",
		require => Exec['move tomcat']
	}
}