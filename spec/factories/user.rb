FactoryGirl.define do

  factory :user do
    factory :active_user do
      email   'active@me.com'
      token   'o63N9ai72OyHBDzgOl0zQ'
      active  true
    end

    factory :inactive_user do
      email  'inactive@me.com'
      token   'o63N9ai72OyHBDzgOl0zQ'
      active  false
    end

  end

end