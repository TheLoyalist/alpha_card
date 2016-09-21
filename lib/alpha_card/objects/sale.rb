module AlphaCard
  ##
  # Implementation of Alpha Card Services Sale transaction.
  # Contains all the information about Customer Credit Card,
  # such as CVV, number, expiration date, etc.
  # Process the Alpha Card Services payment.
  class Sale < AlphaCardObject
    # Format: MMYY
    attribute :card_expiration_date, String
    attribute :card_number, String
    attribute :amount, String
    attribute :cvv, String
    # Values: 'true' or 'false'
    attribute :customer_receipt, String

    ##
    # Payment type.
    # Values: 'creditcard' or 'check'
    attribute :payment, String, default: 'creditcard'

    ##
    # Transaction type (default is 'sale')
    #
    # @attribute [r] type
    attribute :type, String, default: 'sale', writer: :private

    ##
    # Original AlphaCard transaction variables names
    ORIGIN_TRANSACTION_VARIABLES = {
      card_expiration_date: :ccexp,
      card_number: :ccnumber
    }.freeze

    deprecate_old_variables!

    ##
    # Creates the sale for the specified <code>AlphaCard::Order</code>
    # with the <code>AlphaCard::Account</code> credentials.
    #
    # @param [AlphaCard::Order] params
    #    An <code>AlphaCard::Order</code> object.
    # @param [AlphaCard::Account] account
    #   An <code>AlphaCard::Account</code> object.
    #
    # @return [Boolean]
    #   True if sale was created successfully.
    #   Raise an AlphaCardError exception if some error occurred.
    #
    # @raise [AlphaCard::InvalidObjectError]
    #   Exception if one of required attributes doesn't specified.
    #
    # @example
    #   account = AlphaCard::Account.new('demo', 'password')
    #   order = AlphaCard::Order.new(id: 1, description: 'Test order')
    #   sale = AlphaCard::Sale.new(card_expiration_date: '0117', card_number: '4111111111111111', amount: '5.00' )
    #   sale.create(order, account)
    #
    #   #=> true
    def create(order, account)
      abort_if_attributes_blank!(:card_expiration_date, :card_number, :amount)

      AlphaCard.request(account, params_for_sale(order)).success?
    end

    private

    ##
    # Returns all the necessary attributes with it's original
    # names that must be passed with Sale transaction.
    #
    # @param [AlphaCard::Order] order
    #    An <code>AlphaCard::Order</code> object.
    #
    # @return [Hash]
    #   Params of *self* object merged with params
    #   of another object (<code>AlphaCard::Order</code>)
    def params_for_sale(order)
      attributes_for_request.merge(order.attributes_for_request)
    end
  end
end
