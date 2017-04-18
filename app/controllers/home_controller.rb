# frozen_string_literal: true
class HomeController < ApplicationController
  layout "home"
  skip_before_action :authenticate_user!
  skip_authorization_check

  def show
    #redirect_to(guest_dashboard_path) && return if current_user&.guest?
    #redirect_to(admin_dashboard_path) && return if current_user
  end

  def simple_cal
  end

  def i_cal
    @cal = Icalendar::Calendar.new
    @cal.event do |e|
      e.dtstart     = Icalendar::Values::Date.new('20170428')
      e.dtend       = Icalendar::Values::Date.new('20170429')
      e.summary     = "Swim"
      e.description = "Reservation in development swimming pool"
      e.ip_class    = "SWIM"
    end

    @cal.publish
  end

  def full_cal
  end

end
