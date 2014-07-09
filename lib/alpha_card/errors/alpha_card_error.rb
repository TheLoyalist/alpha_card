module AlphaCard
  ##
  # Common class for Alpha Card Gateway errors and exceptions.
  class AlphaCardError < StandardError
    # Alpha Card Gateway response.
    # @attr_reader [AlphaCard::AlphaCardResponse] response
    attr_reader :response
    # Error message.
    # @attr_reader [String] message
    attr_reader :message

    ##
    # <code>AlphaCard::AlphaCardError</code> constructor.
    #
    # @param [String] response
    #   Error message
    # @param [AlphaCard::AlphaCardResponse] response
    #   AlphaCard Gateway response
    #
    # @example
    #   AlphaCard::AlphaCardError.new
    #
    #   #=> #<AlphaCard::AlphaCardError: AlphaCard::AlphaCardError>
    def initialize(message = nil, response = nil)
      @message = message
      @response = response
    end
  end
end
