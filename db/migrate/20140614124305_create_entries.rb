class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :name
      t.text :text
      t.string :file

      t.timestamps
    end
  end
end
