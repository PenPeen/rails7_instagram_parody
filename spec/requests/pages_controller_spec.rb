require 'rails_helper'

RSpec.describe "PagesControllers", type: :request do
  describe "#home" do
    let(:title) {"トップページ（仮）"}

    it "記事一覧ページを表示する" do
      get '/pages/home'
      expect(response).to have_http_status 200
    end

    it "トップページの文字列が表示される" do
      get "/pages/home"
      expect(response.body).to include("<p>#{title}</p>")
    end
  end
end
