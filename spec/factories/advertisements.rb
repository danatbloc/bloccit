FactoryBot.define do
  factory :advertisement do
    title RandomData.random_sentence
    copy RandomData.random_paragraph
    price 50
  end
end
