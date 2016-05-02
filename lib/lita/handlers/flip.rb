require "lita"

module Lita
  module Handlers
    class Flip < Handler
      FLIPPER = '(╯°□°）╯︵ '.freeze
      FLIPPED_CHARACTERS = {
        '!' => '¡',
        '?' => '¿',
        '6' => '9',
        '9' => '6',
        'a' => 'ɐ',
        'b' => 'q',
        'c' => 'ɔ',
        'd' => 'p',
        'e' => 'ǝ',
        'f' => 'ɟ',
        'g' => 'b',
        'h' => 'ɥ',
        'i' => 'ı',
        'j' => 'ɾ',
        'k' => 'ʞ',
        'l' => 'l',
        'm' => 'ɯ',
        'n' => 'u',
        'o' => 'o',
        'p' => 'd',
        'q' => 'b',
        'r' => 'ɹ',
        's' => 's',
        't' => 'ʇ',
        'u' => 'n',
        'v' => 'ʌ',
        'w' => 'ʍ',
        'x' => 'x',
        'y' => 'ʎ',
        'z' => 'z',
        '<' => '>',
        '>' => '<',
        '(' => ')',
        ')' => '(',
        '[' => ']',
        ']' => '[',
        '/' => '\\',
        '\\' => '/',
        ',' => '\'',
        '\'' => ',',
      }

      FLIPPED_WORDS = {
        'table'      => '┻━┻',
        ':poop:'     => ':icecream:',
        ':icecream:' => ':poop:'
      }

      route %r{\Aflip(?:\s+me)?\s+(.*)\Z}, :flip,
        command: true,
        help: {
          'flip TERM' => 'flips TERM into ɯɹǝʇ'
        }

      def flip(response)
        sentence = response.matches.first.first.downcase

        response.reply "#{ FLIPPER }#{flip_sentence(sentence) }"
      end

      def flip_sentence(sentence)
        sentence.
          split(/\s+/).
          map { |word| flip_word(word) }.
          reverse.
          join(' ')
      end

      def flip_word(word)
        FLIPPED_WORDS.fetch(word) do |w|
          w.chars.map { |char| flip_char(char) }.join.reverse
        end
      end

      def flip_char(char)
        FLIPPED_CHARACTERS.fetch(char) { FLIPPED_CHARACTERS.key(char) }
      end
    end

    Lita.register_handler(Flip)
  end
end
