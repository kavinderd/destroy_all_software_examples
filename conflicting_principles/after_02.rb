# Improving on after_01, Bernhardt notices that pulling everything from 
# controllers to models will make fat models. Thus he pulls it out into a
# service class. However, because the #enforce method first asks the user
# its state and then performs actions based on it, there is a violation
# of tell don't ask. 
#
# so this example follows SRP but not Tell don't ask, however Bernhardt
# states he prefers to follow SRP. As the application changes, 
# the AccountStandingPolicy introduces a location aside from the model 
# for business logic to exist
class SessionsController

  def create
    user = log_user_in
    AccountStandingPolicy.new(user).enforce!
  end

end

class AccountStandingPolicy
  def initialize(user)
    @user = user
  end

  def enforce!
    if @user.cards.all?(&:invalid?)
      @user.disable!
      send_disable_notification!
    end
  end
  
  def send_disable_notification!
  end
end

class User
  
  def disable!
  end
end
