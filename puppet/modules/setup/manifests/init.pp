class setup {

	# comment out for faster provisioning $default_packages = [ "mc", "strace", "sysstat", "git" ]
	$default_packages = [ "mc" ]
	
	package { $default_packages :
		ensure => present,
	}
}