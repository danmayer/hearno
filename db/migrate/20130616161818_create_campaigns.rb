class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :description
      t.boolean :published
      t.attachment :image
      
      t.timestamps
    end
  end
end
