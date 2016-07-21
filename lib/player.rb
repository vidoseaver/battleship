class Player
  attr_reader   :name,
                :first_ship_coordinates


  def set_name
    @name = gets.chomp
  end

  def first_ship_coordinates_changer
    @first_ship_coordinates = gets.chomp
  end



end
