class nedi (
  $auth_method = 'sso',
  $snmp_communities = ['paranod md5 ver3pa55  aes ver3pa55'],
  $credentials = ['usr  nedi  pa55  enpa55']
){
  include nedi::packages
  include nedi::install
  include nedi::config
}
