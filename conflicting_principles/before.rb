class SessionsController

  def create
    user = log_user_in
    if user.cards.all?(&:invalid?)
      user.disable!
      user.send_disable_notification!
    end
  end

end

class User
  
  def disable!
  end

  def send_disable_notification!
  end
  
end
