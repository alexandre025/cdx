class CreateCdxAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :cdx_assets do |t|
      t.timestamps
    end

    add_attachment :cdx_assets, :file
  end
end
