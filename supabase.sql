-- Sample facts for the Ground Up Cafe demo. Edit them to fit your own cafe.

create table if not exists public.cafe_facts (
  id serial primary key,
  topic text,
  info text
);

INSERT INTO public.cafe_facts (id, topic, info) VALUES
(1, 'about', 'Ground Up Cafe is a pure vegetarian cafe with 5 outlets in Pune: Kothrud (flagship), Baner, Viman Nagar, Koregaon Park and Aundh. We serve chai, coffee, snacks and desserts in a cosy, book-friendly setting.'),
(2, 'timings', 'Open every day from 8 AM to 11 PM at all outlets.'),
(3, 'hot_drinks', 'Masala Chai Rs 80, Ginger Chai Rs 90, Filter Coffee Rs 120, Cappuccino Rs 160, Hot Chocolate Rs 180.'),
(4, 'cold_drinks', 'Cold Brew Rs 180, Iced Latte Rs 200, Iced Tea Rs 150, Mango Cooler Rs 140, Cold Coffee Rs 170.'),
(5, 'food', 'Paneer Sandwich Rs 190, Veg Burger Rs 210, Pasta in White Sauce Rs 260, Veg Club Sandwich Rs 230, French Fries Rs 140, Garden Salad Rs 200.'),
(6, 'desserts', 'Chocolate Brownie Rs 150, Cheesecake Slice Rs 220, Tiramisu Jar Rs 240.'),
(7, 'jain_vegan', 'Jain options are available on request, please inform us 2 hours before. A few vegan options are available, including soy milk for coffee at Rs 30 extra.'),
(8, 'table_booking', 'Tables can be booked for 2 to 20 guests. To book we need name, phone number, number of guests, date and time. Walk-ins are welcome, but bookings are recommended on weekends.'),
(9, 'birthday', 'Birthday and party tables are available for up to 20 guests with 1 day advance notice. You may bring your own cake. A small decoration can be arranged for Rs 500.'),
(10, 'workshops', 'We host small workshops in our Kothrud and Baner outlets, such as coffee brewing, latte art, book clubs and open mic evenings. Groups of 10 to 25 people. Private workshops can be booked with 7 days notice. Pricing depends on the workshop type and group size, so our events team will confirm it.'),
(11, 'events_booking', 'For a workshop or private event we need the type of event, number of guests, preferred date and time, and a contact number. Our events team confirms within 24 hours.'),
(12, 'bulk_orders', 'Cold brew bottles (250 ml) are Rs 180 each. Orders of 10 or more bottles get 10 percent off. 1 day notice needed. Invoices are available for office orders.'),
(13, 'payments', 'We accept UPI, debit and credit cards and cash.'),
(14, 'wifi', 'Free Wi-Fi is available at all outlets.'),
(15, 'contact', 'For anything we cannot answer here, our team will call you back. Please share your name and phone number.');

-- Keep the id counter in step with the rows inserted above.
select setval(pg_get_serial_sequence('public.cafe_facts', 'id'), (select max(id) from public.cafe_facts));
