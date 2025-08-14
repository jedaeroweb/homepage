# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
#
ProductCategory.create!(id: 1, title: '제대로웹 프로그램 설치, 설정',product_category_content_attributes: {content: '제대로웹의 프로그램으로 웹사이트를, 나의 도메인으로 작동시킬수 있습니다.'})
ProductCategory.create!(id: 2, title: '제대로웹 프로그램 수정, 커스텀 서비스',product_category_content_attributes: {content: '제대로웹 프로그램을 내가 원하는 방식으로 수정하여 맞춤 제작 합니다.'})
ProductCategory.create!(id: 3, title: '웹,앱 제작, 유지보수',product_category_content_attributes: {content: '새로운 웹 또는 앱 프로그램 제작, 기존에 가지고 있는 프로그램 유지보수'})
ProductCategory.create!(id: 4, title: '서버관련',product_category_content_attributes: {content: '서버 설치,설정, 이전등의 작업'})

Product.create!(id: 1, product_category_id: 1, title: '기본 제대로웹 프로그램 설치, 설정', price: 550000)

Product.create!(id: 4, product_category_id: 2, title: '제대로웹 프로그램 사용 제작', price: 2000)
Product.create!(id: 5, product_category_id: 2, title: '기타 신규 프로그램 제작', price: 2000)

Product.create!(id: 6, product_category_id: 3, title: '문제점개선', price: 300000)
Product.create!(id: 7, product_category_id: 3, title: '속도개선', price: 300000)

Product.create!(id: 8, product_category_id: 4, title: '서버 설치,설정', price: 300000)
Product.create!(id: 9, product_category_id: 4, title: '서버 이전', price: 300000)
Product.create!(id: 10, product_category_id: 4, title: '서버 기술지원', price: 300000)


ProgramLanguage.create!(:id=>1,:title=>'ruby',:link=>'https://www.ruby-lang.org/',:enable=>1)
ProgramLanguage.create!(:id=>2,:title=>'PHP',:link=>'https://www.php.net/',:enable=>1)
ProgramLanguage.create!(:id=>3,:title=>'CSS',:link=>nil,:enable=>1)
ProgramLanguage.create!(:id=>4,:title=>'javascript',:link=>nil,:enable=>1)
ProgramLanguage.create!(:id=>5,:title=>'java',:link=>'https://www.java.com/',:enable=>1)
ProgramLanguage.create!(:id=>6,:title=>'python',:link=>'https://www.python.org/',:enable=>1)

ProgramCategory.create!(:id=>1,:program_language_id=>1,:title=>'Ruby on Rails',:link=>'http://rubyonrails.org/')
ProgramCategory.create!(:id=>2,:program_language_id=>2,:title=>'Pure PHP')
ProgramCategory.create!(:id=>3,:program_language_id=>2,:title=>'Wordpress',:link=>'https://wordpress.org/')
ProgramCategory.create!(:id=>4,:program_language_id=>2,:title=>'Mediawiki',:link=>'https://www.mediawiki.org/wiki/MediaWiki')
ProgramCategory.create!(:id=>5,:program_language_id=>2,:title=>'Codeigniter',:link=>'https://codeigniter.com/')
ProgramCategory.create!(:id=>7,:program_language_id=>3,:title=>'Boostrap',:link=>'http://getbootstrap.com/',:main=>false)
ProgramCategory.create!(:id=>8,:program_language_id=>4,:title=>'Jquery',:link=>'https://jquery.com/',:main=>false)


Program.create!(:id=>1,:title=>'제대로웹 홈페이지',:description=>'현재 보고계시는 제대로웹의 홈페이지입니다. 회사 소개용',program_pictures_attributes: [{ picture: File.open(Rails.root.join("app", "assets", "images", "company1.jpg")) }])
Program.create!(:id=>2,:title=>'제대로웹 커뮤니티',:description=>'회원끼리 소통하는 커뮤니티 프로그램',program_pictures_attributes: [{ picture: File.open(Rails.root.join("app", "assets", "images", "community1.jpg")) }])
Program.create!(:id=>3,:title=>'역경매 쇼핑몰',:description=>'구매자가 판매자들의 입찰중 마음에 드는 것을 골라 진행 하는 프로그램입니다.',program_pictures_attributes: [{ picture: File.open(Rails.root.join("app", "assets", "images", "interior1.jpg")) }])
Program.create!(:id=>4,:title=>'헬스장관리',:description=>'헬스장에서 회원,수강,대여등을 관리하는 프로그램입니다.')
Program.create!(:id=>5,:title=>'카페(매점)주문,관리',:description=>'카페,매점등에서 회원,상품,주문등을 관리하는 프로그램입니다.')
Program.create!(:id=>6,:title=>'쇼핑몰',:description=>'쇼핑몰 프로그램입니다')


