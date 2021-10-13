class Recruitment < ApplicationRecord

  belongs_to :user

  validates :recruitment_post, presence: true, length: { maximum: 300 }

end
