class ParticipantsController < ApplicationController
  include SuggestsHelper
  before_action :corp_prop_registerd, only:[:create]
  def create
    participant = current_user.participants.create!(suggest_id: params[:suggest_id])
    redirect_to top_rooms_path(suggest_id: params[:suggest_id]), notice: t('.send messages')
    # redirect_to new_room_path, notice: t('.send messages')
  rescue => e
    puts e.class
    redirect_to participants_path, danger: t('.error occured')
  end
  def index
    @participants = current_user.participants
  end
  def destroy
    @participant = Participant.find_by(id: params[:id])
    @participant.destroy

    redirect_to participants_path, notice: "#{t('.title name')}:「#{@participant.suggest.title}」#{t('.unjoined')}"
  end
  # private
  # def params_participant
  #   params.require(:participant).permit(:suggest_id, :id).merge(user_id: current_user.id)
  # end
end
