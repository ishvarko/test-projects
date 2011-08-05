class User < ActiveRecord::Base
  validates :username, :presence => true, :uniqueness => true
  validates :password, :confirmation => true
  
  def User.auth(username, password)
    if user = User.find_by_username(username)
      if user.password == password
        user
      end
    end
  end
end
