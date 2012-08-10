class FriendImages
  def initialize(user)
    @user = user
  end

  def images(sorting, page)
    friends = Friendship.where(user_id: @user.id).pluck('friend_id')
    images  = Image.where(user_id: friends, visible_to_friends: true)
    images  = images.where('minimum_age >= ?', @user.age)
    images  = images.order(sorting)
    images  = images.limit(PER_PAGE).offset(page.to_i.abs * PER_PAGE)
    images.map { |image| ImageDecorator.new(image) }
  end
end

FriendImages.new(current_user).images('created_at', params[:page]) 
FriendImages.new(current_user).images('likes_count', params[:page]) 
