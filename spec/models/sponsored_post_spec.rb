require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do

  let(:my_topic) { create(:topic) }
  let(:post) { create(:sponsored_post, topic: my_topic) }
  it { is_expected.to belong_to(:topic) }

  describe "attributes" do
    it "has title and body attributes" do
      expect(post).to have_attributes(title: post.title, body: post.body, price: post.price )
    end
  end
end
