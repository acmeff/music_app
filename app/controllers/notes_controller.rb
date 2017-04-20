class NotesController < ApplicationController
  def create
    new_note_params = notes_params.merge(user_id: current_user.id,
                                         track_id: params[:track_id])
    note = Note.new(new_note_params)

    flash[:errors] = note.errors.full_messages unless note.save
    redirect_to track_url(note.track)
  end

  def destroy
    note = Note.find_by(id: params[:id])
    unless current_user == note.user
      render text: 'Cannot delete another user\'s comments',
             status: :forbidden
    end
    track = note.track
    flash[:errors] = note.errors.full_messages unless note.destroy
    redirect_to track_url(track)
  end

  private

  def notes_params
    params.require(:note).permit(:body)
  end
end
