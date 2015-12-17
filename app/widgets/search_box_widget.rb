class SearchBoxWidget < BaseWidget

  property :field,
           :converts => :to_s,
           :required => true

  property :type,
           :converts => :to_s,
           :default => 'text'


  def render
    render_view build_params
  end



  private

  def build_params
    {
        field: field,
        type: type
    }
  end


end