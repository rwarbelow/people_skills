class Skill < ActiveRecord::Base
  # Remember to create a migration!
  validates :name, :uniqueness => true
  has_many :users_skills
  has_many :users, through: :users_skills, :source => :user

  def user_with_proficiency(level)
  	User.find(UsersSkill.find(:all, :conditions => ['proficiency = ? AND skill_id = ?', level, self.id])[0].user_id)
  end

end
