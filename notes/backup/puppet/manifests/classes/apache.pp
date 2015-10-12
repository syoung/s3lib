#include apache
#include apache::mod::cgi
#include apache::params
#include apache::mod::prefork

#package { apache2-mpm-worker :
#    ensure => purged,
#}
#
#class { 'apache':
#    mpm_module          => prefork,
#    default_mods        => false,
#    default_confd_files => false,
#}
#
#