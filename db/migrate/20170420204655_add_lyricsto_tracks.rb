class AddLyricstoTracks < ActiveRecord::Migration[5.0]
  def change
    add_column :tracks, :lyrics, :text
  end
end
