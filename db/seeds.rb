puts "cleaning up the database"
Notification.destroy_all
Message.destroy_all
Chatbot.destroy_all
Refill.destroy_all
Order.destroy_all
UserMedication.destroy_all
UserAllergy.destroy_all
Allergy.destroy_all
Medication.destroy_all
User.destroy_all

puts "creating users"
user_one = User.create!(first_name: 'Ayat', last_name: 'Amin', email: 'a@a.a', password: '123456', birthdate: Date.new(1995, 10, 9),
                        address: '4007 rue Saint-Denis, Montreal', pharmacy_location: '4084 Blvd Saint-Laurent, Montreal')
user_two = User.create(first_name: 'Maggie', last_name: 'Hum', email: 'a@b.a', password: '123456', birthdate: Date.new(1998, 9, 6),
                       address: '65 st', pharmacy_location: '4084 Blvd Saint-Laurent, Montreal')
user_three = User.create(first_name: 'You', last_name: 'Pan', email: 'a@c.a', password: '123456', birthdate: Date.new(2000, 4, 9),
                         address: '44 st', pharmacy_location: '4084 Blvd Saint-Laurent, Montreal')

puts "creating allergies"
allergy_types = ['Penicillin', 'Sulfa', 'Codeine', 'Lactose', 'Ibuprofen',
                 'Latex', 'ASA', 'Egg', 'Abacavir', 'Ramipril', 'Magnesium-Stearate']

allergy_types.each do |type|
  Allergy.create!(allergy_type: type)
end

# creating medications
puts "creating medications"
alesse = Medication.create!(name: "Alesse", description: "Birth-Control", strength: '28',
                            ingredients: 'Levonorgestrel, Ethinylestradiol, Microcrystalline Cellulose')
amoxicillin = Medication.create!(name: "Amoxicillin", description: "Antibiotics", strength: '500mg',
                                 ingredients: 'Amoxicillin, Gelatin, Sodium Lauryl Sulfate, Titanium Dioxide')
celexa = Medication.create!(name: "Celexa", description: "Anti-depressant", strength: '20 mg',
                            ingredients: 'Citalopram, Copolyvidone, Crosscarmellose Sodium, Glycerin')
lexapro = Medication.create!(name: "Lexapro", description: "Anti-Depressant", strength: '20 mg',
                             ingredients: 'Escitalopram, Microcrystalline Cellulose, Magnesium-Stearate')
adderall = Medication.create!(name: "Adderall", description: "ADHD", strength: '40mg',
                              ingredients: 'Dextroamphetamine Saccharate, Amphetamine Aspartate')
