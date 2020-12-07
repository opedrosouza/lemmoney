class UpdateOffersJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ActiveRecord::Base.transaction do
      Offer.all.each do |offer|
        if Time.zone.now >= offer&.starts_at && !offer&.disabled_by_owner
          if !offer&.ends_at.nil? && Time.zone.now <= offer&.ends_at || offer&.ends_at.nil?
            offer.enabled!
          end
        end

        if !offer&.ends_at.nil? && Time.zone.now >= offer&.ends_at
          offer.disabled!
        end
      end
    end
  end
end
