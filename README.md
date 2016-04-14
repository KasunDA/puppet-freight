#Freight

Simple module to handle freight package and configuration

##Usage

Simple case

```
class {'freight':
    config_gpgkey => 'email@email.com',
}
```

Expert case

```
class {'freigh':
  config_gpgkey          => 'email@email.com',
  config_varlib          => '/var/lib/freight',
  config_varcache        => '/var/cache/freight',
  config_origin          => 'Freight',
  config_label           => 'Freight',
  config_cache           => true,
  config_gpg_digest_algo => 'SHA512',
  config_symlinks        => true,

  install_ensure         => 'present',

  manage_install         => true,
  manage_config          => true,
}
```

The `manage_install` set to false will skip the package installation while the `manage_config` set to false will skip the config file creation. If you do set those value to false, it is up to you to call `::freight::config` and `::freight::install`.

##Pacakge source

This module does not handle the source for you. It is up to you to setup your package source before calling this module. See https://github.com/freight-team/freight for more info about the package sources.


Here is an example of handling the source for Debian use the puppetlabs apt module:

```
  apt::key { "Add key: 30EBF4E73CCE63EEE124DD278E6DA8B4E158C569 from Apt::Source freight-repo":
    ensure      => 'persent',
    id          => '30EBF4E73CCE63EEE124DD278E6DA8B4E158C569',
    source      => 'https://swupdate.openvpn.net/repos/repo-public.gpg',
  }

  apt::source { 'freight-repo':
    ensure   => 'present',
    location => 'http://build.openvpn.net/freight_team',
    release  => $::lsbdistcodename, #wheezy or jessie or whatever the codename of the distribution is.
    repos    => 'main',
    require  => Apt::Key["Add key: 30EBF4E73CCE63EEE124DD278E6DA8B4E158C569 from Apt::Source freight-repo"]
  }
```

The reason we don't handle the source directly in the module is because every user has their own way of handling the package source and it would be a shame to enforce source handling in a way that would conflict with the way other user handles package sources.
