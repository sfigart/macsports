class AddSpecialRequestsToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :special_requests, :text
  end
end
