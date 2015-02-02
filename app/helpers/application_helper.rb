module ApplicationHelper
  def rtrim(str, len: 80, omission: "...", rm_nl: false)
    return "" if str.blank?

    str = str.gsub(/\r\n|\r|\n/, '') if rm_nl
    return str if str.length <= len

    len = 80 if  len <= 0
    "#{str[0, len]}#{omission}"
  end

  def nl2br(str, auto_link: true)
    str = str.gsub(/\r\n|\r|\n/, '<br />')
    str = str.gsub('&amp;#', '&#')
    if auto_link
      str.gsub!(/(https?:\/\/[\w\-\.!~\*\'\(\);\/\?:&=\+\$,%#\[\]]+)/, '<a href="\1" target="_blank" rel="nofollow">\1</a>')
    end

    return str
  end
end
