class SuggestsController < ApplicationController
  before_action :set_suggest, only:[:show, :edit, :update, :destroy]
  def new
    @suggest = Suggest.new
    @suggest.suggest_tags.build
    2.times{@suggest.images.build}
  end
  def create
    @suggest = Suggest.new(suggest_params)
    @suggest.suggest_tags.build
    2.times{@suggest.images.build}
    if params[:back]
      render 'new'
    # if params[:suggest][:images].present?
    #   suggest_params[:images].each do |image|
    #     @suggest.images.build(suggest_params.clone.merge({images: image}))
    else
      if @suggest.save
          redirect_to suggests_path, notice: t('.suggest.created')
    #     end
    #   end
    # elsif @suggest.save
    # # if @suggest.save
    #   redirect_to suggests_path, notice: t('.suggest.created')
      else
        flash.now[:warning] = t('.suggest.create_faild')
        render 'new'
      end
    end
  end
  def confirm
    @suggest = Suggest.new(suggest_params)
    @images = @suggest.images.collect(&:image)
    @tags = @suggest.tags.collect(&:name)
    if @suggest.valid?
      flash.now[:notice] = t('.confirmation')
      render 'confirm'
    else
      render 'new'
    end
  end
  def index
    @suggests = Suggest.all
    # binding.pry
    if params[:tag].present?
      @suggests = Tag.find_by(id: params[:tag]).suggests
    elsif params[:category_id].present?
      @suggests = @suggests.category_search(params[:category_id])
    end
  end
  def show
    @comment = Comment.new
    @comments = @suggest.comments.recent
  end
  def destroy
    if current_user.admin?
      @suggest.destroy!
      redirect_to admin_users_path, notice: "#{@suggest.title}#{t('.destroyed')}"
    end
  rescue => e
    puts e.class
    redirect_to admin_users_path, danger: t('.destroy faild')
  end
  private
  def set_suggest
    @suggest = Suggest.find_by(id: params[:id])
  end
  def suggest_params
    # EROR:Unpermitted parameter: :tag_ids
    # params.require(:suggest).permit(:title, :details).merge(tag_ids: params[:suggest][:tag_ids])
    # ERROR:attributes.suggest.required

    # image 複数
    params.require(:suggest).permit(:title, :details, :category_id, { tag_ids: [] }, { images_attributes:[ :image, :image_cache] }).merge(user_id: current_user.id)
    # params.require(:suggest).permit(:title, :details, :category_id, { tag_ids: [] }, { images_attributes:[ :image] }).merge(user_id: current_user.id)

    # params.require(:suggest).permit(:title, :details, :category_id, { tag_ids: [] }, {images: []}).merge(user_id: current_user.id)

    # 中間モデルの「optional: true」で解決
  end
end
