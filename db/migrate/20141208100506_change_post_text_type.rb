class ChangePostTextType < ActiveRecord::Migration
  def change
    change_column :posts, :text, :text, default: '', null: false
  end
end
