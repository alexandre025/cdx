class CreateCdxAssets < ActiveRecord::Migration[5.1]
  def up
    create_table :cdx_assets do |t|
      t.timestamps
    end

    add_attachment :cdx_assets, :attachment
  end

  def down
    drop_table :cdx_assets
  end
end
