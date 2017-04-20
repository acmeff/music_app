class AddAlbumName < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :name, :string, null: false
  end
end
