FactoryGirl.define do

  factory :user do
    factory :active_user do
      email   'active@me.com'
      token   'o63N9ai72OyHBDzgOl0zQ'
      telephone '123-456-7890'
      active  true
    end

    factory :inactive_user do
      email  'inactive@me.com'
      token   'o63N9ai72OyHBDzgOl0zQ'
      telephone '123-456-7890'
      active  false
    end

  end

end