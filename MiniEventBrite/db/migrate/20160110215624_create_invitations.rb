class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :person_id, null: false
      t.integer :event_id, null: false
      t.boolean :confirmation, default: false
      
      t.timestamps null: false
    end
  end
end
