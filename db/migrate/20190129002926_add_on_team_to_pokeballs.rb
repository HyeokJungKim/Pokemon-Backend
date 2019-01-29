class AddOnTeamToPokeballs < ActiveRecord::Migration[5.2]
  def change
    add_column :pokeballs, :onTeam, :boolean, default: false
  end
end
