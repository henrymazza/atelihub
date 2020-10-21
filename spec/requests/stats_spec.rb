require 'rails_helper'

RSpec.describe 'Stats', type: :request do
  describe 'GET /stats' do
    it 'returns HTTP ok' do
      get stats_index_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /clear' do
    it 'redirects to index after clearing data' do
      post '/clear'
      expect(response).to redirect_to('/stats/index')
    end
  end

  describe 'POST /refresh' do
    it 'redirects to index after firing data refresh' do
      post '/refresh'
      expect(response).to redirect_to('/stats/index')
    end
  end
end
