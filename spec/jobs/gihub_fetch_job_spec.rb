require 'rails_helper'

RSpec.describe GihubFetchJob, type: :job do
  describe '#perform' do
    subject(:perform) { described_class.new.method(:perform) }
    let(:lang) { Language.create! name: 'ruby' }

    it 'refreshes language list' do
      VCR.use_cassette('github_fetch_job_api') do
        expect { perform.call(lang) }.to change { Language.count }.by ENV['LANGS'].split(', ').size
      end
    end

    it 'fetches repositories from GitHub' do
      VCR.use_cassette('github_fetch_job_api') do
        expect { perform.call(lang) }.to change { Repository.count }.by 30
      end
    end
  end
end
