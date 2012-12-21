module HomeHelper
  class Sport
    attr_reader :name, :path
    def initialize(name, path)
      @name = name
      @path = path
    end
  end
  
  def sports
    [
      Sport.new("Volleyball", home_volleyball_path),
      Sport.new("Baseball", home_baseball_path),
      Sport.new("Basketball", home_basketball_path),
      Sport.new("Football", home_football_path)
    ]
  end
end