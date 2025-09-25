class BoardCase
  attr_accessor :value, :case_ident
  
  def initialize(case_ident)
    @value = " "   # X, O, ou vide (par défaut)
    @case_ident = case_ident
  end
  
end
