FactoryGirl.define do
  factory :reader do
    #reader
    #t.string   "name"
    #t.string   "provider"
    #t.string   "uid"
    name 'Test User'
    provider 'twitter'
    uid 1
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end
