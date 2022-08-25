require 'colorize'

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
    @game.errors.join(', ')
  end

  def figure
    FIGURES[@game.error_count]
  end

  def get_input
    print 'Введите следующую букву: '
    letter = gets[0].upcase
    letter
  end

  def print_out
    puts "Слово: #{word_to_show}".colorize(:blue)
    puts figure.colorize(:yellow)
    puts "Ошибки (#{@game.error_count}): #{errors_joined}".colorize(:red)
    puts "У вас осталось ошибок: #{@game.errors_left}"

    if @game.won?
      puts 'Поздравляем, вы выиграли!'
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
