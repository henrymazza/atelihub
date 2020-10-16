require 'rails_helper'

RSpec.describe Language, type: :model do
  context 'when name is blank' do
    subject(:language) { Language.new }
    it 'is not valid' do
      expect(language.valid?).to be false
    end
  end

  context 'when name is filled' do
    subject(:language) { Language.new name: 'lang' }
    it 'is valid' do
      expect(language.valid?).to be true
    end
  end
end
