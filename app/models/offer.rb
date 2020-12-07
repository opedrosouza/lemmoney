class Offer < ApplicationRecord
  belongs_to :user
  validates :advertiser_name, presence: true, uniqueness: { case_sensitive: false }
  validates :url, presence: true, format: URI::regexp(%w[http https])
  validates :description, presence: true, length: { maximum: 10 }

  enum status: { disabled: 0, enabled: 1 }

  scope :enableds, -> { where(:status => 'enabled') }
  scope :premium, -> { where(:premium => true) }

end
