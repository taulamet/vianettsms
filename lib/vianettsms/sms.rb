module Vianettsms

  class Sms
    attr_accessor :to, :message, :msgid

    attr_reader :status, :response_hash

    def initialize(params={})
      @to = params[:to]
      @message = params[:message]
      @msgid = params[:msgid]
      @response = nil
      @response_hash= {}
      @status = nil
      @delivered = false
    end

    def deliver
      params = {
        :username => Vianettsms.config[:username],
        :password => Vianettsms.config[:password],
        :tel => @to || "",
        :msg => @message || "",
        :msgid => @msgid || ""
      }
      if valid?(params)
        handle_response(params)
      end
      delivered?
    end
    
    def delivered?
      @delivered
    end

    private 

    attr_accessor :response

    def valid?(params)
      not (params[:tel].empty? or params[:msg].empty? or params[:msgid].empty?)
    end

    def handle_response(params)
      uri = URI.parse(Vianettsms.url)
      @response = Net::HTTP.post_form(uri, params)
      unless @response.nil?
        @response_hash = XmlSimple.xml_in(@response.body)        
        @status = @response_hash['errorcode']
        @delivered = @status == '200'
      end
    end
  end

end
