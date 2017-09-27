class CreateCdxAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :cdx_attachments do |t|
      t.string :name, null: false, length: 45
      t.references :record, null: false, polymorphic: true, index: false
      t.references :asset, null: false
      t.timestamps
    end
  end
end
