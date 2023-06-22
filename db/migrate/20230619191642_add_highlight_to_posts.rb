class AddHighlightToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :highlight, :integer, default: nil
  end
end
