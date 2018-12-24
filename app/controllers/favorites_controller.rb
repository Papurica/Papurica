class FavoritesController < ApplicationController
  def create
    comment = Comment.find(favorite_params[:comment_id].to_i)
    if comment == nil
      return
    end
    favorites = Favorite.where(comment_id: comment.id, user_id: current_user.id)
    if favorites.count > 0
      favorites[0].delete
      return
    end
    favorite = Favorite.new
    favorite.user = current_user
    favorite.comment = comment
    favorite.save
    
  end

  def favorite_params
    params.permit(:comment_id, :article_id)
  end
end
