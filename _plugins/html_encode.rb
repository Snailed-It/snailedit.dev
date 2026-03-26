module Jekyll
  module HtmlEncodeFilter
    require 'liquid'

    def html_encode(input)
      encoded = input.chars.map { |c| '&' + '#' + c.ord.to_s + ';' }.join
      encoded.respond_to?(:html_safe) ? encoded.html_safe : encoded
    end
  end
end

Liquid::Template.register_filter(Jekyll::HtmlEncodeFilter)