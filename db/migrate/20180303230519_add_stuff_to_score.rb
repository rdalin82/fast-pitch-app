class AddStuffToScore < ActiveRecord::Migration[5.0]
  def change
    add_column :scores , :presenter_id, :integer
    add_column :scores , :user_id, :integer
  end
end
