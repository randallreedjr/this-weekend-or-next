class Weekend

  attr_reader :time, :timezone, :date_format, :time_format


  def initialize(timezone = 'Eastern Time (US & Canada)')
    @date_format = "%A, %B %e, %Y"
    @time_format = "%l:%M %P %Z %A, %B %e, %Y"
    @timezone = timezone
    @time = Time.now.in_time_zone(timezone)
    set_this_weekend
    set_next_weekend
  end

  def set_this_weekend
    day_of_the_week = date.wday > 0 ? date.wday : 7
    @this_weekend_start = date.next_day(5 - day_of_the_week)
    @this_weekend_end = date.next_day(7 - day_of_the_week)
  end

  def set_next_weekend
    @next_weekend_start = @this_weekend_start.next_day(7)
    @next_weekend_end = @this_weekend_end.next_day(7)
  end

  def today
    return "#{@time.strftime(datetime_format)}"
  end

  def this_weekend
    return "#{@this_weekend_start.strftime(date_format)} - #{@this_weekend_end.strftime(date_format)}"
  end

  def next_weekend
    return "#{@next_weekend_start.strftime(date_format)} - #{@next_weekend_end.strftime(date_format)}"
  end

  private

  def date
    time.to_date
  end

  def date_format
    "%A, %B %e, %Y"
  end

  def time_format
    "%l:%M %P %Z"
  end

  def datetime_format
    "#{time_format} #{date_format}"
  end
end
