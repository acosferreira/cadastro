
ICONV_CONVERTER = Iconv.new( 'UTF-16BE//IGNORE//TRANSLIT', 'utf-8')

module PDF
  class Writer
    def add_text_with_utf8_support(x, y, text, *args)
      begin
        add_text_without_utf8_support(x, y,  ICONV_CONVERTER.iconv(text), *args)
      rescue Iconv::InvalidCharacter
        logger.debug("UTF8 CONVERSION FAILS ON #{text} (#{(bytes = []) && text.each_byte{|byte| bytes << byte} && bytes.join(',')})")
        add_text_without_utf8_support(x, y, text, *args)
      end
    end
    alias_method_chain :add_text, :utf8_support
  end

 
end