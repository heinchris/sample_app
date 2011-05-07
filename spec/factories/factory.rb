Factory.define :booze do |b|
  b.name "DemoBooze"
  b.rating 5
end

Factory.define :user do |u|
  u.email "test@test.com"
  u.password "password"
  u.password_confirmation  "password"
end