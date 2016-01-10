class Event < ActiveRecord::Base
  has_many :invitations
  has_many :invited,   -> { merge(Invitation.invited) }, through: :invitations, source: :person
  has_many :attendees, -> { merge(Invitation.confirmed) }, through: :invitations, source: :person

  validates :name, presence: true, uniqueness: { scope: :date }
  validates :date, uniqueness: { scope: :name }
  validate :date_or_to_be_decided

  private
    def date_or_to_be_decided
      date ||= DateTime.new(1675, 3, 4)
    end
end
