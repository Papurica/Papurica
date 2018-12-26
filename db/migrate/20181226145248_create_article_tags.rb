class CreateArticleTags < ActiveRecord::Migration[5.2]
  def change
    create_table :article_tags do |t|
      t.integer :tag_id, :null => false
      t.integer :article_id, :null => false
      t.timestamps
    end
  end
end
