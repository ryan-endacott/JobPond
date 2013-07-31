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

  def distances
    d = {}
    [5, 10, 20, 30, 40, 50, 75, 100].each do |dist|
      d["#{dist} miles"] = dist
    end
    return d
  end

  def us_states
    [
      'Alabama',
      'Alaska',
      'Arizona',
      'Arkansas',
      'California',
      'Colorado',
      'Connecticut',
      'Delaware',
      'District of Columbia',
      'Florida',
      'Georgia',
      'Hawaii',
      'Idaho',
      'Illinois',
      'Indiana',
      'Iowa',
      'Kansas',
      'Kentucky',
      'Louisiana',
      'Maine',
      'Maryland',
      'Massachusetts',
      'Michigan',
      'Minnesota',
      'Mississippi',
      'Missouri',
      'Montana',
      'Nebraska',
      'Nevada',
      'New Hampshire',
      'New Jersey',
      'New Mexico',
      'New York',
      'North Carolina',
      'North Dakota',
      'Ohio',
      'Oklahoma',
      'Oregon',
      'Pennsylvania',
      'Puerto Rico',
      'Rhode Island',
      'South Carolina',
      'South Dakota',
      'Tennessee',
      'Texas',
      'Utah',
      'Vermont',
      'Virginia',
      'Washington',
      'West Virginia',
      'Wisconsin',
      'Wyoming'
    ]
  end

  def degrees
    [
      "Accountancy",
      "Agriculture",
      "Architecture",
      "Biology",
      "Business Administration",
      "Chemistry",
      "Computer Science",
      "Construction Management",
      "Criminology",
      "Economics",
      "Education",
      "Engineering",
      "English Literature",
      "Environmental Science",
      "History",
      "Journalism",
      "Management",
      "Marketing",
      "Music",
      "Nursing",
      "Physical Therapy",
      "Physics",
      "Politics",
      "Pre-Med / Medical",
      "Psychology",
      "Religion",
      "Social Work"
    ]
  end

end
