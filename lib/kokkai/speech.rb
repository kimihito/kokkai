require 'kokkai/record'
module Kokkai
  class Speech < Record
    SPEECH_ATTRIBUTES = %i(speech_order speaker speech)

    define_attribute_methods(SPEECH_ATTRIBUTES)
  end
end