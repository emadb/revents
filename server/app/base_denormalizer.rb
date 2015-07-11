module BaseDenormalizer
  @@subscribers = []
  def self.subscribers
    @@subscribers
  end

  def self.included(base)
    subscribers << base
  end
end
