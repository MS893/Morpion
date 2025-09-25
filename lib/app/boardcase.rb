class BoardCase
  attr_accessor :value, :case_ident
  
  def initialize(case_ident)
    @value = " "   # x, o, ou vide (par défaut)
    @case_ident = case_ident
  end
  
end
