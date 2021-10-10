class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :sex
      t.string :phone
      t.date :birthdate
      t.text :about_me

      t.timestamps
    end
  end
end
