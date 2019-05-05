require 'rails_helper'

describe RankingController, type: :request do
  let!(:users) do
    create_list(:user, 15, total_points: rand(10000))
  end

  describe 'GET #index' do

    subject { get '/ranking' }

    it 'responds with success status 200' do
      subject
      expect(response).to have_http_status(200)
    end
  end
end
