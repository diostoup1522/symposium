class CreateDiscussions < ActiveRecord::Migration[8.1]
  def change
    create_table :discussions do |t|
      t.string :book
      t.string :author
      t.string :description
      t.string :creator_id

      t.timestamps
    end
  end
end
