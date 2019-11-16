require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    student_array = []
    web_data = Nokogiri::HTML(open("#{index_url}"))
    web_data.css(".student-card").each do |student|
      name = student.css(".student-name").text
      location = student.css(".student-location").text
      profile_url = student.css("a").attribute("href").value
      student_array << {:name => name, :location => location, :profile_url => profile_url}
      #binding.pry
    end
    student_array
    #name = web_data.css(".student-name")[0].text
    #location = web_data.css(".student-location")[0].text
    #profile_url = web_data.css(".student-card")[0].css("a")[0].values

  end

  def self.scrape_profile_page(profile_url)
    profile_hash = {}
    twitter, linkedin, github, blog = nil
    web_data = Nokogiri::HTML(open(profile_url))

    #need to redo based on name search...

    web_data.css(".social-icon-container a").each do |item|

      link = item.attributes["href"].value
      if link.include?("twitter")
        twitter = link
      elsif link.include?("linkedin")
        linkedin = link
      elsif link.include?("github")
        github = link
      else
        blog = link
      end
        binding.pry

    end


    #twitter = web_data.css(".social-icon-container a")[0].attribute("href").value if web_data.css(".social-icon-container a")[0]
    #linkedin = web_data.css(".social-icon-container a")[1].attribute("href").value if web_data.css(".social-icon-container a")[1]
    #github = web_data.css(".social-icon-container a")[2].attribute("href").value if web_data.css(".social-icon-container a")[2]
    #blog = web_data.css(".social-icon-container a")[3].attribute("href").value if web_data.css(".social-icon-container a")[3]
    #profile_quote = web_data.css(".profile-quote").text
    #bio = web_data.css(".description-holder p").text

    #profile_hash = {:twitter => twitter,
    #                :linkedin => linkedin,
    #                :github => github,
    #                :blog => blog,
    #                :profile_quote => profile_quote,
  #                  :bio => bio}
  #  profile_hash.keep_if {|key, value| value}

      #binding.pry
  end

end
