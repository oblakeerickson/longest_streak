class Page
  def initialize(username)
    page = page username
    chunk = chunk(page)
    if chunk != nil
      @streak = get_streak(chunk)
    else
      @streak = "error"
    end
  end

  def streak
    @streak
  end

  private

  def page(username)
    begin
      open("https://github.com/#{username}").read
    rescue
      "error"
    end
  end

  def chunk(page)
    location = page.index '<div class="table-column contrib-streak">'
    if location != nil
      page[location..location+100]
    end
  end
  def get_streak(chunk)
    location = chunk.index 'days'
    @streak = chunk[location-4..location-2]
    if @streak[0,1] == '"'
      @streak[0] = ''
    end
    if @streak[0,1] == '>'
      @streak[0] = ''
    end
    @streak
  end
end
