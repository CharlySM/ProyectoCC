require 'singleton'

class Utils

  include Singleton

  def getCollection(collection)
      map=collection.find.to_a
      map=JSON.pretty_generate(map)
      map=JSON.parse(map)
      return map
  end

  def searchIntoJson(email, users)
      key="email"
      esta=false
      users.each { |x|
        x.map{|k, v|
          if(k == key and v == email)
            esta = true
          end
          }
        }
      return esta
  end
end
