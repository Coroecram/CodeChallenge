class Invitation < ActiveRecord::Base
  belongs_to :person
  belongs_to :event

  validates :event_id, presence: true
  validates :person_id, presence: true

  scope :invited, ->{ where(confirmation: false) }
  scope :confirmed, ->{ where(confirmation: true) }

  def confirm
    update(confirmation: true)
  end
end
