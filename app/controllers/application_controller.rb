class ApplicationController < ActionController::Base
    before_action :set_current_time

    def set_current_time
        @current_time = Time.current.since(9.hours)
    end
end
