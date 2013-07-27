class Skill < ActiveRecord::Base
  # Remember to create a migration!
  validates :name, :uniqueness => true
  has_many :users_skills
  has_many :users, through: :users_skills

  def user_with_proficiency(level)
  	### THIS CODE WILL WORK FOR MULTIPLE USERS WITH THE SAME SKILL LEVEL AND SKILL ID ###
  	user_ids = []
  	UsersSkill.find(:all, :conditions => ['proficiency = ? AND skill_id = ?', level, self.id]).each do |x|
  		user_ids << x.user_id
  	end
  	users = []
  	user_ids.each do |id|
  		users << User.find(id)
  	end
  	### THIS CODE WILL WORK FOR ONE USER WITH A SPECIFIC SKILL LEVEL AND SKILL ID ###
  	# User.find(UsersSkill.find(:all, :conditions => ['proficiency = ? AND skill_id = ?', level, self.id])[0].user_id)
  end

end
