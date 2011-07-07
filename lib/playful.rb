module Playful
  @@dictionary = { 
    '0' => 'scooter',
    '1' => 'car',
    '2' => 'bicycle',
    '3' => 'trike',
    '4' => 'bus',
    '5' => 'train',
    '6' => 'plane',
    '7' => 'glider',
    '8' => 'jetski',
    '9' => 'tank',
    '00' => 'black',
    '10' => 'green',
    '20' => 'orange',
    '30' => 'blue',
    '40' => 'purple',
    '50' => 'red',
    '60' => 'yellow',
    '70' => 'white',
    '80' => 'pink',
    '90' => 'silver',
    '000' => 'reflective',
    '100' => 'shiny',
    '200' => 'dull',
    '300' => 'creaky',
    '400' => 'clear',
    '500' => 'metallic',
    '600' => 'buffed',
    '700' => 'rusty',
    '800' => 'translucent',
    '900' => 'tarnished',
    '0000' => 'tiny',
    '1000' => 'huge',
    '2000' => 'small',
    '3000' => 'puny',
    '4000' => 'towering',
    '5000' => 'gigantic',
    '6000' => 'mini',
    '7000' => 'wee',
    '8000' => 'hulking',
    '9000' => 'jumbo',
    '00000' => 'enormous'
    
  }
  
  def self.code_word
    'secret'
  end
  
  def self.word_for_number(number)
    if @@dictionary[number.to_s].nil?
      word = number.to_s
    else
      word = @@dictionary[number.to_s]
    end
    
    return word  
  end
  
  def self.number_for_word(word)
    if @@dictionary.invert[word].nil?
      num = @@dictionary.invert[word]
    else
      num = @@dictionary.invert[word]
    end
    
    return num.to_i
  end
end

class String
  def playful_to_i
    numbers = self.split('-').reverse
    
    total = 0
    numbers.each_with_index do |num,pos|
      total += Playful::number_for_word(num)
    end
    return total
  end
end


class Integer
  def to_playful(current_digit=1)
    # number % 10^current_digit - all other digits
    current_num = self % (10**current_digit) - self % (10**(current_digit-1))
    if current_digit == self.to_s.size
      return Playful::word_for_number current_num
    else
      
      if current_digit > 1 && current_num == 0
        word = Playful::word_for_number('0' * current_digit)
      else
        word = Playful::word_for_number(current_num)
      end
      
      return "#{self.to_playful(current_digit+1)}-#{word}"
    end
  end
end