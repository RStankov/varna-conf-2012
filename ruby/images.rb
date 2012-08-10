class FriendImages
  def initialize(user)
    @user = user
  end

  def images(sorting, page)
    images = find_images_of(friends)
    images = apply_age_restritions_to(images)
    images = order_by(images, sorting)
    images = paginate(images, page)

    decorate(images)
  end

  private

  def friends
    Friendship.where(user_id: @user.id).pluck('friend_id')
  end

  def find_images_of(friends)
    Image.where(user_id: friends, visible_to_friends: true)
  end

  def apply_age_restritions_to(images)
    images.where('minimum_age >= ?', @user.age)
  end

  def order_by(sorting)
    images.order(sorting)
  end

  def paginate(page)
    images.limit(PER_PAGE).offset(page.to_i.abs * PER_PAGE)
  end

  def decorate(images)
    images.map { |image| ImageDecorator.new(image) }
  end
end

FriendImages.new(current_user).images('created_at', params[:page]) 
FriendImages.new(current_user).images('likes_count', params[:page]) 
