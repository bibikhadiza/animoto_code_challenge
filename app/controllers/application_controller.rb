

class ApplicationController < Sinatra::Base

  require 'pry'

  configure do
  	set :views, "app/views"
  	set :public_dir, "public"
  end

  get "/" do
    files = %w(texts/0 texts/1 texts/2 texts/3 texts/4 texts/5)
    text_file = files.sample
    source_text = File.read(text_file).strip
    captcha = Captcha.new(source_text)
    erb :home, locals: { captcha: captcha }
  end




end
