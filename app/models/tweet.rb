class Tweet < ApplicationRecord
  validates :text, presence: true  
  mount_uploader :file, AudiofileUploader

  belongs_to :user
  has_many :comments
end
