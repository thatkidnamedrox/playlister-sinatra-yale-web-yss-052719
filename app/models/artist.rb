class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    #strip the string
    ret = self.name.strip

    #blow away apostrophes
    ret.gsub! /['`]/,""

    # @ --> at, and & --> and
    ret.gsub! /\s*@\s*/, " at "
    ret.gsub! /\s*&\s*/, " and "

    #replace all non alphanumeric, underscore or periods with underscore
     ret.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '-'

     #convert double underscores to single
     ret.gsub! /-+/,"-"

     #strip off leading/trailing underscore
     ret.gsub! /\A[-\.]+|[-\.]+\z/,""

     ret
  end

  def self.find_by_slug(slug)
    self.all.each do |e|
      if e.slug == slug
        return e
      end
    end
    return
  end

end
