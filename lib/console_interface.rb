class ConsoleInterface
  FIGURES =
    Dir[
      File.join(
        __dir__,
        '../',
        'data',
        'figures',
        '*.txt'
      )
    ] .sort
      .map { |file_name| File.read(file_name) }

  def initialize(game)
    @game = game
  end

  def errors_joined
    @game.errors.join(", ")
  end

  def figure
    FIGURES[@game.error_count]
  end

  def get_input
    print "Введите следующую букву: "
    letter = gets[0].upcase
    letter
  end

  def print_out
    puts <<~INTERFACE
      Слово: #{word_to_show}
      #{figure}
      Ошибки (#{@game.error_count}): #{errors_joined}
      У вас осталось ошибок: #{@game.errors_left}

    INTERFACE

    if @game.won?
      puts "Поздравляем, вы выиграли!"
    elsif @game.lost?
      puts "Вы проиграли, загаданное слово: #{@game.word}"
    end
  end

  def word_to_show
    @game.letters_guessed
      .map { |letter| letter.nil? ? '__' : letter }
      .join(' ')
  end
end
