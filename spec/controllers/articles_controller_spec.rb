require 'rails_helper'

describe ArticlesController, type: :controller do
  before do
    get :index
  end

  describe 'index' do
    it 'ステータスコード200を返す' do
      expect(response.status).to eq(200)
    end
  end
end
