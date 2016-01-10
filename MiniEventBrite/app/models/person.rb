class Person < ActiveRecord::Base
  has_many :invitations, -> { merge(Invitation.invited) }, through: :invitations, source: :event
  has_many :events, -> { merge(Invitation.confirmed) }, through: :invitations, source: :event

  validates :firstname, presence: :true
  validates :lastname, presence: :true
end
