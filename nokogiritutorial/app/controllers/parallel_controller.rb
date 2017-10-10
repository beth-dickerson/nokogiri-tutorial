class ParallelController < ApplicationController
  def parallelrate
    # require openssl opens webpages in code
    require 'open-uri'
    # doc variable contains scraped/parsed content
    # Nokogiri looks for selectors on webpages and uses selectors to know what to scrape
    doc = Nokogiri::HTML(open('https://abokifx.com/', :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))

    # lagos-market-rates-inner is a div class
    entries = doc.css('.lagos-market-rates-inner')
    # rate looks at 1st table, 2nd tr, 2nd td
    rate = entries.css('table')[0].css('tr')[1].css('td')[1].text
    # specifies characters in 6th, 7th, 8th positions
    @formattedrate = rate[6..8]
    render template: 'parallel/home'
  end
end
