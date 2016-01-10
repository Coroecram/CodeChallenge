class Person < ActiveRecord::Base
  has_many :invitations, -> {where(confirmation: false)}
  has_many :events, -> {where(confirmation: true)},  class_name: 'Event', through: :invitations

  validates :firstname, presence :true
  validates :lastname, presence :true
end
