class Booking < ApplicationRecord
  belongs_to :listing
  has_many :missions, through: :listing
  after_create_commit :checkin, :checkout

  private

  def checkin
    Mission.create(listing_id: self.listing_id, mission_type: "first_checkin", date: (self.start_date).strftime("%Y-%m-%d"), price: self.listing.num_rooms * 10)
  end

  def checkout
    Mission.create(listing_id: self.listing_id, mission_type: "last_checkout", date: (self.end_date).strftime("%Y-%m-%d"), price: self.listing.num_rooms * 5)
  end
end
