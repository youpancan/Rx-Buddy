puts "cleaning up the database"
Refill.destroy_all
Order.destroy_all
UserMedication.destroy_all
UserAllergy.destroy_all
Allergy.destroy_all
Medication.destroy_all
User.destroy_all

puts "creating allergies"
allergy_types = ['penicillin', 'sulfa', 'codeine', 'lactose', 'ibuprofen',
                 'latex', 'ASA', 'egg', 'abacavir', 'ramipril']

allergy_types.each do |type|
  Allergy.create!(allergy_type: type)
end

# creating medications
puts "creating medications"
alesse = Medication.create!(name: "Alesse", description: "Birth-Control", strength: '28')
amoxicillin = Medication.create!(name: "Amoxicillin", description: "Antibiotics", strength: '500mg')
cipralex = Medication.create!(name: "Cipralex", description: "Anti-depressant", strength: '20 mg')
lexapro = Medication.create!(name: "Lexapro", description: "Anti-Depressant", strength: '20 mg')
adderall = Medication.create!(name: "Adderall", description: "ADHD", strength: '40mg')
omeprazole = Medication.create!(name: "Omeprazole", description: "Acid-Reflux", strength: '10mg')
metformin = Medication.create!(name: "Metformin", description: "Diabetes", strength: '500mg')
cetirizine = Medication.create!(name: "Cetirizine", description: "Allergies", strength: '20mg')
epipen = Medication.create!(name: "EpiPen", description: "Allergies", strength: '0.3mg')
wellbutrin = Medication.create!(name: "Wellbutrin", description: "Anti-depressant", strength: '150mg')
yaz = Medication.create!(name: "Yaz", description: "Birth-Control", strength: '28')


puts "creating users"
user_one = User.create!(first_name: 'Ayat', last_name: 'Amin', email: 'a@a.a', password: '123456', birthdate: Date.new(1995, 10, 9),
                        address: '25 st', pharmacy_location: '63 queen st')
user_two = User.create(first_name: 'Maggie', last_name: 'Hum', email: 'a@b.a', password: '123456', birthdate: Date.new(1998, 9, 6),
                       address: '65 st', pharmacy_location: '63 king st')
user_three = User.create(first_name: 'You', last_name: 'Pan', email: 'a@c.a', password: '123456', birthdate: Date.new(2000, 4, 9),
                         address: '44 st', pharmacy_location: '63 prince st')

puts "creating user medications"
user_alesse = UserMedication.create!(medication: alesse, user: user_two, number_refills: 3,
                                     refill_due_date: Date.new(2023, 3, 14),
                                     prescriber: 'Dr. May', refillable: false)
user_amoxicillin = UserMedication.create!(medication: amoxicillin, user: user_two, number_refills: 3,
                                          refill_due_date: Date.new(2023, 3, 17),
                                          prescriber: 'Dr. May', refillable: false)
user_cipralex = UserMedication.create!(medication: cipralex, user: user_three, number_refills: 3,
                                       refill_due_date: Date.new(2023, 4, 9),
                                       prescriber: 'Dr. May', refillable: false)
puts "creating orders"
order_one = Order.create!(user: user_one)
order_two = Order.create!(user: user_two)
order_three = Order.create!(user: user_three)

puts "creating refills"
refill_one = Refill.create!(urgency: 'medium', status: 'in process', user_medication: user_alesse,
                            order: order_one, notes: 'no comment', pick_up_date: Date.new(2023, 3, 7))
refill_two = Refill.create!(urgency: 'urgent', status: 'received', user_medication: user_amoxicillin,
                            order: order_two, notes: 'no comment', pick_up_date: Date.new(2023, 3, 5))
refill_three = Refill.create!(urgency: 'medium', status: 'ready', user_medication: user_cipralex,
                              order: order_three, notes: 'no comment', pick_up_date: Date.new(2023, 3, 2))

















# ______________________________________________________________________________________________________________________________________
# MAIN USER FOR DEMO SCENARIO -AYATS SEED DONT TOUCH!!!!!!

# create main user
sarah = User.create!(first_name: 'Sarah', last_name: 'Johnson', email: 's@s.s', password: '123456',
                     birthdate: Date.new(1996, 10, 9),
                     address: '5333 Casgrain, Montreal', pharmacy_location: '63 queen st, Montreal')

# creating user medications
sarah_lexapro = UserMedication.create!(medication: lexapro, user: sarah, number_refills: 4,
                                       refill_due_date: Date.new(2023, 4, 9),
                                       prescriber: 'Dr. Smith', refillable: true)
sarah_adderall = UserMedication.create!(medication: adderall, user: sarah, number_refills: 1,
                                        refill_due_date: Date.new(2023, 4, 5),
                                        prescriber: 'Dr. Patel', refillable: true)
