module ApplicationHelper
  def active_url path, name
    request.original_url == path ? " #{name}" : ""
  end

  def active_resource resource, name
    controller_name == resource ? " #{name}" : ""
  end
end
