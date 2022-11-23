require 'rails_helper'

RSpec.describe 'Post index page', type: :feature do
  before(:example) do
    @user = User.create(name: 'Elon Musk', photo: 'link/goes/here', bio: 'this is my bio')
    @post_one = Post.create(title: 'My first post', text: 'Body text of the post', author_id: @user.id)
    Post.create(title: 'My second post', text: 'Body text of the post', author_id: @user.id)
    Post.create(title: 'My third post', text: 'Body text of the post', author_id: @user.id)
    Post.create(title: 'My fourth post', text: 'Body text of the post', author_id: @user.id)
    Comment.create(text: 'My first awesome comment straight from Kenya', author_id: @user.id, post_id: @post_one.id)
    visit user_posts_path(@user)
  end

  it 'renders photo of the user' do
    expect(page.html).to include(@user.photo)
  end
end