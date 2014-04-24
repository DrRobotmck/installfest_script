acts = []
1.upto(5) do |act_num|
  act = "act#{act_num}"
  1.upto(5) do |scene_num|
    scene = " scene#{scene_num}"
    acts << act + scene
  end
end

acts.each do |act|
  file = act.gsub(" ", "_")
  `figlet "#{act}" >> #{file}.sh`
end
