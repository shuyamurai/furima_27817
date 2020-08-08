FactoryBot.define do
  factory :user do
    nickname              { 'testnick' }
    email                 { 'kkk@gmail.com' }
    password              { 's11111' }
    password_confirmation { 's11111' }
    first_name            { '太郎' }
    family_name           { '山田' }
    first_name_kana       { 'タロウ' }
    family_name_kana      { 'ヤマダ' }
    birthday              { '20000401' }
  end
end
