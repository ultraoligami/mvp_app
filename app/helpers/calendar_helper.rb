module CalendarHelper
    require "date"
  
    def calendar(date, posts)
      first_day = date.beginning_of_month
      last_day  = date.end_of_month
      start_day = first_day.beginning_of_week(:sunday)
      end_day   = last_day.end_of_week(:sunday)
  
      (start_day..end_day).to_a.in_groups_of(7)
    end
  end