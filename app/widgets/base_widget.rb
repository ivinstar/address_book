class BaseWidget < ActionWidget::Base


  private

  def render_view locals = {}
    view = ActionView::Base.new(ActionController::Base.view_paths, {})
    view.extend ApplicationHelper
    view.render(:partial => view_name, locals: locals)
  end

  def widget_name
    name = self.class.to_s.underscore
    name.gsub!(/_[Ww]idget$/, '')
    #name.downcase!
    name
  end

  def view_name
    "widgets/#{widget_name}"
  end

end