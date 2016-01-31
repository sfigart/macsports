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
      'JrPinto' => 70,
      'Pinto' => 80,
      'Mustang' => 80,
      'Bronco' => 85,
      'Pony' => 85
    }
    fees[self.division]
  end

end