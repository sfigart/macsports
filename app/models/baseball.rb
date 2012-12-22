class Baseball < Registration
  attr_accessible :pants_size, :special_requests, :player_nickname, :emergency_name, :emergency_phone
  validates :pants_size,
            :emergency_name,
            :emergency_phone,
            :presence => true
            
  def abbr
    "BB"
  end
end