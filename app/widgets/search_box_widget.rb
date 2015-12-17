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
        type: type
    }
  end


end