class tomcattest {

   include tomcat
   
   tomcat::instance { "bar":
     ensure      => present,
     server_port => 8006,
     http_port   => 8081,
     ajp_port    => 8010,
     sample      => true,
     setenv      => [
       'JAVA_XMX="1200m"',
       'ADD_JAVA_OPTS="-Xms128m"'
     ],
   }

   tomcat::instance { "foo":
     ensure      => present,
     server_port => 8005,
     http_port   => 8080,
     ajp_port    => 8009,
     sample      => true,
     setenv      => [
       'JAVA_XMX="1200m"',
       'ADD_JAVA_OPTS="-Xms128m"'
     ],
   }

   tomcat::instance { "baz":
     ensure      => present,
     server_port => 8007,
     http_port   => 8082,
     ajp_port    => 8011,
     sample      => true,
     setenv      => [
       'JAVA_XMX="1200m"',
       'ADD_JAVA_OPTS="-Xms128m"'
   }

  file {'/srv/tomcat/bar/webapps/sample2.war':
    ensure => present,
    source => "puppet:///modules/tomcattest/sample2.war",
  }
}
