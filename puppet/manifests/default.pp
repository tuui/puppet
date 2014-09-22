Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

include setup
# include java7
# include apache
# include tomcat7
# include tomcat
include system-update
include mysql