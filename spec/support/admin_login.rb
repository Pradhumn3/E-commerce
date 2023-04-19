module AdminLogin
  def set_admin_user
    before(:each) do
      @admin = AdminUser.find_or_create_by(email: 'admin@example.com')
      @admin.password = 'password'
      @admin.save
      sign_in(@admin)
    end
  end
end
