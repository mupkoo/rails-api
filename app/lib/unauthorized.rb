class Unauthorized < StandardError

    attr_reader :message

    def initialize(message = nil)
        @message = message

        @default_message = "You are not authorized."
        @default_error_code = '401'
    end

    def to_s
        @message || @default_message
    end

end
