class CreateCdxAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :cdx_assets do |t|
      t.text :file_data
      t.timestamps
    end
  end
end
