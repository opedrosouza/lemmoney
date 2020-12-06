class Offer < ApplicationRecord
  belongs_to :user
  enum status: { disabled: 0, enabled: 1 }

  validates_uniqueness_of :advertiser_name

  scope :enableds, -> { where(:status => 'enabled')}
  # Ex:- scope :active, -> {where(:active => true)}
end
