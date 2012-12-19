module ApplicationHelper
  def caret(text)
    "#{text} <b class='caret'></b>".html_safe
  end
end
