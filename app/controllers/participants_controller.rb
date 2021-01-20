class ParticipantsController < ApplicationController
  def create
    participant = current_user.participants.create!(suggest_id: params[:suggest_id])
    redirect_to new_room_message_path, notice: t('.send messages')
  rescue => e
    puts e.class
    flash.now[:danger] = t('.error occured')
    redirect_to participants_path
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
