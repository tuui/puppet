Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

include setup
# include apache
include tomcat-manual
# include system-update
