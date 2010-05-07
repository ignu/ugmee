class Ugmee < Padrino::Application
  configure do
    register SassInitializer
 
    Compass.configuration do |config|
      config.project_path = File.dirname(__FILE__)
      config.sass_dir = "stylesheets"
      config.project_type = :stand_alone
      config.http_path = "/"
      config.css_dir = "stylesheets"
      config.images_dir = "images"
      config.output_style = :compressed
    end
 
    Sass::Plugin.options.merge!(Compass.sass_engine_options)
  end
 
  get '/stylesheets/:file.css' do
    content_type 'text/css', :charset => 'utf-8'
    sass :file
  end

  get '/' do
    redirect("/meetings/")
  end

  set :haml, { :format => :html5 }
  
end
