class store_location
  attr_accessor :local
  attr_accessor :inter

  def initialize(local, inter)
    @local = local
    @inter = inter
  end
end 

class book
  attr_accessor :title
  attr_accessor :price

  def initialize(title, price)

    @title = title
    @price = price
  end

  def getShippingTax()

    return 0
  end

  def getTotalCost()

    return @price + getShippingTax
  end
end

class hardcopy < book
  attr_accessor :location

  def initialize(title, price, location)

    @location = location
    @title = title
    @price = price
  end

  def getShippingTax(location)

    if @localation.local = location.local then
      
      return 0
    end

    if @localation.inter = location.inter then
      
      return price * 0.08
    end

    return 0
  end

end

class ebook < book
  attr_accessor :location

  def initialize(title, price, location)

    @location = location
    @title = title
    @price = price
  end
end