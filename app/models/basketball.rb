class Basketball < Registration
  attr_accessible :pants_size, :special_requests
  validates :pants_size,
            :presence => true
  
  def abbr
    "BK"
  end
end