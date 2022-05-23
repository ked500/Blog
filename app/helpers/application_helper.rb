module ApplicationHelper
  def full_title(page_tile = '')
    base_title = "Simple Blog"
    if page_tile.empty?
      base_title
    else
      page_tile + " | " + base_title
    end
  end


end
