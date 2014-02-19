class Contribution

  def initialize(username)
    @data = calendar_data username
  end

  def longest_streak
    if @data != "error"
      data_string = remove_head_and_tail_brackets @data
      data_arr = to_array data_string
      daily_contributions = get_daily_contributions data_arr
      calc_longest_streak daily_contributions
    else
      0
    end
  end

  private

  def calendar_data(username)
    begin
      open("https://github.com/users/#{username}/contributions_calendar_data").read
    rescue
      "error"
    end
  end

  def to_array(data_string)
    data_string.split('],[')
  end

  def get_daily_contributions(data_arr)
    daily_contributions = Array.new
    data_arr.each do |a|
      v,k = a.split(',')
      daily_contributions << k.to_i
    end
    daily_contributions
  end

  def remove_head_and_tail_brackets(data_string)
    data_string[0..1] = ''
    length = data_string.length
    data_string[length-2..length] = ''
    data_string
  end

  def calc_longest_streak(arr)
    longest = 0
    current = 0
    arr.each do |a|
      if a > 0
        current = current + 1
      else
        if current > longest
          longest = current
        end
        current = 0
      end
      if current > longest
        longest = current
      end
    end
    longest
  end
end
