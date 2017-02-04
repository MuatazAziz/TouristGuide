class TouristGuide::Tour
  attr_accessor :name, :address, :description
  @@all =[]

  def initialize(attr_hash)
    # self.name=attr_hash(:name)
    attr_hash.each do |attribute, v|
      self.send("#{attribute}=",v)

    end
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create_from_collection(array)
    array.each do |hash|
      self.new(hash)
    end
  end
  def self.clear
   @@all =[]
  end
end
