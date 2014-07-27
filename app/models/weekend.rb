class Weekend
  
  @@format = "%A, %B %e, %Y"
  def initialize
    @date = Date.today
    set_this_weekend
    set_next_weekend
  end

  def format
    return @date.strftime(@@format)
  end

  def set_this_weekend
    if @date.monday?
      @this_weekend_start = @date.next_day(4)
      @this_weekend_end = @date.next_day(6)
    elsif @date.tuesday?
      @this_weekend_start = @date.next_day(3)
      @this_weekend_end = @date.next_day(5)
    elsif @date.wednesday?
      @this_weekend_start = @date.next_day(2)
      @this_weekend_end = @date.next_day(4)
    elsif @date.thursday?
      @this_weekend_start = @date.next_day(1)
      @this_weekend_end = @date.next_day(3)
    elsif @date.friday?
      @this_weekend_start = @date
      @this_weekend_end = @date.next_day(2)
    elsif @date.saturday?
      @this_weekend_start = @date.prev_day
      @this_weekend_end = @date.next_day
    elsif @date.sunday?
      @this_weekend_start = @date.prev_day(2)
      @this_weekend_end = @date
    end
  end

  def set_next_weekend
    @next_weekend_start = @this_weekend_start.next_day(7)
    @next_weekend_end = @this_weekend_end.next_day(7)
  end

  def this_weekend
    return "#{@this_weekend_start.strftime(@@format)} - #{@this_weekend_end.strftime(@@format)}"
  end

  def next_weekend
    return "#{@next_weekend_start.strftime(@@format)} - #{@next_weekend_end.strftime(@@format)}"
  end
end