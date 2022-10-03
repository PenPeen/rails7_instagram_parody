require 'rails_helper'

RSpec.describe PagesController, type: :request do
  describe "#home" do
    let(:title) {"トップページ（仮）"}

    it "記事一覧ページを正しく表示できること" do
      get '/pages/home'
      expect(response).to have_http_status 200
    end

    it "タイトルが正しく表示されていること" do
      get "/pages/home"
      expect(response.body).to include("<p>#{title}</p>")
    end
  end
end
