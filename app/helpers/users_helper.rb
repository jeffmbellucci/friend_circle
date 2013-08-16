module UsersHelper
  def compare_password_and_confirmation(pass, conf)
    if pass == conf
      return pass
    else
      flash.now[:message] = "Password and Confirmation do not match"
    end
    nil
  end
end
