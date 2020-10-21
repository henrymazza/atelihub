require 'rails_helper'

RSpec.describe Repository, type: :model do
  context 'when language is blank' do
    subject(:repository) { Repository.new }

    it 'is invalid record' do
      expect(repository.valid?).to be false
    end
  end

  context 'when language is filled' do
    subject(:repository) { build :repository }

    it 'is a valid record' do
      expect(repository.valid?).to be true
    end
  end

  context 'when owner is missing' do
    subject(:repository) { build :repository, owner: nil }

    it 'is not a valid record' do
      expect(repository.valid?).to be false
    end
  end

  context 'when readme is missing' do
    subject(:repository) { build :repository, readme: nil }

    it 'is not a valid record' do
      expect(repository.valid?).to be false
    end
  end
end
