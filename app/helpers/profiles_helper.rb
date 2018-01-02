module ProfilesHelper
  def show_avatar(user)
    if user.profile&.avatar?
      image_tag(user.profile.avatar, class: "avatar border-gray")
    else
      render partial: 'admin/profiles/avatar', locals: { user: user }
    end
  end
end
