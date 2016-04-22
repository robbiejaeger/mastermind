class Code

  attr_reader :code

  def initialize
    @code = ''
  end

  def generate_code
    # Generate random four color sequence
    code_length = 4
    a = []
    code_length.times {a << rand(1..code_length)}
    @code =  a.join.to_s.tr('1234','rgby')
  end

end
