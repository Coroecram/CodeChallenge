class Event < ActiveRecord::Base
  has_many :invitations
  has_many :invited,   -> {where(invitations: {confirmation: false})}, through: :invitations, source: :person
  has_many :attendees, -> {where(invitations: {confirmation: true})}, through: :invitations, source: :person

  validates :name, presence: true, uniqueness: { scope: :date }
  validates :date, uniqueness: { scope: :name }
  validate :date_or_to_be_decided

  private
    def date_or_to_be_decided
      date ||= DateTime.new(1675, 3, 4)
    end
end
