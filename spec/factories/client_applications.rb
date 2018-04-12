FactoryBot.define do
    factory :client_app1 do
      id 1
      name 'MyString'
      url 'http://test.com'
      support_url 'http://test.com/support'
      callback_url 'http://test.com/callback'
      key 'one_key'
      secret 'MyString'
      user_iD 1
      created_at '2007-11-17 16:56:51'
      updated_at '2007-11-17 16:56:51'
    end
    
    factory :client_app2, parent: :client_app1 do
      id 1
      key 'two_key'
    end
  end