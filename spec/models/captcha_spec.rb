require 'spec_helper'

describe 'Captcha' do

  before do
    @captcha = Captcha.new("The quick brown fox jumped over the lazy dog.", ["quick", "brown"])
   end

  it "can be initialized" do
    expect(@captcha).to be_an_instance_of(Captcha)
  end

  it 'can have a text attribute' do
    expect(@captcha.text).to eq("The quick brown fox jumped over the lazy dog.")
  end

  it 'can have an array datatype of exlcuded words' do
    expect(@captcha.exclude.kind_of?(Array)).to eq(true)
  end

  it 'A count of the frequency of every word in the text excluding words from the list' do
   expect(@captcha.word_frequency.kind_of?(Hash)).to eq(true)
  end

  it 'returns true if user input is correct' do
   expect(@captcha.validateWordCount(@captcha.word_frequency, "7")).to eq(true)
  end

  it 'does not return true if user input is not correct' do
   expect(@captcha.validateWordCount(@captcha.word_frequency, "8")).to eq(false)
  end

end
