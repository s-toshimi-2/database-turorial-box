class postgresql::config {
    file { '/var/lib/pgsql/9.3/data/pg_hba.conf':
        ensure  => present,
        owner   => 'postgres',
        group   => 'postgres',
        mode    => '0600',
        content => template('postgresql/pg_hba.conf')
    }
}
