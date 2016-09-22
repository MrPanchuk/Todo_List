module Authorization
  def auth
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = User.create(email: 'test@test.ua', password: '11111111', password_confirmation: '11111111')
    sign_in user
  end
end