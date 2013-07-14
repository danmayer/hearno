class UpdateCampaignElementAssocaition < ActiveRecord::Migration
  def up
    add_column :campaign_elements, :campaign_strip_id, :integer
    add_index :campaign_elements, :campaign_strip_id
  end

  def down
    remove_column :campaign_elements, :campaign_strip_id
  end
end
