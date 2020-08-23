class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_events, class_name: "Event", foreign_key: "creator_id"
  has_many :meetings, foreign_key: "attendee_id"
  has_many :attended_events, through: :meetings

  def invite(user, event)
    user.invited += "#{event.id},"
  end
end
