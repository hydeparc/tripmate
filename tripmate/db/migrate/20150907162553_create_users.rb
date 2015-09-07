class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
      t.string :photo_path
      t.string :sex, null: false
      t.datetime :birthday, null: false
      t.string :nationality, null: false

      t.timestamps
    end
  end
end
