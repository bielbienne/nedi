class nedi::config {
  # require puppetlabs/apache
  # vhost
  # crontab
  class { 'apache':
    default_mods        => false,
    default_confd_files => false,
    apache::mod { 'rewrite': }
    class { 'apache::mod::ssl':
      ssl_compression => false,
      ssl_options     => [ 'StdEnvVars' ],
    }
    apache::vhost {'nedi.example.com':
      port              => '80',
      rewrites          => [
        comment         => 'Redirect to https',
        rewrite_cond    => '%{HTTPS} !=on',
        rewrite_rule    => '^/?(.*) https://%{SERVER_NAME}/$1',
        ],
    }
    apache::vhost {'nedi.example.com':
      port             => '443',
      ssl              => true,
      docroot          => '/usr/local/nedi/html',
      serveradmin      => 'webmaster@example.com',
      ssl_protocol     => '-ALL +SSLv3 +TLSv1',
      ssl_cipher       => 'ALL:!ADH:RC4+RSA:+HIGH:+MEDIUM:-LOW:-SSLv2:-EXP'^,
    }
  }
}