class AddCommentTable < ActiveRecord::Migration
  def change
    create_table(:comments) do |t|
      t.string 'text', null: false, default: ''
      t.integer 'post_id', null: false
      t.integer 'user_id', null: false
    end
  end
end
