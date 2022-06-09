FactoryBot.define do
  factory :post do
    item_name          {"じじ"}
    price              {500}
    brand_id           {2}
    category_id        {2}
    etc                {"ジジ"}

    association :user


  end
end