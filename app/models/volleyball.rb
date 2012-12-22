class Volleyball < Registration
  validates :has_geographic_exception, :inclusion => {:in => [true, false], :message => "can't be blank"}
  validates :lives_in_district, :inclusion => {:in => [true, false], :message => "can't be blank"}
  
  def abbr
    "VB"
  end
end