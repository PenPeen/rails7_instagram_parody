require 'rails_helper'

RSpec.describe "PostControllers", type: :request do
  let!(:user){FactoryBot.create(:user)}

  describe "GETリクエスト" do
    it "記事一覧ページにアクセスできること" do
      sign_in user
      get posts_path
      expect(response).to have_http_status(200)
    end

    it "記事の作成ページにアクセスできること" do
      sign_in user
      get new_post_path
      expect(response).to have_http_status(200)
    end
  end

  # TODO（あとで）
  # describe "POSTリクエスト" do

  #   it "記事の作成ができること" do
  #     sign_in user
  #     post sessions_path, params: 
  #     { 
  #       post_photos_form: {
  #         caption: 'タイトル1',
  #         image: File.new("#{Rails.root}/app/assets/images/no_image.jpg")
  #       } 
  #     }
  #     expect(response).to have_http_status(200)
  #     expect(response.body).to match("投稿が保存されました")
  #   end

  # end

end

