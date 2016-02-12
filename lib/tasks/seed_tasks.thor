class SeedTasks < Thor
  require_relative('../utilities/environment_helpers')
  include EnvironmentHelpers

  desc 'dump_and_seed_remote', 'get a dump from a remote environment'
  def dump_and_seed_remote(env="staging")
    dump_remote(env)
    seed_remote_dump
  end

  desc 'dump_remote', 'dump from remote environment'
  def dump_remote(env="staging")
    system "curl -o latest.dump `heroku pg:backups public-url --remote #{env}` "
  end

  desc 'seed_remote_dump', 'seed from remote dump'
  def seed_remote_dump
    system "pg_restore --verbose --clean --no-acl --no-owner -h localhost -U postgres -d centralstation_dev latest.dump"
  end

end