class CreateDataTables < ActiveRecord::Migration[5.2]
  def change
    create_table :data_tables do |t|
      t.string :name
      t.string :position
      t.string :office
      t.integer :age
      t.string :start_date
      t.string :salary

      t.timestamps
    end
  end
end
