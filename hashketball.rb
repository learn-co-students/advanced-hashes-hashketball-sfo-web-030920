def game_hash
  {
    away: { team_name: 'Charlotte Hornets',
      colors: %w[Turquoise Purple],
      players: [
        { player_name: 'Jeff Adrien',
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2 },
        { player_name: 'Bismack Biyombo',
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10 },
        { player_name: 'DeSagna Diop',
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5 },
        { player_name: 'Ben Gordon',
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0 },
        { player_name: 'Kemba Walker',
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12 }
            ] },
    home: { team_name: 'Brooklyn Nets',
      colors: %w[Black White],
      players: [
        { player_name: 'Alan Anderson',
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1 },
        { player_name: 'Reggie Evans',
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7 },
        { player_name: 'Brook Lopez',
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15 },
        { player_name: 'Mason Plumlee',
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5 },
        { player_name: 'Jason Terry',
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1 }
      ] }
  }
end

def num_points_scored(player_name)
  game_hash.each do |location, team|
    team[:players].each do |player|
      if player[:player_name] == player_name
        return player[:points]
      end
    end
  end
  return nil
end

def shoe_size(player_name)
game_hash.each do |location, team|
    team[:players].each do |player|
      if player[:player_name] == player_name
        return player[:shoe]
      end
    end
  end
  return nil
end

def team_colors(team_name)
  game_hash.each do |location, team|
    return team[:colors] if team[:team_name] == team_name
  end
  return nil
end

def team_names
  game_hash.map do |team, team_info|
    pp team_info
    team_info[:team_name]
  end
end

def player_numbers(team_name)
  jerseys_array = []
  game_hash.each do |team, team_info|
      if team_info[:team_name] == team_name
        team_info[:players].each do |player|
        jerseys_array << player[:number]
      end
    end
  end
   jerseys_array
end

def player_stats(player_name)
  game_hash.each do |location, team|
    team[:players].each do |player|
      if player[:player_name] == player_name
        player.delete(:player_name)
        return player
      end
    end
  end
  return nil
end

def big_shoe_rebounds
  big_shoe = 0
  rebounds = 0
  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      if player[:shoe] > big_shoe
        big_shoe = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end
  return rebounds
end

def most_points_scored
  arr = []
game_hash.each do |location, team|
    inner_index = 0
    while inner_index < team[:players].size-1
      puts team[:players][inner_index]
      current_value = team[:players][inner_index]
        arr.push(team[:players][inner_index])
      inner_index += 1
    end
  end
   arr.sort_by! { |q| q[:points] }
   return arr.last[:player_name]
end

def winning_team
home_team_points = 0
away_team_points = 0
  game_hash[:home][:players].each do |player|
    home_team_points += player[:points]
  end
  game_hash[:away][:players].each do |player|
    away_team_points += player[:points]
  end
  return home_team_points > away_team_points ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end

def player_with_longest_name
  arr = []
  game_hash.each do |location, team|
      inner_index = 0
      while inner_index < team[:players].size-1
        current_value = team[:players][inner_index]
          arr.push(team[:players][inner_index])
        inner_index += 1
      end
    end
    arr.sort_by! { |q| q[:player_name].size }
    return arr.last[:player_name]
end
