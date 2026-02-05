module JsonLdHelper
  def json_ld_for_blog(post)
    {
      "@context": "https://schema.org",
      "@type": "BlogPosting",
      "mainEntityOfPage": {
        "@type": "WebPage",
        "@id": blog_url(post)
      },
      "headline": post.title,
      "description": post.description || truncate(strip_tags(post.content), length: 160),
      "image": post.blog_picture ? sl_get_thumb(post.blog_picture.picture.to_s,'medium') : '-',
      "author": {
        "@type": "Person",
        "name": post.user&.name || "익명"
      },
      "publisher": {
        "@type": "Organization",
        "name": "My Blog",
        "logo": {
          "@type": "ImageObject",
          "url": asset_url("favicon.ico")
        }
      },
      "genre": post.blog_category.title || "블로그",
      "datePublished": post.created_at.iso8601,
      "dateModified": post.updated_at.iso8601
    }
  end

  def json_ld_for_gallery(gallery)
    {
      "@context": "https://schema.org",
      "@type": "ImageGallery",
      "name": gallery.title,
      "url": gallery_url(gallery),
      "image": {
          "@type": "ImageObject",
          "url": gallery.photo.url,
          "caption": gallery.title,
          "thumbnail": sl_get_thumb(gallery.photo.to_s,'medium')
        },
      "datePublished": gallery.created_at.iso8601,
      "dateModified": gallery.updated_at.iso8601
    }
  end

  def json_ld_for_faq_page(faqs)
    {
      "@context": "https://schema.org",
      "@type": "FAQPage",
      "mainEntity": faqs.map do |faq|
        {
          "@type": "Question",
          "name": faq.title,
          "acceptedAnswer": {
            "@type": "Answer",
            "text": faq.content.to_plain_text
          }
        }
      end
    }
  end

  def json_ld_for_profile()
    {
      "@context": "https://schema.org",
      "@type": "ProfilePage",
      "mainEntity": {
        "@type": "Person",
        "name": "정진규",
        "url": 'https://www.jingyu.pe.kr',
        "image": asset_url('intro.jpg'),
        "jobTitle": "은퇴자",
        "birthDate": "1953-11-02"
      }
    }
  end

  def json_ld_for_about()
    {
      "@context": "https://schema.org",
      "@type": "AboutPage",
      "name": "Jedaeroweb",
      "url": "https://www.jedaeroweb.co.kr/intro",
      "mainEntity": {
        "@type": "Organization",
        "name": "Jedaeroweb",
        "logo": "https://www.jedaeroweb.co.kr/favicon.ico"
      }
    }

  end

  def json_ld_for_programs(programs)
    {
      "@context": "https://schema.org",
      "@type": "ItemList",
      "itemListElement": programs.each_with_index.map do |program, index|
        {
          "@type": "ListItem",
          "position": index + 1,
          "item": {
            "@type": "SoftwareApplication",
            "name": program.title,
            "description": program.description,
            "url": program.service_link
          }
        }
      end
    }
  end

  def json_ld_for_program(program)
    {
      "@context": "https://schema.org",
      "@type": "SoftwareApplication",
      "name": program.title,
      "description": program.description,
      "applicationCategory": "BusinessApplication",
      "operatingSystem": "Web",
      "url": program.service_link,
      "publisher": {
        "@type": "Organization",
        "name": "Jedaeroweb"
      }
    }
  end

  def json_ld_for_product_categories(product_categories)
    {
      "@context": "https://schema.org",
      "@type": "ItemList",
      "itemListElement": product_categories.each_with_index.map do |category, index|
        {
          "@type": "ListItem",
          "position": index + 1,
          "item": {
            "@type": "Thing",
            "name": category.title,
            "url": product_category_url(category)
          }
        }
      end
    }
  end

  def json_ld_for_products(products)
    {
      "@context": "https://schema.org",
      "@type": "ItemList",
      "itemListElement": products.each_with_index.map do |product, index|
        {
          "@type": "ListItem",
          "position": index + 1,
          "item": json_ld_for_product(product)
        }
      end
    }
  end


  def json_ld_for_product(product)
    json = {
      "@context": "https://schema.org",
      "@type": "Product",
      "name": product.title,
      "category": product.product_category.title,
      "offers": {
        "@type": "Offer",
        "price": product.price,
        "priceCurrency": "KRW"
      }
    }

    if product.product_content&.content.present?
      json["description"] = product.product_content.content
    end

    json
  end
end