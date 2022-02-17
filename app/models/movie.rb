class Movie < ApplicationRecord
  before_destroy :check_children
  has_many :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true, uniqueness: true

  private

  def check_children
    bookmarks.any?
  end
end
