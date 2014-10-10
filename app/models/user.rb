class User
  include Mongoid::Document
  field :email,  type: String
  field :active, type: Mongoid::Boolean, default: false
  field :token,  type: String


  class << self

    def active
      where(active: true)
    end

    def inactive
      where(active: false)
    end

  end

  def activate
    self.update_attribute :active, true
  end
end
