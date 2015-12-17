class SortLinkWidget < BaseWidget

  property :field,
           :converts => :to_s,
           :required => true

  property :direction,
           :converts => :to_s,
           :accepts => ['asc','desc'],
           :default => 'asc'



  def render
    render_view build_params
  end

  def model_name
    controller.set_model
  end


  private

  def build_params
    {
        field: field,
        model: model_name
    }
  end


end