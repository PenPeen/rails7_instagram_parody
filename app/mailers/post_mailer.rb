class PostMailer < ApplicationMailer

    # 
    # 記事投稿時にメールを送信するメソッド
    # 
    def send_when_posts(user)
        # Mailビューで使用
        @user = user;
        mail to: user.email, subject: '【通知】記事が投稿されました'
    end

end
