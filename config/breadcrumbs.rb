crumb :root do
  link t(:home), root_path
end

crumb :intro do
  link t(:menu_intro), intro_company_path
end

crumb :service_intro do
  link t(:menu_intro), intro_service_path
end

crumb :sitemap do
  link t(:sitemap), sitemap_index_path
end

crumb :contact do
  link t(:menu_support), contacts_path
end

crumb :reports do
  link t(:menu_program), reports_path
end

crumb :programs do
  link t(:menu_program), reports_path
end

crumb :report do |report|
  link report.title, report_path(report)
  parent :reports
end

crumb :faqs do
  link t(:menu_support), faqs_path
end

crumb :faq do |faq|
  link faq.title, faq_path(faq)
  parent :faqs
end

crumb :orders do
  link t(:menu_order), orders_path
end