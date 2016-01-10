class Event < ActiveRecord::Base
  has_many :invitations
  has_many :invited,   -> {where(confirmation: false)}, class_name: 'Person', through: :invitations
  has_many :attendees, -> {where(confirmation: true)},  class_name: 'Person', through: :invitations

  validates :name, presence: true, uniqueness: { scope: :date }
  validates :date, uniqueness: { scope: :name }
  validate :date_or_to_be_decided

  private
    def date_or_to_be_decided
      date ||= DateTime.new(1675, 3, 4)
    end
end
