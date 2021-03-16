class Tweet < ApplicationRecord
  validates :text, presence: true  
  mount_uploader :file, AudiofileUploader
end
