class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  def created_at_format
    return self.created_at.strftime("%Y/%m/%d %H:%M")
  end

  def favorite_count
    return self.comments.reduce(0) { |sum, comment|
      return sum + comment.favorites.count
    }
  end

  def comment_count
    return self.comments.count
  end

  def Article.search(search) #ここでのself.はUser.を意味する
    if search
      where(['title LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。User.は省略
    else
      all #全て表示。User.は省略
    end
  end

end
