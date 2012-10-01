module ApplicationHelper
  #Return full title for each sub page
  def full_title(page_title)
    base_title = "PhuongLH"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
