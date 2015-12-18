class PaginationWidget < BaseWidget

  property :limit,
           :converts => :to_i,
           :default => 3


  def render
    render_view build_params
  end


  def total_count
    model_name.count/per_page
  end

  def per_page
    model_name.default_per_page || 30
  end

  def first_page
    1
  end

  def last_page
    total_count
  end

  private

  def model_name
    controller.set_model
  end

  def build_params
    {
      pages: total_count,
      limit: limit,
      first: first_page,
      last: last_page
    }
  end


end