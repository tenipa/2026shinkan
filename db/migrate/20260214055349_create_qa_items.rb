class CreateQaItems < ActiveRecord::Migration[8.0]
  def change
    create_table :qa_items do |t|
      t.string :question
      t.text :answer
      t.integer :position

      t.timestamps
    end
  end
end
