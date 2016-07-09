class AddTripToGuestbookPost < ActiveRecord::Migration[5.0]
  def change
    add_reference :guestbook_posts, :trip, foreign_key: true
  end
end
