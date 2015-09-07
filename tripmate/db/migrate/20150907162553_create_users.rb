class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :photo_path
      t.string :sex
      t.datetime :birthday
      t.string :nationality

      t.timestamps
    end
  end
end
