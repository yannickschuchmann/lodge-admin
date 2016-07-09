class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def email_required?
    false
  end

  def password_required?
    false
  end

  def is_admin?
    self.admin
  end

  def initials
    (self.first_name[0] + self.last_name[0]).upcase
  end
end
