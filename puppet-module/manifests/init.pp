class nedi {
  include nedi::packages
  file { '/var/nedi':
    ensure  => 'directory',
    mode    => '0775',
    owner   => 'nedi',
    group   => 'apache',
  }
  file { '/usr/local/nedi':
    ensure  => 'directory',
    mode    => '0775',
    owner   => 'nedi',
    group   => 'apache',
  }
  file { '/usr/local/etc/nedi.conf':
    ensure  => 'file',
    mode    => '0700',
    owner   => 'nedi',
    group   => 'apache',
    source  => 'puppet:///modules/nedi/nedi.conf',
    require => File['/usr/local/nedi'],
  }
  user { 'nedi':
    ensure  => 'present',
    home    => '/var/nedi',
    shell   => '/bin/bash',
    groups  => ['apache'],
  }
  file { '/var/nedi/conf':
    ensure  => 'directory',
    mode    => '0775',
    owner   => 'nedi',
    group   => 'apache',
  }
  file { '/var/nedi/sysobj':
    ensure  => 'directory',
    mode    => '0775',
    owner   => 'nedi',
    group   => 'apache',
  }
  file { '/var/nedi/rrd':
    ensure  => 'directory',
    mode    => '0775',
    owner   => 'nedi',
    group   => 'apache',
  }
  file { '/usr/local/nedi/conf':
    ensure  => 'link',
    target  => '/var/nedi/conf',
    mode    => '0775',
    owner   => 'nedi',
    group   => 'apache',
    require => File['/usr/local/nedi'],
  }
  file { '/usr/local/nedi/sysobj':
    ensure  => 'link',
    target  => '/var/nedi/sysobj',
    mode    => '0775',
    owner   => 'nedi',
    group   => 'apache',
    require => File['/var/nedi/sysobj'],
  }
  file { '/usr/local/nedi/rrd':
    ensure  => 'link',
    target  => '/var/nedi/rrd',
    mode    => '0775',
    owner   => 'nedi',
    group   => 'apache',
    require => File['/usr/local/nedi'],
  }
  file { '/var/nedi/crontab':
    ensure  => 'file',
    require => File['/var/nedi'],
    mode    => '0644',
    owner   => 'nedi',
    group   => 'apache',
    source  => 'puppet:///modules/nedi/crontab',
  }
  file { '/usr/local/nedi/nedi.conf':
    ensure  => 'link',
    target  => '/usr/local/etc/nedi.conf',
    owner   => 'nedi',
    group   => 'apache',
    require => File['/usr/local/etc/nedi.conf'],
  }
}
