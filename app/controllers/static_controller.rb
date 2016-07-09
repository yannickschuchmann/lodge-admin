class StaticController < ApplicationController
  def start
    @pages = Page.order("updated_at DESC").limit(3)
    @posts = GuestbookPost.order("updated_at DESC").limit(4)
  end
end
