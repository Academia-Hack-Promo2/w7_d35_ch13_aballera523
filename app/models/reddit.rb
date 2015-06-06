require 'httparty'

class Reddit
  include HTTParty
  @notices = []  
  @authors = []
  @titles = []
  reddit = HTTParty.get('http://www.reddit.com/.json')
  reddit["data"]["children"].each do |notice|
    notices = {}
    authors = {}
    titles = {}
    notices["title"] = notice["data"]['title']
    notices["author"] = notice["data"]['author']
    notices["date"] = Time.at(notice["data"]['created'])
    notices["url"] = notice["data"]['url']
    notices["website"] = 'Reddit'
    authors["author"] = notice["data"]['author']
    authors["title"] = notice["data"]['title']
    authors["url"] = notice["data"]['url']
    titles["title"] = notice["data"]['title']
    titles["author"] = notice["data"]['author']
    titles["url"] = notice["data"]['url']
    @notices.push(notices)
    @authors.push(authors)
    @titles.push(titles)
  end

  def self.notices
    @notices
  end

  def self.authors
    @authors
  end  

  def self.titles
    @titles
  end
end
