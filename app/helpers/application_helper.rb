module ApplicationHelper
  def form_group_tag(errors, &block)
    css_class = 'form-group'
    css_class << ' has-error' if errors.any?
    content_tag :div, capture(&block), class: css_class
  end


  # def form_group_tag(errors)
  #   errors.empty? ? "form-group" : "form-group has-error"
  # end
end
