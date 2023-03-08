puts "cleaning up the database"
Refill.destroy_all
Order.destroy_all
UserMedication.destroy_all
UserAllergy.destroy_all
Allergy.destroy_all
Medication.destroy_all
User.destroy_all

puts "creating users"
user_one = User.create!(first_name: 'Ayat', last_name: 'Amin', email: 'a@a.a', password: '123456')
user_two = User.create(first_name: 'Maggie', last_name: 'Hum', email: 'a@b.a', password: '123456')
user_three = User.create(first_name: 'You', last_name: 'Pan', email: 'a@c.a', password: '123456')

puts "creating allergies"
allergy_types = ['penicillin', 'sulfa', 'codeine', 'lactose', 'ibuprofen', 'latex']

allergy_types.each do |type|
  Allergy.create!(allergy_type: type)
end

puts "creating medications"
medication_one = Medication.create!(name:"Alesse", description:"Birth-Control", strength: '28')
medication_two = Medication.create!(name:"Amoxicillin", description:"Antibiotics", strength: '500')
medication_three = Medication.create!(name:"Cipralex", description:"Anti-depressant", strength: '20 mg')
# medication_four = Medication.create!(name:"Ibuprofen", description:"NSAID", strength: '400 mg')

puts "creating user medications"
user_medication_one = UserMedication.create!(medication: medication_one, user: user_one, number_refills: 3)
user_medication_two = UserMedication.create!(medication: medication_two, user: user_two, number_refills: 3)
user_medication_three = UserMedication.create!(medication: medication_three, user: user_three, number_refills: 3)

puts "creating orders"
order_one = Order.create!(user: user_one)
order_two = Order.create!(user: user_two)
order_three = Order.create!(user: user_three)

puts "creating refills"
refill_one = Refill.create!(status: 'in process', user_medication: user_medication_one, order: order_one)
refill_two = Refill.create!(status: 'in process', user_medication: user_medication_two, order: order_two)
refill_three = Refill.create!(status: 'in process', user_medication: user_medication_three, order: order_three)
