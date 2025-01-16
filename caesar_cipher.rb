# frozen_string_literal: true

# method to find which letter index of the alphabet
def find_letter_index(letter)
  # set up the letters array, alphabet
  alphabet = %w[a b c d e f g h i j k l m n o p q r s t u
                v w x y z]
  alphabet.find_index(letter)
end

# method to shift the letter index
def index_shift(index, shift)
  (index + shift) % 26 # this ensures the 'wrapping' of the array is met - modulus can get our adusted index via remainder
end

# encrypt the string!
def caesar_cipher(string, shift)
  alphabet = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z] # set up the alphabet letters array
  result = [] # result array
  string_downcase = string.downcase
  string_downcase.split('').each_with_index do |char, index|
    if alphabet.include?(char) # check if the character is an alphabet letter
      if string[index] == char.upcase # if the letter was capitalized, ensure it stays capitalized while encrypted
        result.push(alphabet[index_shift(find_letter_index(char), shift)].upcase)
      else # else push the encrypted letter
        result.push(alphabet[index_shift(find_letter_index(char), shift)])
      end
    else # if not an alphabet letter then push the character from the original string
      result.push(string[index])
    end
  end
  p result.join
end

# call the function to test if it works!
caesar_cipher('Test ing!', 2)
caesar_cipher('My name is... what??', 3)
caesar_cipher('this is a very long string that is used as a placeholder to test out the Caesar Cipher problem', 37)
