module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def avatar_image_url(user)
    if user.avatar.present?
      user.avatar.url(:thumb)
    else
      GravatarImageTag.gravatar_url(user.email, filetype: :png, rating: 'R', secure: true)
    end
  end

end
