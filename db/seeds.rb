puts "cleaning up the database"
UserAllergy.destroy_all
# UserMedication.destroy_all
Allergy.destroy_all
Medication.destroy_all
User.destroy_all

# puts "creating users"
# owner_one = User.create!(first_name: 'Ayat', last_name: 'Amin', email: 'a@a.a', password: '123456')
# owner_two = User.create(first_name: 'Maggie', last_name: 'Hum', email: 'a@b.a', password: '1234567')
# owner_three = User.create(first_name: 'You', last_name: 'Pan', email: 'a@c.a', password: '12345678')

puts "creating allergies"
allergy_types = ['penicillin', 'sulfa', 'codeine', 'lactose', 'ibuprofen', 'latex']

allergy_types.each do |type|
  Allergy.create!(allergy_type: type)
end

puts "creating medications"
medications_info = [{name:"Alesse", description:"Birth-Control", strength: '28'},
   {name:"Amoxicillin", description:"Antibiotics", strength: '500'},
   {name:"Cipralex", description:"Anti-depressant", strength: '20 mg'},
   {name:"Ibuprofen", description:"NSAID", strength: '400 mg'}]

medications_info.each do |med|
    Medication.create!(med)
  end
