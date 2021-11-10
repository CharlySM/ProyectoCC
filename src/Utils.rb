require 'singleton'
require "httparty"

class Utils

  include Singleton

  def getCollection(collection)
      map=collection.find.to_a
      map=JSON.pretty_generate(map)
      map=JSON.parse(map)
      return map
  end

  def searchIntoJson(key, email, users)
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

  def getJson(team)
     map = HTTParty.get("http://rapi:8000/#{team}")
     return map
   end

   def getJson2(teams)
      map = HTTParty.get("http://rapi:8000/#{teams}")
      return map
    end

   def searchEmail(key, email, users)
       user=nil
       users.each { |x|
         x.map{|k, v|
           if(k == key and v == email)
             user = x
           end
           }
         }
       return user
   end

 end
