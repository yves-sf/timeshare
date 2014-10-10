class User
  include Mongoid::Document
  field :email, type: String
  field :actif, type: Mongoid::Boolean
  field :token, type: String
end
