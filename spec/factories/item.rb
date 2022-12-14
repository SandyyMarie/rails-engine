FactoryBot.define do
  factory :item, class: Item do
    name        {Faker::Commerce.product_name}
    description {Faker::Marketing.buzzwords}
    unit_price  {Faker::Number.within(range: 500..2000)}
    association :merchant, factory: :merchant
  end
end
