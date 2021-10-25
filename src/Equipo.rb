class Equipo

  attr_accessor :statistic

  def initialize(equipo)
      @statistic=equipo["equipo"]
    end

  def getGanados
    return @statistic["ganados"]
  end

  def getPerdidos
    return @statistic["perdidos"]
  end

  def getEmpatados
    return @statistic["perdidos"]
  end

  def getGolesFavor
    return @statistic["Goles a favor"]
  end

  def getGolesContra
    return @statistic["Goles en contra"]
  end

  def statisticToJson
    return @statistic.to_json
  end

end
