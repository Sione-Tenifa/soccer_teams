namespace :populate do
  desc "Populate Teams"
  task teams: :environment do
    20.times do
      team = Team.create(name: Faker::Football.team, description: Faker::Football.coach)
      5.times { Player.create(name: Faker::Football.player, position: Faker::Football.position, team_id: team.id) }
    end
  end
end