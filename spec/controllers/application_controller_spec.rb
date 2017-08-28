require 'spec_helper'

describe ApplicationController do
  describe "Application Controller" do

    describe "Homepage" do
      it 'loads the homepage' do
        get '/'
        expect(last_response.status).to eq(200)
      end
    end

    describe "Post request" do
      @captcha = Captcha.new("The quick brown fox jumped over the lazy dog.", ["quick", "brown"])
      params = {
       :text => "The quick brown fox jumped over the lazy dog.",
       :exclude => ["quick", "brown"].to_s,
       :user_input => "7",
       :word_frequency => @captcha.word_frequency.to_s
     }

      it 'responsed with 200 status if user input does not equal word count' do
        post '/', params
        expect(last_response.status).to eq(200)
      end

      it 'responds with 400 status if user input does not equal word count' do
        params[:user_input] = "9"
        post '/', params
        expect(last_response.status).to eq(400)
      end
    end

  end
end
