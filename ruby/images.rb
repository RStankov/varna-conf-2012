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
    Friendship.friend_ids_of(@user)
  end

  def find_images_of(friends)
    Image.of(friends)
  end

  def apply_age_restritions_to(images)
    images.appropriate_for(@user.age)
  end

  def order_by(sorting)
    images.order(sorting)
  end

  def paginate(page)
    images.paginate(page)
  end

  def decorate(images)
    images.map { |image| ImageDecorator.new(image) }
  end
end

FriendImages.new(current_user).images('created_at', params[:page]) 
FriendImages.new(current_user).images('likes_count', params[:page]) 
