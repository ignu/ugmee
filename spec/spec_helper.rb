PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")

Spec::Runner.configure do |conf|
  conf.include Rack::Test::Methods
end

def app

  case Padrino.env
    when :development then DataMapper.setup(:default, "sqlite3://" + Padrino.root('db', "development.db"))
    when :production  then DataMapper.setup(:default, "sqlite3://" + Padrino.root('db', "production.db"))
    when :test        then DataMapper.setup(:default, "sqlite3://" + Padrino.root('db', "test.db"))
  end


  DataMapper.auto_upgrade!

  Ugmee.tap { |app|  }
end
