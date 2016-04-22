class Code

  attr_reader :code

  def initialize
    @code = ''
    @values = ['r', 'g', 'b', 'y']
  end

  def generate_code
    # Generate random four color sequence

    # code_length = 4
    # a = []
    # code_length.times {a << rand(1..code_length)}
    # @code =  a.join.to_s.tr('1234','rgby')

    @code = [*1..4].map do |el|
       @values.sample
    end.join("")
  end

end
