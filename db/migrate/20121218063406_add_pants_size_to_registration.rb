class AddPantsSizeToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :pants_size, :string
  end
end
