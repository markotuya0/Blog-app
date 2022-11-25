require 'rails_helper'

RSpec.describe 'User post', type: :feature do
  before(:example) do
    @user = User.create(name: 'Elon Musk', photo: 'link/goes/here', bio: 'this is my bio')
    @post_one = Post.create(title: 'My first post', text: 'Body text of the post', author_id: @user.id)
    Post.create(title: 'My second post', text: 'Body text of the post', author_id: @user.id)
    Post.create(title: 'My third post', text: 'Body text of the post', author_id: @user.id)
    Post.create(title: 'My fourth post', text: 'Body text of the post', author_id: @user.id)
    Comment.create(text: 'My first awesome comment straight from Kenya', author_id: @user.id, post_id: @post_one.id)

    visit user_post_path(@user, @post_one.id)
  end
  it 'renders who wrote the post ' do
    expect(page.html).to include(@user.name)
  end
  it 'renders number of comments ' do
    expect(page).to have_content(1)
  end
  it 'renders number of likes ' do
    expect(page).to have_content(0)
  end
  it 'renders post body ' do
    expect(page).to have_content(@post_one.text)
  end
  it 'renders username of each commentor ' do
    expect(page.html).to include(@user.name)
  end
  it 'renders comment of each commentor ' do
    expect(page).to have_content('My first awesome comment straight from Kenya')
  end
end
