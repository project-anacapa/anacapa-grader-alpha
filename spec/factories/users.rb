FactoryGirl.define do

  factory :user do
  	name 'Test Name'
    email 'test@example.com'
    id '12345'
    factory :admin do
      after(:create) { |user| user.add_role :admin }
    end
  end

  # factory :user do
  #   name 'Test2'
  #   email 'test2@example.com'
  #   id '22222'
  # end

end