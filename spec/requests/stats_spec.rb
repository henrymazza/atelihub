require 'rails_helper'

RSpec.describe 'Stats', type: :request do
  describe 'GET /stats' do
    it 'returns HTML' do
      get stats_index_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /clear' do
    it 'clears data and redirect to index' do
      post '/clear'
      expect(response).to redirect_to('/stats/index')
    end
  end

  describe 'POST /refresh' do
    it 'fire data refresh' do
      post '/refresh'
      expect(response).to redirect_to('/stats/index')
    end
  end
end
