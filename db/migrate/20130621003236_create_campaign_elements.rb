class CreateCampaignElements < ActiveRecord::Migration
  def change
    create_table :campaign_elements do |t|
      t.string :title
      t.text :description
      t.attachment :picture

      t.timestamps
    end
  end
end
