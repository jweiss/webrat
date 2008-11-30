module Webrat
  class Label #:nodoc:
    
    def self.xpath_search
      ".//label"
    end
    
    def initialize(field, element)
      @field    = field
      @element  = element
    end
    
    def matches_text?(label_text)
      text =~ /^\W*#{Regexp.escape(label_text.to_s)}\b/i
    end
    
    def text
      str = Webrat::XML.all_inner_text(@element)
      str.gsub!("\n","")
      str.strip!
      str.squeeze!(" ")
      str
    end

    def for_id
      Webrat::XML.attribute(@element, "for")
    end
    
  end
end
