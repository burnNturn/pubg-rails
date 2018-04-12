FactoryBot.define do
    factory :token1 do
      id 1
      user_id 2
      client_application_id 1
      token 'one'
      secret 'MyString'
      created_at '2007-11-19 07:31:46'
      updated_at '2007-11-19 07:31:46'
    end
    
    factory :token2, parent: :token1 do
      id 2
      token 'two'
    end
  end