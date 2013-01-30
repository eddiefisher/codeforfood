class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  attr_protected

  validates_presence_of :title, :slug, :body

  def should_generate_new_friendly_id?
    new_record?
  end

  def to_liquid
    @to_liquid ||= PostDrop.new self
  end
end
