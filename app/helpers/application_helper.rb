module ApplicationHelper
  # tag for environment
  def env_meta_tags
    "<meta content=\"#{Rails.env}\" name=\"env\" />".html_safe
  end
end
