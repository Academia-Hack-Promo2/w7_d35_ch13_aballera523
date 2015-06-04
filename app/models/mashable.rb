require 'httparty'

class Mashable
  include HTTParty
  @@notices = []  
  @@authors = []
  @@titles = []
  mashable = HTTParty.get('http://mashable.com/stories.json')
  mashable["new"].each do |notice|
    notices = {}
    authors = {}
    titles = {}
    notices["title"] = notice['title']
    notices["author"] = notice['author']
    notices["date"] = notice['post_date']
    notices["url"] = notice['link']
    notices["website"] = 'Mashable'
    authors["author"] = notice['author']
    titles["title"] = notice['title']
    @@notices.push(notices)
    @@authors.push(authors)
    @@titles.push(titles)
    end
    
  def self.notices
    @@notices
  end

  def self.titles
    @@titles
  end

  def self.authors
    @@authors
  end
end