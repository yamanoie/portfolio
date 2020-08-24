class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.integer :user_id
      t.boolean :occupation
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
