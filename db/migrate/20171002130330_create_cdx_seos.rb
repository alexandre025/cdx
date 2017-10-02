class CreateCdxSeos < ActiveRecord::Migration[5.1]
  def change
    create_table :cdx_seos do |t|
      t.hstore :meta
      t.hstore :og
      t.timestamps
    end
  end
end
