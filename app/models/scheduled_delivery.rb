class ScheduledDelivery < ApplicationRecord
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '1~2にちで発送' },
    { id: 3, name: '2~3にちで発送' },
    { id: 4, name: '3~7にちで発送' }
  ]

  include ActiveHash::Associations
  has_many :items

end
