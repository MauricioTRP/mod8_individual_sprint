class CreateIndustries < ActiveRecord::Migration[7.0]
  def change
    create_table :industries do |t|
      t.string :industry

      t.timestamps
    end
    add_index :industries, :industry, unique: true
  end
end
