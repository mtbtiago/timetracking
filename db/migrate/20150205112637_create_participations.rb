class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.integer :person_id
      t.integer :project_id
      t.timestamps null: false
    end
  end
end
