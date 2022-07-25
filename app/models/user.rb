class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  has_many :departments

  # Returns the user's full name by concatenating the
  # first name and last name attributes.
  def full_name
    "#{first_name} #{last_name}"
  end
end
