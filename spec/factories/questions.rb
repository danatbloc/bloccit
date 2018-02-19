FactoryBot.define do
  factory :question do
    body RandomData.random_paragraph
    title RandomData.random_sentence
    resolved false
  end
end