sarah_omeprazole = UserMedication.create!(medication: omeprazole, user: sarah, number_refills: 2,
                                          refill_due_date: Date.new(2023, 4, 1),
                                          prescriber: 'Dr. Patel', refillable: true)
sarah_metformin = UserMedication.create!(medication: metformin, user: sarah, number_refills: 3,
                                         refill_due_date: Date.new(2023, 3, 17),
                                         prescriber: 'Dr. Hani', refillable: true)
sarah_cetirizine = UserMedication.create!(medication: cetirizine, user: sarah, number_refills: 0,
                                          refill_due_date: Date.new(2023, 3, 17),
                                          prescriber: 'Dr. Hani', refillable: false)
sarah_epipen = UserMedication.create!(medication: epipen, user: sarah, number_refills: 0,
                                      refill_due_date: Date.new(2023, 3, 17),
                                      prescriber: 'Dr. Hani', refillable: false)
sarah_wellbutrin = UserMedication.create!(medication: wellbutrin, user: sarah, number_refills: 0,
                                          refill_due_date: Date.new(2023, 3, 20),
                                          prescriber: 'Dr. Hani', refillable: false)
sarah_yaz = UserMedication.create!(medication: yaz, user: sarah, number_refills: 0,
                                   refill_due_date: Date.new(2023, 3, 20),
                                   prescriber: 'Dr. Smith', refillable: false)

# creating orders
sarah_order_one = Order.create!(user: sarah)
sarah_order_two = Order.create!(user: sarah)
sarah_order_three = Order.create!(user: sarah)
sarah_order_four = Order.create!(user: sarah)
# creating refills for order 1
sarah_refill_one = Refill.create!(urgency: 'medium', status: 'complete', user_medication: sarah_yaz,
                                  order: sarah_order_one, notes: 'no comment', pick_up_date: Date.new(2023, 3, 5))
sarah_refill_two = Refill.create!(urgency: 'medium', status: 'complete', user_medication: sarah_wellbutrin,
                                  order: sarah_order_one, notes: 'no comment', pick_up_date: Date.new(2023, 3, 5))
sarah_refill_three = Refill.create!(urgency: 'medium', status: 'complete', user_medication: sarah_epipen,
                                    order: sarah_order_one, notes: 'no comment', pick_up_date: Date.new(2023, 3, 5))

# creating refills for order 2
sarah_refill_four = Refill.create!(urgency: 'medium', status: 'complete', user_medication: sarah_yaz,
                                   order: sarah_order_two, notes: 'no comment', pick_up_date: Date.new(2023, 2, 5))
sarah_refill_five = Refill.create!(urgency: 'medium', status: 'complete', user_medication: sarah_wellbutrin,
                                   order: sarah_order_two, notes: 'no comment', pick_up_date: Date.new(2023, 2, 5))

# creating refills for order 3
sarah_refill_six = Refill.create!(urgency: 'medium', status: 'complete', user_medication: sarah_yaz,
                                  order: sarah_order_three, notes: 'no comment', pick_up_date: Date.new(2023, 1, 5))
sarah_refill_eight = Refill.create!(urgency: 'medium', status: 'complete', user_medication: sarah_wellbutrin,
                                    order: sarah_order_three, notes: 'no comment', pick_up_date: Date.new(2023, 1, 5))
sarah_refill_nine = Refill.create!(urgency: 'medium', status: 'complete', user_medication: sarah_cetirizine,
                                   order: sarah_order_three, notes: 'no comment', pick_up_date: Date.new(2023, 1, 5))

# creating refills for order 3
sarah_refill_ten = Refill.create!(urgency: 'medium', status: 'complete', user_medication: sarah_lexapro,
                                  order: sarah_order_four, notes: 'no comment', pick_up_date: Date.new(2023, 3, 8))
sarah_refill_eleven = Refill.create!(urgency: 'medium', status: 'complete', user_medication: sarah_adderall,
                                     order: sarah_order_four, notes: 'no comment', pick_up_date: Date.new(2023, 3, 5))
sarah_refill_twelve = Refill.create!(urgency: 'medium', status: 'complete', user_medication: sarah_omeprazole,
                                     order: sarah_order_four, notes: 'no comment', pick_up_date: Date.new(2023, 3, 5))
sarah_refill_thirteen = Refill.create!(urgency: 'medium', status: 'complete', user_medication: sarah_metformin,
                                       order: sarah_order_four, notes: 'no comment', pick_up_date: Date.new(2023, 3, 5))


# END OF MAIN USER FOR DEMO SCENARIO


# last refill (using current date - pick up date), due date for refill, remining refills, pharamacy location
# enums for refill status
