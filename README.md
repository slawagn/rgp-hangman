# Описание

Простая консольная реализация игры "Виселица",
в которой игрок должен угадать слово по буквам,
имея ограниченное количество догадок

# Использование

1. [Установить](https://github.com/postmodern/ruby-install) Ruby
(точно работает с версией 3.1.2)

2. Установить Bundler

```bash
$ gem install bundler
```

3. Установить зависимости, выполнив команду `bundle` в папке с проектом

4. Запустить игру 

```bash
$ bundle exec ruby hangman.rb
```

5. Играть

При желании можно добавить свои слова в `data/words.txt`

## Для пользователей VSCode с установленным Docker

С помощью расширения
[Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
можно, открыв в VSCode папку с проектом, запустить контейнер
командой `Reopen in Container`. Ruby и зависимости
будут установлены автоматически, останется только запустить игру
