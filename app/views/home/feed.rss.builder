xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title t(:application_name)
    xml.author 'Jedaeroweb'
    xml.description @meta_description
    xml.link t(:site_full_url)
    xml.language I18n.locale.to_s

    for article in @programs
      xml.item do
        xml.title article.title
        xml.author 'Jedaeroweb'
        xml.pubDate article.created_at.strftime("%a, %d %b %Y %H:%M:%S %z")
        xml.link t(:site_full_url)+ '/programs/' + article.id.to_s
        xml.guid article.id

        if article.program_content.present?
        text = article.program_content.content.to_s
		# if you like, do something with your content text here e.g. insert image tags.
		# Optional. I'm doing this on my website.
        xml.description "<p>" + text + "</p>"
        end
      end
    end

    for article in @products
      xml.item do
        xml.title article.title
        xml.author 'Jedaeroweb'
        xml.pubDate article.created_at.strftime("%a, %d %b %Y %H:%M:%S %z")
        xml.link t(:site_full_url)+ '/orders?product=' + article.id.to_s
        xml.guid article.id

        if article.product_content.present?
        text = article.product_content.content.to_s
		# if you like, do something with your content text here e.g. insert image tags.
		# Optional. I'm doing this on my website.
        xml.description "<p>" + text + "</p>"
        end
      end
    end

  end
end
