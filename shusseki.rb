require 'dotenv'
require 'mechanize'

Dotenv.load

agent = Mechanize.new

agent.get('https://www2.nhk.or.jp/gogaku/') do |page|
  login_page = agent.click(page.link_with(text: 'ログインする'))

  my_page = login_page.form_with(name: 'form1') do |f|
    f.field_with(id: 'nhk_id').value = ENV['NHK_ID']
    f.field_with(id: 'login_pass').value = ENV['PASSWORD']
    f.action = '/pidh02/login.do'
  end.submit
end
