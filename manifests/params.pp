class freight::params() {
  $install_ensure     = 'present'

  $config_varlib          = '/var/lib/freight'
  $config_varcache        = '/var/cache/freight'
  $config_origin          = 'Freight'
  $config_label           = 'Freight'
  $config_cache           = true
  $config_gpg_digest_algo = 'SHA512'
  $config_symlinks        = false
}