FactoryBot.define do
  factory :sponsored_post do
    title RandomData.random_sentence
    body RandomData.random_paragraph
    price 50
    topic
  end
end
