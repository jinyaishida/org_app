FactoryBot.define do
  factory :post do
    item_name          {"じじ"}
    price              {500}
    brand_id           {2}
    category_id        {2}
    etc                {"ジジ"}

    association :user

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
    end
  end
end