class CreateMessages < ActiveRecord::Migration[8.1]
  def change
    create_table :messages do |t|
      t.integer :messenger_id
      t.integer :messaged_discussion_id
      t.string :messagetext

      t.timestamps
    end
  end
end
