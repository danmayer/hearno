# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campaign_strip do
    title "MyString"
    description "MyText"
    creator nil
    parent nil
    campaign nil
  end
end
