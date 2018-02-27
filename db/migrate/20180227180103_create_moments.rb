class CreateMoments < ActiveRecord::Migration
  def change
    create_table :moments do |t|
      t.string  :name
      t.integer :event_id
      t.integer :user_id
    end
  end
end
