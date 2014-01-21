# coding: utf-8

puts 'Seeding the database...'

[
  { pt: 'Arte', en: 'Art' },
  { pt: 'Artes plásticas', en: 'Visual Arts' },
  { pt: 'Circo', en: 'Circus' },
  { pt: 'Comunidade', en: 'Community' },
  { pt: 'Humor', en: 'Humor' },
  { pt: 'Quadrinhos', en: 'Comicbooks' },
  { pt: 'Dança', en: 'Dance' },
  { pt: 'Design', en: 'Design' },
  { pt: 'Eventos', en: 'Events' },
  { pt: 'Moda', en: 'Fashion' },
  { pt: 'Gastronomia', en: 'Gastronomy' },
  { pt: 'Cinema e Vídeo', en: 'Film & Video' },
  { pt: 'Jogos', en: 'Games' },
  { pt: 'Jornalismo', en: 'Journalism' },
  { pt: 'Música', en: 'Music' },
  { pt: 'Fotografia', en: 'Photography' },
  { pt: 'Ciência e Tecnologia', en: 'Science & Technology' },
  { pt: 'Teatro', en: 'Theatre' },
  { pt: 'Esporte', en: 'Sport' },
  { pt: 'Web', en: 'Web' },
  { pt: 'Carnaval', en: 'Carnival' },
  { pt: 'Arquitetura e Urbanismo', en: 'Architecture & Urbanism' },
  { pt: 'Literatura', en: 'Literature' },
  { pt: 'Mobilidade e Transporte', en: 'Mobility & Transportation' },
  { pt: 'Meio Ambiente', en: 'Environment' },
  { pt: 'Negócios Sociais', en: 'Social Business' },
  { pt: 'Educação', en: 'Education' },
  { pt: 'Filmes de Ficção', en: 'Fiction Films' },
  { pt: 'Filmes Documentários', en: 'Documentary Films' },
  { pt: 'Filmes Universitários', en: 'Experimental Films' }
].each do |name|
   category = Category.find_or_initialize_by(name_pt: name[:pt])
   category.update_attributes({
     name_en: name[:en]
   })
 end

{
  company_name: 'Pluribus Fund',
  company_logo: 'https://www.dropbox.com/s/m10p9cen53ie7fb/logothumb.png',
  host: 'http://enigmatic-peak-7191.herokuapp.com',
  base_url: "http://enigmatic-peak-7191.herokuapp.com",
  email_contact: 'contact@pluribusfund.com',
  email_payments: 'finance@pluribusfund.com',
  email_projects: 'projects@pluribusfund.com',
  email_system: 'system@pluribusfund.com',
  email_no_reply: 'no-reply@pluribusfund.com',
  facebook_url: "http://facebook.com/pluribusfund",
  facebook_app_id: '253265074820551',
  twitter_url: 'http://twitter.com/pluribusfund',
  twitter_username: "pluribusfund",
  mailchimp_url: "https://us3.api.mailchimp.com/2.0/",
  catarse_fee: '0.05',
  support_forum: 'http://support.pluribusfund.com/',
  base_domain: 'herokuapp.com',
  uservoice_secret_gadget: 'change_this',
  uservoice_key: 'uservoice_key',
  faq_url: 'http://suporte.catarse.me/',
  feedback_url: 'http://suporte.catarse.me/forums/103171-catarse-ideias-gerais',
  terms_url: 'http://suporte.catarse.me/knowledgebase/articles/161100-termos-de-uso',
  privacy_url: 'http://suporte.catarse.me/knowledgebase/articles/161103-pol%C3%ADtica-de-privacidade',
  about_channel_url: 'http://blog.catarse.me/conheca-os-canais-do-catarse/',
  instagram_url: 'http://instagram.com/catarse_',
  blog_url: "http://blog.pluribusfund.com",
  github_url: 'http://github.com/BPluribus81',
  contato_url: 'http://support.pluribusfund.com/',
}.each do |name, value|
   conf = Configuration.find_or_initialize_by(name: name)
   conf.update_attributes({
     value: value
   }) if conf.new_record?
end


Channel.find_or_create_by!(name: "Channel name") do |c|
  c.permalink = "sample-permalink"
  c.description = "Lorem Ipsum"
end


OauthProvider.find_or_create_by!(name: 'facebook') do |o|
  o.key = 'your_facebook_app_key'
  o.secret = 'your_facebook_app_secret'
  o.path = 'facebook'
end

puts
puts '============================================='
puts ' Showing all Authentication Providers'
puts '---------------------------------------------'

OauthProvider.all.each do |conf|
  a = conf.attributes
  puts "  name #{a['name']}"
  puts "     key: #{a['key']}"
  puts "     secret: #{a['secret']}"
  puts "     path: #{a['path']}"
  puts
end


puts
puts '============================================='
puts ' Showing all entries in Configuration Table...'
puts '---------------------------------------------'

Configuration.all.each do |conf|
  a = conf.attributes
  puts "  #{a['name']}: #{a['value']}"
end

puts '---------------------------------------------'
puts 'Done!'
