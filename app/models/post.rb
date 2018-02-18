class Post < ApplicationRecord
  belongs_to :topic, optional: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  after_create :create_vote
  after_create :create_favorite_for_post_author

  default_scope { order('rank DESC')}
  scope :visible_to, -> (user) { user ? all : joins(:topic).where('topics.public' => true) }
  scope :ordered_by_title, -> { order('title') }
  scope :ordered_by_reverse_created_at, -> { order('created_at') }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    votes.where(value: -1).count
  end

  def points
    votes.sum(:value)
  end

  def update_rank
    age_in_days = (created_at - Time.new(1970,1,1)) / 1.day.seconds
    new_rank = points + age_in_days
    update_attribute(:rank, new_rank)
  end

  private

  def create_vote
    user.votes.create!(post: self, value: 1)
  end

  def create_favorite_for_post_author
    self.favorites.create!(user: user)
    FavoriteMailer.new_post(user, self).deliver_now
  end

end
