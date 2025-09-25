class Player
  attr_accessor :name, :value
  
  def initialize(name, signe)
    # un joueur est défini par son nom et le signe qu'il joue (O ou X)
    @name = name
    @value = signe
  end
  
end
