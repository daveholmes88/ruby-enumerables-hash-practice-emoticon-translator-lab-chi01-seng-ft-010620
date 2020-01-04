require 'yaml'
require 'pp'
require 'pry'

def load_library(emoticon_lab)
  hash1 = YAML.load_file("lib/emoticons.yml")
#  pp hash1
  hash = {}
  hash[:get_meaning] = {}
  hash[:get_emoticon] = {}
  hash1.each do |key, value|
      hash[:get_meaning][value[1]] = key
      hash[:get_emoticon][value[0]] = value[1]
  end
  hash
end

def get_japanese_emoticon(emoticon_lab, emoticon)
  hash = load_library(emoticon_lab)
  hash.each do |key, value|
    if key == :get_emoticon
      a = value.find do |attribute|
        emoticon == attribute[0]
    end
      if a.nil?
        return "Sorry, that emoticon was not found"
      else
        a[1]
      end
  end
end

def get_english_meaning(emoticon_lab, emoticon)
  hash = load_library(emoticon_lab)
  hash.each do |key, value|
    if key == :get_meaning
      a = value.find do |attribute|
        emoticon == attribute[0]

        # if emoticon == attribute[0]
        #   return attribute[1]
        # else
        #   "Sorry, that emoticon was not found"
        # end
      end
      if a.nil?
        return "Sorry, that emoticon was not found"
      else
        return a[1]
      end
    end
  end
end
