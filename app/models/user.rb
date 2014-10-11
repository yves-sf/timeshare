class User
  include Mongoid::Document
  field :first_name, type: :string
  field :last_name, type: String
  field :telephone, type: String
  field :email,  type: String
  field :active, type: Mongoid::Boolean, default: false
  field :token,  type: String

  # TODO uniqueness of email validation

  class << self

    def active
      where(active: true)
    end

    def inactive
      where(active: false)
    end

  end

  def active?
    true == active
  end

  def inactive?
    false == active
  end

  def activate
    if inactive?
      self.update_attribute :active, true
    end
  end

end
