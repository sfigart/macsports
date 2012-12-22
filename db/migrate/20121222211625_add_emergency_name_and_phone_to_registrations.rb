class AddEmergencyNameAndPhoneToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :emergency_name, :string
    add_column :registrations, :emergency_phone, :string
  end
end
