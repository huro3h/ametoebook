require 'rails_helper'

describe ArticlesController, type: :controller do
  describe 'index' do
    it 'ステータスコード200を返す' do
      get :index
        expect(response.status).to eq(200)
    end
  end
end
