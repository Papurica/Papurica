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
end
