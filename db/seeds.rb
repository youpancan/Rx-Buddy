Allergy.destroy_all
Medication.destroy_all

puts "creating allergies"
allergy_types = ['penicillin', 'sulfa', 'codeine', 'lactose', 'ibuprofen', 'latex']

allergy_types.each do |type|
  Allergy.create!(allergy_type: type)
end
