require 'rails_helper'

RSpec.describe PostsController, type: :request do
  let!(:user){FactoryBot.create(:user)}

  describe "#index" do
    context "ログインユーザーの場合" do
      it "記事一覧ページにアクセスできること" do
        sign_in user
        get posts_path
        expect(response).to have_http_status 200
      end
    end

    context "ゲストユーザーの場合" do
      it "リダイレクトされること" do
          get posts_path
          expect(response).to have_http_status 302
      end

      it "ログインページにリダイレクトされること" do
        get posts_path
        expect(response).to redirect_to '/users/sign_in'
      end
    end

  end

  describe "#new" do
    context "ログインユーザーの場合" do
      it "記事の作成ページにアクセスできること" do
        sign_in user
        get new_post_path
        expect(response).to have_http_status(200)
      end
    end

    context "ゲストユーザーの場合" do
      it "リダイレクトされること" do
        get posts_path
        expect(response).to have_http_status 302
      end

      it "ログインページにリダイレクトされること" do
        get posts_path
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  # Formオブジェクトを使用しているため、別途対応
=begin
  describe "#create" do
    context "ログインユーザーの場合" do
      it "保存が行われること" do
        post_params = FactoryBot.attributes_for(:post)
        binding.pry
        post posts_path, params: {post_params}
      end

      it "データが不整合の場合、保存がされないこと"

      it "保存後、リダイレクトされること"
    end

    context "ゲストユーザーの場合" do
      it "保存がされないこと"
      it "リダイレクトされること"
    end
  end
=end

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

