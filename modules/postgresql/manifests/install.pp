class postgresql::install {
    package { 'pgdg-centos93-9.3-1.noarch':
        provider => 'rpm',
        ensure   => installed,
        source   => 'http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-centos93-9.3-1.noarch.rpm'
    }

    $packages = [
        'postgresql93-server',
        'postgresql93-contrib',
    ]

    package { $packages :
        ensure  => installed,
        require => Package['pgdg-centos93-9.3-1.noarch']
    }
}
