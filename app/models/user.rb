class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :users_skills
  has_many :skills, through: :users_skills, :source => :skill

  def proficiency_for(skill)
  	UsersSkill.find(:all, :conditions => ['user_id = ? AND skill_id = ?', self.id, skill.id])[0].proficiency
  end

  def set_proficiency_for(skill, level)
  	UsersSkill.find(:all, :conditions => ['user_id = ? AND skill_id = ?', self.id, skill.id])[0].update_attributes(:proficiency => level)
  end
end
