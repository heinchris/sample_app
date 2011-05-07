module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "Boozehound 1.0"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def logo
    image_tag("logo.jpg", :alt => "Boozehound", :class => "round")
  end
end
