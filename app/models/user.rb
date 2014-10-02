class User < ActiveRecord::Base
  belongs_to :favorite_recipe, class_name: "Recipe"
  validates :name, :role, :email, presence: true
  validates :email, uniqueness: true

  has_secure_password

  # here is a helper to check if a user is an admin!
  #
  def is_admin?
    self.role =~ /patissier/
  end
end
