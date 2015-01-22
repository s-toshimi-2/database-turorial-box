class postgresql::config {
    exec { 'init db':
        user    => 'root',
        command => '/sbin/service postgresql-9.3 initdb --encoding=UTF8 --no-locale',
        unless  => '/usr/bin/test -f /var/lib/pgsql/9.3/data/pg_hba.conf'
    }

    file { '/var/lib/pgsql/9.3/data/pg_hba.conf':
        ensure  => present,
        owner   => 'postgres',
        group   => 'postgres',
        mode    => '0600',
        content => template('postgresql/pg_hba.conf'),
        require => Exec['init db']
    }
}
