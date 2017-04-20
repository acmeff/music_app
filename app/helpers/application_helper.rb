module ApplicationHelper
  include ERB::Util


  def auth_token
    html = <<-html
      <input type='hidden' name='authenticity_token' value='#{form_authenticity_token}'/>
    html

    html.html_safe
  end

  def ugly_lyrics(lyrics)
    return '' if lyrics.nil?
    lines = lyrics.split("\n")
    lines.map! { |line| '♫ '  + line }
    html = '<pre>' + h(lines.join("\n")) + '</pre>'
    html.html_safe
  end
end
