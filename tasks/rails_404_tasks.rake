namespace :generate do
  desc 'generate static 404 and 500 pages'
  task :static_pages => :environment do
    require 'action_controller/integration'
    app = ActionController::Integration::Session.new
    app.host = APP_CONFIG[:site_url] if APP_CONFIG
    ['404', '500'].each do |action|
      app.get "/pregenerate/#{action}" 
      File.open("public/#{action}.html", "w") { |f| f.write app.response.body }
    end
  end
end