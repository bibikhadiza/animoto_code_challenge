  require 'pry'

class ApplicationController < Sinatra::Base


  configure do
  	set :views, "app/views"
  	set :public_dir, "public"
  end

  get "/" do
    files = %w(texts/0 texts/1 texts/2 texts/3 texts/4 texts/5)
    text_file = files.sample
    source_text = File.read(text_file).strip
    captcha = Captcha.new(source_text)
    erb :home, locals: { text: captcha.text, exclude: captcha.exclude, word_frequency: captcha.word_frequency}
  end

  post "/" do
    binding.pry
    captcha = Captcha.find(params.to_s["text"])

    captcha.text

  end




end
