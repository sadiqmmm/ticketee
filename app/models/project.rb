class Project < ApplicationRecord
  validates :name, presence: true  
  
  belongs_to :author, class_name: "User"

  has_many :tickets, dependent: :destroy
end
