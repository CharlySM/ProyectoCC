class Equipo

  attr_accessor :statistic

  def initialize(equipo)
      @statistic=equipo["equipo"]
    end

  def statisticToJson
    return @statistic.to_json
  end

end
