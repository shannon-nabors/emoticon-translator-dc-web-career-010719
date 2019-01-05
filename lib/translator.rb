require "yaml"
require "pry"


def load_library(file_path)
  file = YAML.load_file(file_path)
  library = {}
  library["get_meaning"] = {}
  library["get_emoticon"] = {}

  file.each do |meaning, emoticon_set|
    library["get_meaning"][emoticon_set[1]] = meaning
    library["get_emoticon"][emoticon_set[0]] = emoticon_set[1]
  end

  library
end



def get_japanese_emoticon(file_path, emoticon)
  output = load_library(file_path)["get_emoticon"][emoticon]
  if output == nil
    "Sorry, that emoticon was not found"
  else
    output
  end
end



def get_english_meaning(file_path, emoticon)
  output = load_library(file_path)["get_meaning"][emoticon]
  if output == nil
    "Sorry, that emoticon was not found"
  else
    output
  end
end
