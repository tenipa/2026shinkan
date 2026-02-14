class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :title
      t.integer :month
      t.text :description
      t.integer :position

      t.timestamps
    end
  end
end
