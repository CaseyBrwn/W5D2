class ChangeSubs < ActiveRecord::Migration[5.2]
  def change
    remove_index :subs, :title
    add_index :subs, [:title, :moderator_id], unique: true
  end
end