ProgramCategoriesProgram.create!(:id=>1,:program_category_id=>1,:program_id=>1)
ProgramCategoriesProgram.create!(:id=>2,:program_category_id=>1,:program_id=>2)
ProgramCategoriesProgram.create!(:id=>3,:program_category_id=>1,:program_id=>3)
ProgramCategoriesProgram.create!(:id=>4,:program_category_id=>1,:program_id=>4)

ProgramLinkCategory.create!(:id=>1, :title=>'service')
ProgramLinkCategory.create!(:id=>2, :title=>'repository')
ProgramLinkCategory.create!(:id=>3, :title=>'download')

ProgramLink.create!(:program_link_category_id=>1, :program_id=>1, :title=>'체험(현재 서비스 중)',:link=>'https://www.jedaeroweb.co.kr')
ProgramLink.create!(:program_link_category_id=>2, :program_id=>1, :title=>'github',:link=>'https://github.com/jedaeroweb/homepage')
ProgramLink.create!(:program_link_category_id=>3, :program_id=>1, :title=>'다운로드',:link=>'https://github.com/jedaeroweb/homepage/archive/refs/heads/main.zip')

ProgramLink.create!(:program_link_category_id=>1, :program_id=>2, :title=>'체험(현재 서비스 중)',:link=>'https://community.jedaeroweb.co.kr')
ProgramLink.create!(:program_link_category_id=>2, :program_id=>2, :title=>'github ',:link=>'https://github.com/jedaeroweb/community')
ProgramLink.create!(:program_link_category_id=>3, :program_id=>2, :title=>'다운로드',:link=>'https://github.com/jedaeroweb/community/archive/refs/heads/master.zip')

ProgramLink.create!(:program_link_category_id=>1, :program_id=>3, :title=>'체험(데모)',:link=>'https://interior.jedaeroweb.co.kr')
ProgramLink.create!(:program_link_category_id=>2, :program_id=>3, :title=>'github ',:link=>'https://github.com/jedaeroweb/home_renovation')
ProgramLink.create!(:program_link_category_id=>3, :program_id=>3, :title=>'다운로드',:link=>'https://github.com/jedaeroweb/home_renovation/archive/refs/heads/main.zip')

ProgramLink.create!(:program_link_category_id=>1, :program_id=>5, :title=>'체험(데모)',:link=>'https://cafe.jedaeroweb.co.kr')
ProgramLink.create!(:program_link_category_id=>2, :program_id=>5, :title=>'github ',:link=>'https://github.com/jedaeroweb/cafe')
ProgramLink.create!(:program_link_category_id=>3, :program_id=>5, :title=>'다운로드',:link=>'https://github.com/jedaeroweb/cafe/archive/refs/heads/master.zip')

ProgramLink.create!(:program_link_category_id=>1, :program_id=>4, :title=>'체험(데모)',:link=>'https://fitness.jedaeroweb.co.kr')
ProgramLink.create!(:program_link_category_id=>2, :program_id=>4, :title=>'github ',:link=>'https://github.com/jedaeroweb/fitness')
ProgramLink.create!(:program_link_category_id=>3, :program_id=>4, :title=>'다운로드',:link=>'https://github.com/jedaeroweb/fitness/archive/refs/heads/master.zip')





FaqCategory.create!(id: 1, title: '프로그램')
FaqCategory.create!(id: 2, title: '서비스')
FaqCategory.create!(id: 3, title: '기타')

