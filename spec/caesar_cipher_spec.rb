require './caesar_cipher.rb'

alphabet = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z] # set up the alphabet letters array

RSpec.describe "find_letter_index" do
  it "returns the appropriate letter index when given a letter" do
    expect(find_letter_index('j')).to eq(9)
  end
  it "returns nil when given a number or non-alphanumeric character" do
    expect(find_letter_index(1)).to eq(nil)
  end
  it "returns an error when given a non-alphanumeric character" do
    expect{ find_letter_index(_) }.to raise_error(NameError)
  end
end

RSpec.describe "index_shift" do
  it "returns letter shifted from original letter index" do
    expect(alphabet[index_shift(find_letter_index('a'), 2)]).to eq('c')
  end
  it "returns letter shifted from original letter index when given a large shift value" do
    expect(alphabet[index_shift(find_letter_index('a'), 265)]).to eq('f')
  end
end

RSpec.describe "caesar_cipher" do
  it "returns correctly excrypted string when given input string" do
    expect(caesar_cipher('abc', 3)).to eq('def')
  end
  it "works with capitalization, spaces, and punctuation" do
    expect(caesar_cipher('Test ing!', 3)).to eq('Whvw lqj!')
  end
end