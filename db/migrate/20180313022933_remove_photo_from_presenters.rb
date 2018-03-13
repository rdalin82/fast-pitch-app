class RemovePhotoFromPresenters < ActiveRecord::Migration[5.0]
  def change
    remove_column :presenters, :photo, :string
  end
end
