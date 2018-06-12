module Kokkai
  module ApiMethods
    def speech(params = nil)
      send_get("/api/1.0/speech", params)
    end
  end
end