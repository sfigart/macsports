class Baseball < Registration
  attr_accessible :pants_size, :special_requests, :player_nickname
  validates :pants_size,
            :presence => true
  
  def abbr
    "BB"
  end
end