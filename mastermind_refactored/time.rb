class Time

  def get_total_time(start, finish)
    # Get total elapsed seconds
    elapsed_seconds = finish.to_i - start.to_i
    mins, secs = elapsed_seconds.divmod(60)
    time_text = "#{mins} minutes, #{secs} seconds"
  end

end
