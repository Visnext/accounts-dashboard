module ApplicationHelper
	def is_active(*links)
    links.each { |link| return "active" if params[:controller] == link }
  end
end
