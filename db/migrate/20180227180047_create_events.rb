class CreateEvents < ActiveRecord::Migration
  def change
      create_table :events do |t|
        t.string :name
        t.integer :user_id
      end
    end
  end
