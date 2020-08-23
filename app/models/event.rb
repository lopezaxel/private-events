class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :meetings, foreign_key: "attended_event_id"
  has_many :attendees, through: :meetings

  scope :past, -> { where("date <= ?", Date.tomorrow) }
  scope :upcoming, -> { where("date > ?", Date.tomorrow) }

  def is_user_invitated?(user)
    events_id = user.invited.split(",").map { |id| id.to_i }
    events_id.include?(self.id)
  end
end
