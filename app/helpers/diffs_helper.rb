module DiffsHelper
  def change_html(change)
    template = %q[<span class="type">%s</span><span class="property">%s</span><span class="value">%s</span>]
    html = change[2].to_s.split('')
    if change[0] == '~'
      (template % [change[0], change[1], "#{change[2].to_json}    ->    #{change[3].to_json}"]).html_safe
    else
      (template % [change[0], change[1], change[2].to_s]).html_safe
    end
  end

  def css_class(change)
    if change[0] == '+'
      'add'
    elsif change[0] == '-'
      'delete'
    elsif change[0] == '~'
      'modify'
    else
      ''
    end
  end

end
