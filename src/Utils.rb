require 'singleton'

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

  def getJson(file)
     map={}
     if File.file?(file)
       map=JSON.parse(IO.read(file))
     end
     return map
   end

 end
