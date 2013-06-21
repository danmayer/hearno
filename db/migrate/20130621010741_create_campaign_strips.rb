class CreateCampaignStrips < ActiveRecord::Migration
  def change
    create_table :campaign_strips do |t|
      t.string :title
      t.text :description
      t.references :creator
      t.references :parent
      t.references :campaign

      t.timestamps
    end
    add_index :campaign_strips, :creator_id
    add_index :campaign_strips, :parent_id
    add_index :campaign_strips, :campaign_id
  end
end
