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

DB = Sequel.connect("sqlite://./db/dev.sqlite3")
DB.loggers << logger


if development?
   unless DB.table_exists?(:users)
        DB.create_table(:users) do
            primary_key :id
            column :name, String
            column :age, Integer
        end
    end
    users = DB[:users]
    users.insert(name: "eric", age: 52)
    users.insert(name: "sophia", age: 45)
end

require_all 'models'

# load main app
require './application'

require_all 'controllers'
