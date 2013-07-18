module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def nav_link(link_text, link_path, options = nil)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path, options
    end
  end

  def pagination(models, options = nil)
    offset = 2
    min_page = (models.current_page - offset) > 0 ? models.current_page - offset : 1
    max_page = (models.current_page + offset) <= models.total_pages ? models.current_page + offset : models.total_pages
    next_page = models.current_page + 1
    return if max_page == min_page
    class_name = (!options.nil? && options[:class]) ? "pagination " + options[:class] : "pagination"
    content_tag :div, class: class_name do
      content_tag :ul do
        content = ""
        unless models.current_page == 1
          content += content_tag(:li){link_to "Prev", "?page=#{next_page}"}
        end
        (min_page..max_page).to_a.each do |page|
          class_name = models.current_page == page ? "active" : ""
          content += content_tag :li, class: class_name do
            link_to page, "?page=#{page}"
          end
        end
        unless models.current_page == models.total_pages
          content += content_tag(:li){link_to "Next", "?page=#{next_page}"}
        end
        content.html_safe
      end
    end
  end

end
