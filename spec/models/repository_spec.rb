require 'rails_helper'

RSpec.describe Repository, type: :model do
  context 'when language is blank' do
    subject(:repository) { Repository.new }

    it 'is invalid record' do
      expect(repository.valid?).to be false
    end
  end

  context 'when language is filled' do
    subject(:repository) { Repository.new language: Language.new(name: 'lang') }

    it 'is a valid record' do
      expect(repository.valid?).to be true
    end
  end
end
