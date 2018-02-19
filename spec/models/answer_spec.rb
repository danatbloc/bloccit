require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:my_question) { create(:question) }
  let(:answer) { create(:answer, question: my_question) }

  describe "attributes" do
    it "has a body attribute" do
      expect(answer).to have_attributes(body: answer.body)
    end
  end

end
