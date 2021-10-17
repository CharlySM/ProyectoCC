class User
attr_accessor :name, :email, :user_name, :password, :Id

def initialize(name, email, pass, u_name)
    @name = name
    @email = email
    @password = pass
    @user_name = u_name
  end

def params_to_doc(id)
  doc={_id:"#{id}",
  "name":"#{name}",
  "email":"#{email}",
  "user_name":"#{user_name}",
  "password":"#{password}"}
  return doc
end
end
