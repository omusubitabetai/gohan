class HomesController < ApplicationController

  def top
    @user = current_user if user_signed_in?
    #@admin = current_admin if admin_signed_in?
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: "guest_user@email.com",
                                   user_name: "テストさん",
                                   last_name: "test",
                                   first_name: "user",
                                   last_name_kana: "テスト",
                                   first_name_kana: "ユーザー",
                                   postal_code: "012-3456",
                                   address: "東京都",
                                   phone_number: "00-0000-0000"
                                   ) do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました。"
  end
end
