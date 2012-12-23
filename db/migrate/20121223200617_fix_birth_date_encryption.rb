class FixBirthDateEncryption < ActiveRecord::Migration
  def up
    registrations = Registration.all
    registrations.each do |reg|
      reg.update_attribute(:birth_date,
          Date.parse(Registration.decrypt(:birth_date, reg.encrypted_birth_date, {:marshal => false}))
        )
    end
  end

  def down
  end
end
