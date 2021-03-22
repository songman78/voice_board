class Tweet < ApplicationRecord
  validates :text, presence: true  
  mount_uploader :file, AudiofileUploader

  with_options presence: true do
  validates :text
  validates :file
  end
  belongs_to :user
  has_many :comments
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :check

end
