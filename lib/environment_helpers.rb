require_relative('../../config/environment')
APP_ROOT = Pathname.new File.expand_path("../../../", __FILE__)

module EnvironmentHelpers
  def staging_app

  end

  def production_app

  end

  def staging_remote
    "git@heroku.com:centralstation-staging.git"
  end

  def production_remote
    "git@heroku.com:centralstation-production.git"
  end

  def live_data_dir

    "#{APP_ROOT}/db/fill/live"
  end


end
