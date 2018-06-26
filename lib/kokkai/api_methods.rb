module Kokkai
  module ApiMethods
    def speech(params = nil)
      send_get("/api/1.0/speech", params)
    end

    def meeting(params = nil)
      send_get("/api/1.0/meeting", params)
    end
  end
end