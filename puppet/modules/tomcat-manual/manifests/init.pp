class tomcat-manual {

	file { "tomcat-src":
		path => "/home/vagrant/software/apache-tomcat-7.0.55.tar.gz",
		source => "/vagrant/puppet/modules/tomcat-manual/files/software/apache-tomcat-7.0.55.tar.gz",
	}

	exec { "extract-tomcat":
		cwd => "/home/vagrant/software",
		command => "/bin/tar xvjf apache-tomcat-7.0.55.tar.gz",
		creates => "/home/vagrant/software/apache-tomcat-7.0.55",
		require => [File["tomcat-src"]]
	}	
	
	exec { "link-tomcat":
		cwd => "/home/vagrant/software/apache-tomcat-7.0.55",
		command => "/bin/ln -sf /home/vagrant/software/apache-tomcat-7.0.55/bin/apache-tomcat-7.0.55 /usr/local/bin/apache-tomcat-7.0.55",
		creates => "/usr/local/bin/apache-tomcat-7.0.55",
		require => [Exec["extract-tomcat"]]
	}

}