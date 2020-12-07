FactoryBot.define do
  factory :offer do
    advertiser_name  { "Orcafascio" }
    url { "https://orcafascio.com" }
    description { "Get 50% off at any plan" }
    starts_at { Time.zone.now }
    ends_at { (Time.zone.now + 15.days) }
    premium { true }
  end
end
