class ChangeUsersSex < ActiveRecord::Migration
  def change
    change_column :users, :sex, 'integer USING CAST(sex AS integer)'
  end
end
