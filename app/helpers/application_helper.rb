module ApplicationHelper
  
  def friendly_datetime(datetime)
    if logged_in? && !current_user.time_zone.blank?
      datetime = datetime.in_time_zone(current_user.time_zone)
    end  
    datetime.strftime("%B %d, %Y at %l:%M %p %Z")   
  end
  
end
