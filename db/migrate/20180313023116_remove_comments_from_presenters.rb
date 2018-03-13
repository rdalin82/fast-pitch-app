class RemoveCommentsFromPresenters < ActiveRecord::Migration[5.0]
  def change
    remove_column :presenters, :comment, :string
  end
end
