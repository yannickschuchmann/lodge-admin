json.array!(@guestbook_posts) do |guestbook_post|
  json.extract! guestbook_post, :id, :title, :body, :user_id
  json.url guestbook_post_url(guestbook_post, format: :json)
end
