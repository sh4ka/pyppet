# default path
Exec {
  path => ['/usr/bin', '/bin', '/usr/sbin', '/sbin', '/usr/local/bin', '/usr/local/sbin']
}

exec { "apt-get update":
  command => "/usr/bin/apt-get update"
}

$pypackages = [
	"python-dev",
	"python-setuptools", 
	"python-pip",
]

package { $pypackages:
    ensure => present,
    require => Exec["apt-get update"],
}

# misc requires
$requires = [
	"git",
	"python-virtualenv",
	"unzip",
	"tar",
    "curl"
]

package { $requires :
    ensure => present,
    require => Exec["apt-get update"],
}

# MySQL server
package { "mysql-server":
  ensure => present,
  require => Exec["apt-get update"]
}

# MySQL run
service { "mysql":
  ensure => running,
  require => Package["mysql-server"]
}

