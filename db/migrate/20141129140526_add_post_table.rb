class AddPostTable < ActiveRecord::Migration
  def change
    create_table(:posts) do |t|
      t.string 'title',   default: '',  null: false
      t.string 'text',    default: ''
    end

    add_index :posts, :title, unique: true
  end
end
