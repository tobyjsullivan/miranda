require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get board_posts_url(@post.board)
    assert_response :success
  end

  test "should get new" do
    get new_board_post_url(@post.board)
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post board_posts_url(@post.board), params: { post: { board_id: @post.board_id, title: @post.title, url: @post.url } }
    end

    assert_redirected_to board_post_url(@post.board, Post.last)
  end

  test "should show post" do
    get board_post_url(@post.board, @post)
    assert_response :success
  end

  test "should get edit" do
    get edit_board_post_url(@post.board, @post)
    assert_response :success
  end

  test "should update post" do
    patch board_post_url(@post.board, @post), params: { post: { board_id: @post.board_id, title: @post.title, url: @post.url } }
    assert_redirected_to board_post_url(@post.board, @post)
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete board_post_url(@post.board, @post)
    end

    assert_redirected_to board_posts_url
  end
end
