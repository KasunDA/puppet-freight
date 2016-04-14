class freight::install(
  $ensure     = $freight::params::install_ensure,
) inherits freight::params {
  package { 'freight':
    ensure  => $ensure,
  }
}