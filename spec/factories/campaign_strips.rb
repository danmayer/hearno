# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campaign_strip do
    title "MyString"
    description "MyText"
    creator nil
    parent nil
    campaign nil

    after_create do |campaign_strip|
      campaign = FactoryGirl.create(:campaign)
      campaign_strip.update_attribute(:campaign_id => campaign.id)
    end

  end

end
