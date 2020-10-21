require 'rails_helper'

RSpec.describe StatsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #clear' do
    before do
      post :clear
    end

    it 'deletes all languages' do
      expect(Language.count).to be 0
    end

    it 'deletes all repositories' do
      expect(Repository.count).to be 0
    end
  end

  describe 'POST #refresh' do
    it 'enqueues GithubFetchJob' do
      ActiveJob::Base.queue_adapter = :test
      expect { post(:refresh) }.to have_enqueued_job(GihubFetchJob)
    end
  end
end
