class Member < ApplicationRecord
  belongs_to :house

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :house, presence: true

  def name
    [first_name, last_name].join(' ')
  end

end
