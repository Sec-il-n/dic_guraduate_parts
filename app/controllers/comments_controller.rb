class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit, update, destroy]
  def create
    @suggest = Suggest.find_by(id: params[:suggest_id])
    #投稿に紐づいたコメントを作成(idをi含んだ形でインスタンスを作成)
    @comment = current_user.comments.build(params_comment)
    begin
      @comment.save!
      render 'index'#create & form 非同期->index.jsが呼ばれる。消すと動かない
    rescue => e
      puts e.class
      # format.html { redirect_to admin_users_path, danger: t('.create comment faild') }
      redirect_to suggest_path(comment.suggest.id), danger: t('.create comment faild')
    end
  end
  def edit
  end
  def update
  end
  def destroy
    if current_user.admin?
      begin
        @comment.destroy!
      rescue => e
        puts e.class
        redirect_to admin_users_path, danger: t('.delete faild')
      end
      flash[:notice] = t('.deleted')
      render 'index'
    end
# 現状　destroyはコメント部のみ反映されるが二重で出る、createは動かない
  end
  private
  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end
  def params_comment
    # ↓ :suggest_idが✖︎　
    # params.require(:comment).permit(:text, :suggest_id, :user_id)
    params.require(:comment).permit(:text).merge(suggest_id: params[:suggest_id])
  end

end
