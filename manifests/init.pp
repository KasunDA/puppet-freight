class freight(
  $config_gpgkey,
  $config_varlib          = $freight::params::config_varlib,
  $config_varcache        = $freight::params::config_varcache,
  $config_origin          = $freight::params::config_origin,
  $config_label           = $freight::params::config_label,
  $config_cache           = $freight::params::config_cache,
  $config_gpg_digest_algo = $freight::params::config_gpg_digest_algo,
  $config_symlinks        = $freight::params::config_symlinks,

  $install_ensure = $freight::params::install_ensure,

  $manage_install = true,
  $manage_config  = true,

) inherits freight::params {
  if $manage_install {
    class { '::freight::install':
      ensure     => $install_ensure,
    }
  }

  if $manage_config {
    class { '::freight::config':
      gpgkey   => $config_gpgkey,
      varlib   => $config_varlib,
      varcache => $config_varcache,
      origin   => $config_origin,
      label    => $config_label,
      cache    => $config_cache,
    }
  }
}