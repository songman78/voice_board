class Check < ActiveHash::Base
  self.data = [
    { id: 1, name: '未解決' },
    { id: 2, name: '解決済' }
  ]

  include ActiveHash::Associations
  has_many :tweets
  end