class Game
  TOTAL_ERRORS_ALLOWED = 7

  def initialize(word)
    @letters = word.chars
    @user_guesses = []
  end

  def errors
    @user_guesses - letters_normalized
  end

  def error_count
    errors.length
  end

  def errors_left
    TOTAL_ERRORS_ALLOWED - error_count
  end

  def letters_guessed
    @letters.map do |letter|
      letter if @user_guesses.include?(normalize(letter))
    end
  end

  def lost?
    errors_left == 0
  end

  def over?
    won? || lost?
  end

  def play!(letter)
    letter = normalize(letter)
    unless over? || @user_guesses.include?(letter)
      @user_guesses << letter
    end
  end

  def won?
    (letters_normalized - @user_guesses).empty?
  end

  def word
    @letters.join
  end

  private

    def letters_normalized
      @letters.map { |char| normalize(char) }
    end

    def normalize(char)
      case char
      when 'Ё'
        'Е'
      when 'Й'
        'И'
      else
        char
      end
    end
end
