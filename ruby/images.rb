class NewsestFriendImages
  def initialize(user)
    @user = user
  end

  def images(page)
    friends = Friendship.where(user_id: @user.id).pluck('friend_id')
    images  = Image.where(user_id: friends, visible_to_friends: true)
    images  = images.where('minimum_age >= ?', @user.age)
    images  = images.order('created_at')
    images  = images.limit(PER_PAGE).offset(page.to_i.abs * PER_PAGE)
    images.map { |image| ImageDecorator.new(image) }
  end
end

NewsestFriendImages.new(current_user).images(params[:page]) 

class MostLikedFriendImages
  def initialize(user)
    @user = user
  end

  def images(page)
    friends = Friendship.where(user_id: @user.id).pluck('friend_id')
    images  = Image.where(user_id: friends, visible_to_friends: true)
    images  = images.where('minimum_age >= ?', @user.age)
    images  = images.order('votes_count')
    images  = images.limit(PER_PAGE).offset(page.to_i.abs * PER_PAGE)
    images.map { |image| ImageDecorator.new(image) }
  end
end

NewsestFriendImages.new(current_user).images(params[:page]) 
