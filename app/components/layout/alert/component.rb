class Layout::Alert::Component < ViewComponent::Base

  def initialize(title: nil, content: nil, type: nil)
    @title = title
    @content = content
    @type = type
  end


  def alert_class(type)
    case type
    when 'success'
      'alert-success'
    when 'warning'
      'alert-warning'
    when 'error'
      'alert-danger'
    else
      'alert-info'
    end
  end

  def render?
    !@title.nil?
  end
end
