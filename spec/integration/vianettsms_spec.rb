require 'spec_helper.rb'

describe Vianettsms::Sms, "#deliver", :vianettsms => true do

  let(:valid_config) { { :username => 'diego@maradona.com.ar', 
      :password => 'eldie10' } }

  context "with valid configuration" do
    
    before { Vianettsms.config =  valid_config }
    
    context "with valid params" do    
      let(:valid_params) do {
          :msgid => '1234', 
          :to => '+471111111111',
                  
          :message => 'Aloha!' }
      end 

      let(:sms) { 
        sms = Vianettsms::Sms.new(valid_params)
        sms.deliver
        sms
      }
      it "should have status 200" do
        sms.status.should == "200"
      end

      it "should return correct refno" do
        sms.response_hash['refno'].should == "1234"
      end
    end
    
  end
  
  context "with invalid configuration" do
    let(:invalid_config) { { :username => 'diego@maradona.com.ar', 
      :password => '1234' } }
    
    before { Vianettsms.config =  invalid_config }
    
    let(:valid_params) do {
        :msgid => '1234',
        :to => '4711111111',
        :message => 'Hello World' }
    end    

    let(:sms) { 
      sms = Vianettsms::Sms.new(valid_params)
      sms.deliver
      sms
    }
    
    it "should return errorcode 100 (Login failed)" do
      sms.status.should == "100"
    end

  end
  
end
