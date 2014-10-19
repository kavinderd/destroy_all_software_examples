# In the episode, Bernhardt notices that in before.rb 
# there was a violation of the law of demeter, as SessionsController
# was accessing a method on an attribute of user. Therefore, 
# he creates a method in user to handle this
class SessionsController

  def create
    user = log_user_in
    user.enforce_good_standing!
  end

end

class User

  def enforce_good_standing!
    if cards.all?(&:invalid?)
      disable!
      send_disable_notification!
    end
  end
  
  def disable!
  end

  def send_disable_notification!
  end
  
end
