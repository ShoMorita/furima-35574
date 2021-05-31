FactoryBot.define do
  factory :donation_address do
    token                 {"tok_abcdefghijk00000000000000000"}
    postal_code           { "811-1111" }
    prefecture_id         { 2 }
    municipality          { "福岡市南区" }
    address               { "老司1-9-85" }
    building_name         { "ああああハウス" }
    phone_number          { "08039391947" }
  end
end
