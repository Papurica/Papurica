class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  has_many :favorites
  def created_at_format
    return self.created_at.strftime("%H/%m/%d %H:%m:%S")
  end
end
