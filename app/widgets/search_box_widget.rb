class SearchBoxWidget < BaseWidget

  property :field,
           :converts => :to_s,
           :required => true

  property :type,
           :converts => :to_s,
           :default => 'text'

  property :cond,
           :converts => :to_s,
           :default => 'cont'

  property :css_class,
           :converts => :to_s,
           :default => ''


  def render
    render_view build_params
  end



  private

  def search_field
    [field,cond].join('_')
  end

  def build_params
    {
        search_field: search_field,
        field: field,
        type: type,
        css_class: set_class
    }
  end

  def set_class
    css_class
  end


end