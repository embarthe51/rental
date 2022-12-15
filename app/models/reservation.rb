class Reservation < ApplicationRecord
  belongs_to :listing
  has_many :missions, through: :listing
  after_create_commit :checkout_checkin

  private

  def checkout_checkin
    return if listing.missions.find_by(mission_type: "last_checkout", date: end_date)

    Mission.create(listing_id: self.listing_id, mission_type: "checkout_checkin", date: (self.end_date).strftime("%Y-%m-%d"), price: self.listing.num_rooms * 10)
  end
end
