module ApplicationHelper
  def Article.search(search)
    if search
      where(['title LIKE ?', "%#{search}%"]) #検索とtitleの部分一致を表示。
    else
      all
    end
  end
end
