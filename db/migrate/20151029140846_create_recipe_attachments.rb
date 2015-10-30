class CreateRecipeAttachments < ActiveRecord::Migration
  def change
    create_table :recipe_attachments do |t|
      t.references :recipe, index: true, foreign_key: true
      t.string :image

      t.timestamps null: false
    end
  end
end
