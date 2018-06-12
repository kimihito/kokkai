module Kokkai
  module Utils
    module StringFormatter
      refine String do
        def to_chain()
          normalize().gsub(" ", "-")
        end

        def to_snake()
          normalize().gsub(" ", "_")
        end

        def to_camel()
          to_pascal().sub(/./) { $&.downcase }
        end

        def to_pascal()
          normalize().split.map { |e| e.capitalize }.join
        end

        private
          def normalize()
            text = self
            if text =~ / /
              text.downcase
            elsif text =~ /-/
              text.gsub("-", " ").downcase
            elsif text =~ /_/
              text.gsub("_", " ").downcase
            else
              text.split(/(?=[A-Z])/).join(" ").downcase
            end
          end
      end
    end
  end
end