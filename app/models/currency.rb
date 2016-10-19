class Currency < ActiveRecord::Base

  scope :for_selection, -> { order :created_at }
  scope :forced, -> { where(active: true) }

  validates :name, presence: true, length: { minimum: 2 }
  validates :value, presence: true

  def self.get_active
    self.forced.first
  end

  def self.get_active_or_last
    self.forced.first || self.last
  end

  def as_json(options = {})
    json = {}
    [:created_at, :updated_all, :forced_till].each do |time|
      next if self.try(time).blank?
      json.merge!(time => self.send(time).strftime('%d.%m.%Y %H:%M:%S'))
    end
    super.merge(json)
  end
  private

  validate :validates_format
  def validates_format
    if value.present? && value.sub('.','').match(/\D/).present?
      errors.add(:value, 'incorrect value format')
    end
  end

  before_save :make_active
  def make_active
    if self.forced_till.present?
      self.class.forced.update_all(active: false)
      self.active = true
    end
  end
end
