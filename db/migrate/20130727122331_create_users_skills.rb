class CreateUsersSkills < ActiveRecord::Migration
  def change
  	create_table :users_skills do |t|
  		t.belongs_to :user
  		t.belongs_to :skill
  		t.integer :proficiency, default: 0

  		t.timestamps
  	end
  end
end
