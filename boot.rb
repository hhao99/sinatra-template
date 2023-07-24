# require sinatra gems
require 'sinatra'

# load environments
require 'dotenv/load'

# require active support

# autoloader
require 'require_all'

# development required
if development?
    require 'sinatra/reloader'
    require 'better_errors'
    require 'pry'
    require 'pry-remote'
end

# init logging
require 'logger'
logger = Logger.new(STDOUT)
logger.level = Logger::DEBUG
set :logger, logger

# database init
require 'sequel'

DB = Sequel.sqlite('db/app.sqlite3')
DB.loggers << logger
require_all 'models'

# load main app
require './application'
require_all 'controllers'
