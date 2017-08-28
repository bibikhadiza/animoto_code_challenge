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
    content_type :json
    word_frequency = eval(params["word_frequency"])
    captcha = Captcha.new(params["text"], params["exclude"], word_frequency)
    valid = captcha.validateWordCount(word_frequency, params["user_input"])

    if valid == true
      status 200
      params.to_json
    else
      status 400
      params.to_json
    end
  end

end
