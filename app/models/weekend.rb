class Weekend
  def initialize
    @date = Time.now
  end

  def format
    return @date.strftime("%A, %B %e, %Y")
  end
end