module DiffsHelper
  def change_html(change)
    template = %q[<span class="type">%s</span><span class="property">%s</span><span class="value">%s</span>]
    html = change[2].to_s.split('')
    if change[3]
      changes = Diff::LCS.diff(change[2].to_s, change[3].to_s).flatten

      adds = 0
      deletes = 0
      changes.each do |change|
        if change.action == '+'
          adds += 1
          html.insert(change.position + deletes, %q[<span class="insert">%s</span>] % change.element)
        elsif change.action == '-'
          deletes += 1
          html[change.position + adds] = (%q[<span class="delete">%s</span>] % change.element)
        end
      end

      (template % [change[0], change[1], html.flatten.join]).html_safe
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
