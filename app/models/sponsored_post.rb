class SponsoredPost < ApplicationRecord
  belongs_to :topic, optional: true
end
