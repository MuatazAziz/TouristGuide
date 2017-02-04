class TouristGuide::Tour
  attr_accessor :name, :address, :description
  @@all =[]

  def initialize(attr_hash)
    # attr_hash.each do |attribute, v|
    # self.name= attribute(:name)
    # self.address= attribute(:address)
    # self.description= attribute(:description)

    # self.send "name=", "John Smith"
    # equivalent to
    # self.name = "John Smith"

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

#to delete duplicated & previous lists
  def self.clear
   @@all =[]
  end

end
