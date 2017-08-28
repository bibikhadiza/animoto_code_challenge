class Captcha

  attr_accessor :text, :exclude, :word_frequency

  def initialize(text, exclude = nil, word_frequency = nil)
    @text = text
    @exclude = exclude ? exclude : generate_excluded_words
    @word_frequency = word_frequency ? word_frequency : generate_word_frequency
  end

  def validateWordCount(word_frequency, user_input)
    frequency_count = nil
    if word_frequency.keys.length == 1
      frequency_count = word_frequency.keys.count
    else
      frequency_count = word_frequency.values.inject(0, :+)
    end

    if frequency_count == user_input.to_i
      true
    else
      false
    end
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
