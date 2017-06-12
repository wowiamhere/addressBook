class Contact < ApplicationRecord

  belongs_to :user

  validates :email, uniqueness: { case_sensitive: false, message: "email taken!" }
  validates :name, presence: true

end
