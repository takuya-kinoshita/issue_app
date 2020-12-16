class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string :name
      t.string :title
      t.text :body
      t.string :responsible
      t.string :deadline

      t.timestamps
    end
  end
end
