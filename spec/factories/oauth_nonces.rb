FactoryBot.define do
    factory :nonces1 do
      id 1
      nonce 'a_nonce'
      timestamp 1
      created_at '2007-11-25 17:27:04'
      updated_at '2007-11-25 17:27:04'
    end
    
    factory :nonces2, parent: :nonces1 do
      id 2
      nonce 'b_nonce'
      timestamp 2
    end
  end