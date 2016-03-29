require 'test_helper'

class GuestbookPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @guestbook_post = guestbook_posts(:one)
  end

  test "should get index" do
    get guestbook_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_guestbook_post_url
    assert_response :success
  end

  test "should create guestbook_post" do
    assert_difference('GuestbookPost.count') do
      post guestbook_posts_url, params: { guestbook_post: { body: @guestbook_post.body, title: @guestbook_post.title, user_id: @guestbook_post.user_id } }
    end

    assert_redirected_to guestbook_post_path(GuestbookPost.last)
  end

  test "should show guestbook_post" do
    get guestbook_post_url(@guestbook_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_guestbook_post_url(@guestbook_post)
    assert_response :success
  end

  test "should update guestbook_post" do
    patch guestbook_post_url(@guestbook_post), params: { guestbook_post: { body: @guestbook_post.body, title: @guestbook_post.title, user_id: @guestbook_post.user_id } }
    assert_redirected_to guestbook_post_path(@guestbook_post)
  end

  test "should destroy guestbook_post" do
    assert_difference('GuestbookPost.count', -1) do
      delete guestbook_post_url(@guestbook_post)
    end

    assert_redirected_to guestbook_posts_path
  end
end
