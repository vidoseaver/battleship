class ship
  def initialize
    @destroyer_cords = []
  def destroyer(start, end)
  end

  def destroyer_placer
    puts "Ok lets place your destroyer, it takes two spaces\n
    remember, the coordinates you give me must be adjacent.\n
    Please give me the starting coordinate"
    @destroyer_cords << gets.chomp
  end

end
