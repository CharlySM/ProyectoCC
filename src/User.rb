class User
attr_accessor :name, :email, :user_name, :password, :Id

def initialize(name, email, pass, u_name)
    @name = name
    @email = email
    @password = pass
    @user_name = u_name
  end
end
