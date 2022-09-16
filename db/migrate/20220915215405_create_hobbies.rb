class CreateHobbies < ActiveRecord::Migration[7.0]
  def change
    create_table :hobbies do |t|
      t.string :hobbies

      t.timestamps
    end
    add_index :hobbies, :hobbies, unique: true
  end
end
