class Offer < ApplicationRecord
  belongs_to :user
  validates :advertiser_name, presence: true, uniqueness: { case_sensitive: false }
  validates :url, presence: true, format: URI::regexp(%w[http https])
  validates :description, presence: true, length: { maximum: 500 }

  enum status: { disabled: 0, enabled: 1 }

  scope :enableds, -> { where(:status => 'enabled') }
  scope :premium, -> { where(:premium => true) }
  scope :with_name, ->(name){ where('advertiser_name LIKE ?',"%#{name}%") }
  scope :with_desription, ->(desription){ where('description LIKE ?',"%#{description}%") }

  def self.search(params)
    offer = self
    params.each do | param, value |
      if !value.empty? && self.respond_to?(param)
        offer = offer.send(param, value)
      end
    end
    return offer
  end
end
