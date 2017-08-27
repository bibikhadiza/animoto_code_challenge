class Captcha

attr_accessor :text, :exclude, :word_frequency

  @@all = [];

  def initialize(text)
    @text = text
    @exclude = generate_excluded_words
    @word_frequency = generate_word_frequency
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(text)
    @@all.each do |e|
      if e.text === text
        return e
      end
    end

  end

  def validateWordCount(word_frequency, user_input)
    
  end

  private

  def generate_excluded_words
    exclude = []
    words_array = text.downcase.gsub(/[!,.?-]/,'').split.uniq

    if words_array.length == 1
      return exclude
    elsif words_array.length >= 2 && words_array.length < 4
      exclude << words_array.first
    else
     number_of_words_to_exclude = ((words_array.length / 2) / 2).floor
     exclude = words_array.sample(number_of_words_to_exclude)
    end
    return exclude
  end

  def generate_word_frequency
     words_array = text.downcase.gsub(/[!,.?]/,'').split.delete_if {|word| exclude.include?(word) }
    counts_hash = {}

    words_array.each do |word|
      counts_hash.keys.include?(word) ? counts_hash[word] += 1 : counts_hash[word] = 1
    end
    @word_frequency ||= counts_hash
  end



end
