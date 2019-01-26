class AddTeamNumberToPokeballs < ActiveRecord::Migration[5.2]
  def change
    add_column :pokeballs, :team_number, :integer
  end
end
