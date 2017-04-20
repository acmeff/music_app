class ChangeAlbumType < ActiveRecord::Migration[5.0]
  def change
    change_column :albums, :album_type, :string, null: false, default: 'studio'
    change_column :tracks, :track_type, :string, default: 'regular'
  end
end
