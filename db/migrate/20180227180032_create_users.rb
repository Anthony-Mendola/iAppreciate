class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
    end
  end
end


#The change method is actually a shorter way of writing up and down methods.
#While the rollback (down) method is not included, it's implicit in the change method.
