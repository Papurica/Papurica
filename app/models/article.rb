class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :article_tags
  def created_at_format
    return self.created_at.strftime("%Y/%m/%d %H:%M")
  end

  def favorite_count
    return self.comments.reduce(0) { |sum, comment|
      return sum + comment.favorites.count
    }
  end
  
  def set_tags_from_string(tag_s)
    tags = tag_s.split(" ").map { |tag_name|
      d = Tag.find_by(name: tag_name)
      if d == nil
        new_tag = Tag.new
        new_tag.name = tag_name
        if new_tag.save
          new_tag  
        end
      else
        d
      end
    }
    self.article_tags = tags.map { |tag|
      article_tag = ArticleTag.new
      article_tag.tag = tag
      article_tag.article = self
      article_tag
    }
  end

  def comment_count
    return self.comments.count
  end

  def Article.search(search) #ここでのself.はUser.を意味する
    if search
      tag = Tag.find_by(name: search)
      articles_by_title = where(['title LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。User.は省略
      articles_by_tag = []
      if tag != nil
        articles_by_tag = tag.article_tags.map { |article_tag|
          article_tag.article
        }
      end
      return (articles_by_title + articles_by_tag).uniq
      
    else
      all #全て表示。User.は省略
    end
  end

end
