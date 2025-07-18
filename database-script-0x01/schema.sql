CREATE TABLE user_roles (
  role_id INT PRIMARY KEY,
  role_name VARCHAR(50) UNIQUE NOT NULL,
  description TEXT
);

CREATE TABLE payment_methods (
  method_id INT PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  description TEXT
);

CREATE TABLE users (
  user_id UUID PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  email VARCHAR(150) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  phone_number VARCHAR(20),
  role INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (role) REFERENCES user_roles(role_id)
);

CREATE TABLE properties (
  property_id UUID PRIMARY KEY,
  host_id UUID NOT NULL,
  name VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  country VARCHAR(100) NOT NULL,
  state VARCHAR(100) NOT NULL,
  city VARCHAR(100),
  address_line VARCHAR(255),
  latitude DECIMAL(9,6),
  longitude DECIMAL(9,6),
  pricepernight DECIMAL(10,2) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (host_id) REFERENCES users(user_id)
);

CREATE TYPE status AS ENUM ('pending', 'confirmed', 'canceled');

CREATE TABLE bookings (
  booking_id UUID PRIMARY KEY,
  property_id UUID,
  user_id UUID,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  total_price DECIMAL(10,2) NOT NULL,
  status status NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (property_id) REFERENCES properties(property_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE payments (
  payment_id UUID PRIMARY KEY,
  booking_id UUID UNIQUE NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  payment_method INT NOT NULL,
  FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
  FOREIGN KEY (payment_method) REFERENCES payment_methods(method_id)
);

CREATE TABLE reviews (
  review_id UUID PRIMARY KEY,
  property_id UUID NOT NULL,
  user_id UUID UNIQUE NOT NULL,
  rating INTEGER NOT NULL CHECK (rating BETWEEN 1 AND 5),
  comment TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (property_id) REFERENCES properties(property_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE messages (
  message_id UUID PRIMARY KEY,
  sender_id UUID NOT NULL,
  recipient_id UUID NOT NULL,
  message_body TEXT NOT NULL,
  sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (sender_id) REFERENCES users(user_id),
  FOREIGN KEY (recipient_id) REFERENCES users(user_id)
);

CREATE TABLE user_role_assignments (
  assignment_id UUID PRIMARY KEY,
  user_id UUID NOT NULL,
  role_id INT NOT NULL,
  assigned_at TIMESTAMP,
  is_active BOOLEAN,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (role_id) REFERENCES user_roles(role_id)
);