omeprazole = Medication.create!(name: "Omeprazole", description: "Acid-Reflux", strength: '10mg',
                                ingredients: 'Omeprazole, Lactose, Cellulose, Disodium Hydrogen Phosphate, Hydroxypropyl
                                Cellulose, Hypromellose')
metformin = Medication.create!(name: "Metformin", description: "Diabetes", strength: '500mg',
                               ingredients: 'Metformin, Candellila Wax, Wellulose Acetate, Hypromellose, Magnesium')
cetirizine = Medication.create!(name: "Cetirizine", description: "Allergies", strength: '20mg',
                                ingredients: 'Ceterizine, Lactose, Microcrystalline Cellulose, Maize Starch')
epipen = Medication.create!(name: "EpiPen", description: "Allergies", strength: '0.3mg',
                            ingredients: 'Epinephrine,  Sodium Chloride, Hydrochloric Acid, Water')
wellbutrin = Medication.create!(name: "Wellbutrin", description: "Anti-depressant", strength: '150mg',
                                ingredients: 'Bupropion Hydrochloride, Glyceryl Behenate, Methacrylic Acid Copolymer')
yaz = Medication.create!(name: "Yaz", description: "Birth-Control", strength: '28',
                         ingredients: 'Ethinylestradiol, Lactose Monohydrate, Magnesium Stearate')

puts "creating user medications"
user_alesse = UserMedication.create!(medication: alesse, user: user_two, number_refills: 3,
                                     refill_due_date: Date.new(2023, 3, 14),
                                     prescriber: 'Dr. May', refillable: false)
user_amoxicillin = UserMedication.create!(medication: amoxicillin, user: user_two, number_refills: 3,
                                          refill_due_date: Date.new(2023, 3, 17),
                                          prescriber: 'Dr. May', refillable: false)
user_celexa = UserMedication.create!(medication: celexa, user: user_three, number_refills: 3,
                                       refill_due_date: Date.new(2023, 4, 9),
                                       prescriber: 'Dr. May', refillable: false)
puts "creating orders"
order_one = Order.create!(user: user_one, order_date: Date.new(2023, 2, 7))
order_two = Order.create!(user: user_two, order_date: Date.new(2023, 1, 10))
order_three = Order.create!(user: user_three, order_date: Date.new(2022, 12, 5))

puts "creating refills"
Refill.create!(urgency: 1, status: 1, user_medication: user_alesse,
                           order: order_one, notes: 'no comment', pick_up_date: Date.new(2023, 3, 7))
Refill.create!(urgency: 2, status: 2, user_medication: user_amoxicillin,
                           order: order_two, notes: 'no comment', pick_up_date: Date.new(2023, 3, 5))
Refill.create!(urgency: 1, status: 2, user_medication: user_celexa,
                           order: order_three, notes: 'no comment', pick_up_date: Date.new(2023, 3, 2))

Chatbot.create!(user: user_one)
















# ______________________________________________________________________________________________________________________________________
# MAIN USER FOR DEMO SCENARIO -AYATS SEED DONT TOUCH!!!!!!

# create main user
sarah = User.create!(first_name: 'Sarah', last_name: 'Johnson', email: 'sarah.Johnson@gmail.com', password: '123456',
                     birthdate: Date.new(1996, 10, 9),
                     address: '5333 Casgrain, Montreal', phone_number: '613-444-5555', pharmacy_location: '63 queen st, Montreal')

# creating user medications
sarah_lexapro = UserMedication.create!(medication: lexapro, user: sarah, number_refills: 4,
                                       refill_due_date: Date.new(2023, 4, 9),
                                       prescriber: 'Dr. Smith', refillable: true)
sarah_adderall = UserMedication.create!(medication: adderall, user: sarah, number_refills: 1,
                                        refill_due_date: Date.new(2023, 3, 10),
                                        prescriber: 'Dr. Patel', refillable: true)
sarah_omeprazole = UserMedication.create!(medication: omeprazole, user: sarah, number_refills: 2,
                                          refill_due_date: Date.new(2023, 3, 11),
                                          prescriber: 'Dr. Patel', refillable: true)
sarah_metformin = UserMedication.create!(medication: metformin, user: sarah, number_refills: 3,
                                         refill_due_date: Date.new(2023, 3, 22),
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
sarah_order_three = Order.create!(user: sarah, order_date: Date.new(2022, 11, 9))

sarah_order_two = Order.create!(user: sarah, order_date: Date.new(2022, 12, 4))

sarah_order_one = Order.create!(user: sarah, order_date: Date.new(2023, 1, 7))

sarah_order_done = Order.create!(user: sarah, order_date: Date.new(2023, 2, 10))

sarah_order_four = Order.create!(user: sarah, order_date: Date.new(2023, 3, 6)) # the order that will show for the steps

# creating rfills for done order
Refill.create!(urgency: 2, status: 0, user_medication: sarah_omeprazole,
                                       order: sarah_order_done, notes: 'no comment', pick_up_date: Date.new(2023, 3, 5))
Refill.create!(urgency: 1, status: 0, user_medication: sarah_metformin,
                                      order: sarah_order_done, notes: 'no comment', pick_up_date: Date.new(2023, 3, 5))
Refill.create!(urgency: 1, status: 0, user_medication: sarah_adderall,
                                      order: sarah_order_done, notes: 'no comment', pick_up_date: Date.new(2023, 3, 5))
# creating refills for order 1
Refill.create!(urgency: 1, status: 1, user_medication: sarah_yaz,
                                  order: sarah_order_one, notes: 'no comment', pick_up_date: Date.new(2023, 3, 5))
Refill.create!(urgency: 1, status: 1, user_medication: sarah_wellbutrin,
                                  order: sarah_order_one, notes: 'no comment', pick_up_date: Date.new(2023, 3, 5))
Refill.create!(urgency: 1, status: 1, user_medication: sarah_epipen,
                                    order: sarah_order_one, notes: 'no comment', pick_up_date: Date.new(2023, 3, 5))

# creating refills for order 2
Refill.create!(urgency: 1, status: 1, user_medication: sarah_yaz,
                                   order: sarah_order_two, notes: 'no comment', pick_up_date: Date.new(2023, 2, 5))
Refill.create!(urgency: 1, status: 2, user_medication: sarah_wellbutrin,
                                   order: sarah_order_two, notes: 'no comment', pick_up_date: Date.new(2023, 2, 5))

# creating refills for order 3
Refill.create!(urgency: 1, status: 3, user_medication: sarah_yaz,
                                  order: sarah_order_three, notes: 'no comment', pick_up_date: Date.new(2023, 1, 5))
Refill.create!(urgency: 1, status: 2, user_medication: sarah_wellbutrin,
                                    order: sarah_order_three, notes: 'no comment', pick_up_date: Date.new(2023, 1, 5))
Refill.create!(urgency: 1, status: 2, user_medication: sarah_cetirizine,
                                   order: sarah_order_three, notes: 'no comment', pick_up_date: Date.new(2023, 1, 5))

# creating refills for order 3
Refill.create!(urgency: 2, status: 4, user_medication: sarah_lexapro,
                                  order: sarah_order_four, notes: 'no comment', pick_up_date: Date.new(2023, 5, 6))
Refill.create!(urgency: 1, status: 4, user_medication: sarah_adderall,
                                     order: sarah_order_four, notes: 'no comment', pick_up_date: Date.new(2025, 5, 5))
Refill.create!(urgency: 1, status: 4, user_medication: sarah_omeprazole,
                                     order: sarah_order_four, notes: 'no comment', pick_up_date: Date.new(2023, 5, 5))
Refill.create!(urgency: 0, status: 4, user_medication: sarah_metformin,
                                       order: sarah_order_four, notes: 'no comment', pick_up_date: Date.new(2023, 5, 5))

Chatbot.create!(user: sarah)

# END OF MAIN USER FOR DEMO SCENARIO
# enums for refill status
