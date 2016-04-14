class freight::config(
  $gpgkey,
  $varlib          = $freight::params::config_varlib,
  $varcache        = $freight::params::config_varcache,
  $origin          = $freight::params::config_origin,
  $label           = $freight::params::config_label,
  $cache           = $freight::params::config_cache,
  $gpg_digest_algo = $freight::params::config_gpg_digest_algo,
  $symlinks        = $freight::params::config_symlinks,
) inherits freight::params {

  $cache_on_or_off = $cache ? {
    /^(on|off)$/ => $cache,
    true         => 'on',
    default      => 'off',
  }

  $symlinks_on_or_off = $symlinks ? {
    /^(on|off)$/ => $symlinks,
    true         => 'on',
    default      => 'off',
  }

  file { '/etc/freight.conf':
    owner   => 'root',
    group   => 'root',
    content => template('freight/freight.conf.erb'),
    mode    => '0644',
  }

}