class CreateGuestbookPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :guestbook_posts do |t|
      t.string :title
      t.text :body
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
