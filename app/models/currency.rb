class Currency < ActiveRecord::Base
  
  validates :name, presence: true, length: { minimum: 2 }
  validates :value, presence: true

  private

  validate :validates_format
  def validates_format
    if value.present? && value.sub('.','').match(/\D/).present?
      errors.add(:value, 'incorrect value format')
    end
  end
end
