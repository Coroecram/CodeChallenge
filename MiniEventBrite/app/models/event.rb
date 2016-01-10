class Event < ActiveRecord::Base
  has_many :invitations
  has_many :invited,   -> {where(confirmation: false)}, class_name: 'Person', through: :invitations
  has_many :attendees, -> {where(confirmation: true)},  class_name: 'Person', through: :invitations
end
