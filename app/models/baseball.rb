class Baseball < Registration
  attr_accessible :pants_size, :special_requests, :player_nickname, :emergency_name, :emergency_phone
  validates :pants_size,
            :emergency_name,
            :emergency_phone,
            :presence => true
            
  def abbr
    "BB"
  end

  def payment_amount
    fees = {
      'JrPinto' => 65,
      'Pinto' => 75,
      'Mustang' => 75,
      'Bronco' => 80,
      'Pony' => 80
    }
    fees[self.division]
  end

end