Faq.create!(id: 1,:faq_category_id=>1, title: '프로그램은 어떤것 인가요?',faq_content_attributes: {content: 'Ruby on Rails를 이용하여 만들어진 프로그램들로 서버에 올리면 바로 멋진 웹사이트를 작동시킬수 있습니다.'})
Faq.create!(id: 2,:faq_category_id=>1, title: '서버는 어떤것을 해야되나요?',faq_content_attributes: {content: '이곳의 프로그램은 서버는 어떤것이라도 상관없지만 웹호스팅 방식이 아닌 단독서버 또는 가상서버 방식이여야 웹사이트를 작동시킬수 있습니다'})
Faq.create!(id: 3,:faq_category_id=>1, title: '설정, 설치는 어떻게 해야되나요?',faq_content_attributes: {content: '설치, 설정이 다소 어려울 수 있지만 여기를 보면서 따라하면 누구라도 설치, 설정을 완료할 수 있습니다.  또한 이 과정이 힘들거나 투입할 노력-시간이 없다면 서비스 신청을 하시면 바로 처리 가능합니다'})
Faq.create!(id: 4,:faq_category_id=>2, title: '신규 제작도 해주나요?',faq_content_attributes: {content: '이곳의 프로그램을 수정하는 사이트라면 물론 가능하고 그 밖에 어떤 형태의 웹사이트가 필요한지 말씀해주시면 최대한 상담, 제작해드립니다'})
Faq.create!(id: 5,:faq_category_id=>2, title: '기존에 있는 프로그램 유지보수가 필요한데 가능한가요?',faq_content_attributes: {content: '이곳의 프로그램을 수정하는 사이트라면 물론 가능하고 그 밖에 어떤 형태의 웹사이트라도 유지보수 서비스를 제공하고 있습니다'})
Faq.create!(id: 6,:faq_category_id=>3, title: '반응형웹도 되나요?',faq_content_attributes: {content: '이곳의 프로그램들은 기본적으로 반응형을 지원합니다'})
Faq.create!(id: 7,:faq_category_id=>3 ,title: '앱개발도 가능한가요?',faq_content_attributes: {content: '앱은 반응형이므로 이를 감싸는 형태의 하이브리드 앱으로 제작하며 마켓에 올려드리는 서비스가 있습니다'})





I18n.locale = :en

faq_category1=FaqCategory.find(1)
faq_category1.title='Programs'
faq_category1.save!

faq_category2=FaqCategory.find(2)
faq_category2.title='Services'
faq_category2.save!

faq_category3=FaqCategory.find(3)
faq_category3.title='Etc'
faq_category3.save!

faq1=Faq.find(1)
faq1.title='Genosolution是什么样的服务？'
faq1.save!

faq_content1=FaqContent.find(1)
faq_content1.content='Genosolution是消费者直接委托形式(DTC, Direct-To-Consumer)的个人遗传基因分析服务，以更便捷、有趣的形式提供保健福祉部批准的12项遗传基因检查结果。详细的服务项目如下。▶6个外在特征(身高体重指数、色素沉淀、脱发、毛发粗细、皮肤老化、皮肤弹性) ▶6个内在特征 (中性脂肪浓度、胆固醇、血糖、血压、维生素C代谢、咖啡因代谢)'
faq_content1.save!



I18n.locale = :'zh-CN'

faq_category1=FaqCategory.find(1)
faq_category1.title='程式'
faq_category1.save!

faq_category2=FaqCategory.find(2)
faq_category2.title='服务'
faq_category2.save!

faq_category3=FaqCategory.find(3)
faq_category3.title='其他'
faq_category3.save!

faq1=Faq.find(1)
faq1.title='Genosolution是什么样的服务？'
faq1.save!

faq_content1=FaqContent.find(1)
faq_content1.content='Genosolution是消费者直接委托形式(DTC, Direct-To-Consumer)的个人遗传基因分析服务，以更便捷、有趣的形式提供保健福祉部批准的12项遗传基因检查结果。详细的服务项目如下。▶6个外在特征(身高体重指数、色素沉淀、脱发、毛发粗细、皮肤老化、皮肤弹性) ▶6个内在特征 (中性脂肪浓度、胆固醇、血糖、血压、维生素C代谢、咖啡因代谢)'
faq_content1.save!