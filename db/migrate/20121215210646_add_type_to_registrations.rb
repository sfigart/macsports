class AddTypeToRegistrations < ActiveRecord::Migration
  class Registration < ActiveRecord::Base
  end
  
  def change
    add_column :registrations, :type, :string
    Registration.reset_column_information
    Registration.all.each do |registration|
      registration.type = registration.activity.camelize
      registration.save
    end
  end
end
