class nedi::install {
  # Tar to tar.gz
  # Nedi.conf template
  file {
    'userhome':
      ensure  => 'directory',
      path    => '/var/nedi',
      mode    => '0755',
      owner   => 'nedi',
      group   => 'apache',
      require => User['nedi'];
    'application-folder':
      ensure  => 'directory',
      path    => '/usr/local/nedi',
      source  => 'puppet:///modules/nedi/application/usr/',
      recurse => 'inf',
      mode    => '0775',
      owner   => 'nedi',
      group   => 'apache',
      require => File['userhome'];
    'var.tar.gz':
      ensure  => 'file',
      path    => '/tmp/var.tar.gz',
      mode    => '0700',
      owner   => 'root',
      group   => 'root',
      require => File['userhome'];
    'nedi.conf':
      ensure  => 'file',
      path    => '/usr/share/etc/nedi.conf',
      source  => 'puppet:///modules/nedi/nedi.conf',
      owner   => 'nedi',
      group   => 'apache',
      mode    => '0700',
      require => File['application-folder'];
    '/usr/local/nedi/conf':
      ensure  => 'link',
      target  => '/var/nedi/conf',
      mode    => '0775',
      owner   => 'nedi',
      group   => 'apache',
      require => Exec['var-content'];
    '/usr/local/nedi/sysobj':
      ensure  => 'link',
      target  => '/var/nedi/sysobj',
      mode    => '0775',
      owner   => 'nedi',
      group   => 'apache',
      require => Exec['var-content'];
    '/usr/local/nedi/rrd':
      ensure  => 'link',
      target  => '/var/nedi/rrd',
      mode    => '0775',
      owner   => 'nedi',
      group   => 'apache',
      require => Exec['var-content'];
    '/usr/local/nedi/nedi.conf':
      ensure  => 'link',
      target  => '/usr/local/etc/nedi.conf',
      owner   => 'nedi',
      group   => 'apache',
      require => File['nedi.conf'];
  }
  user {'nedi':
    ensure     => 'present',
    home       => '/var/nedi',
    managehome => true,
    system     => true,
    shell      => '/bin/bash',
    groups     => ['apache'],
  }
  exec {'var-content':
    command    => 'tar -xzf /tmp/var.tar.gz -O /var/nedi/',
    unless     => 'cat /var/nedi/.lockfile 2> /dev/null',
    require    => File['var.tar.gz'],
  }
}