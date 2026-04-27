DROP TABLE IF EXISTS coffee_category, coffee, country, category;
 ;

-- Table des country
CREATE TABLE IF NOT EXISTS "country" (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL UNIQUE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ
);


-- Table des cafés
CREATE TABLE IF NOT EXISTS "coffee" (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL UNIQUE,
  description TEXT,
  price_kg DECIMAL(10,2) NOT NULL,
  reference CHAR(9) NOT NULL UNIQUE,
  available BOOLEAN DEFAULT TRUE,
  country_id INT NOT NULL REFERENCES country(id),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ
);


-- Table des caractéristiques
CREATE TABLE IF NOT EXISTS "category" (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  label TEXT NOT NULL UNIQUE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ
);

-- Table de liaison Café Caractéristique
CREATE TABLE IF NOT EXISTS "coffee_category" (
  coffee_id INT NOT NULL REFERENCES "coffee"("id"),
  category_id INT NOT NULL REFERENCES "category"("id"),
  PRIMARY KEY (coffee_id, category_id),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ
);

-- insertion des countrys
INSERT INTO country (name)
VALUES
('Italie'),
('Colombie'),
('Éthiopie'),
('Brésil'),
('Guatemala'),
('Kenya'),
('Indonésie'),
('Costa Rica'),
('Vietnam'),
('Tanzanie'),
('Jamaïque'),
('Rwanda'),
('Panama'),
('Pérou'),
('Hawaï'),
('Nicaragua');


--insertion des caractéristiques
INSERT INTO category (label)
VALUES 
('Corsé'),
('Épicé'),
('Acide'),
('Doux'),
('Fruité'),
('Chocolaté');


-- insertion des cafés
INSERT INTO coffee (name,description,price_kg,reference,available,country_id) 
VALUES 
('Espresso',
 'Café fort et concentré préparé en faisant passer de l''eau chaude à travers du café finement moulu.',
 20.99,
 '100955890',
 true,
 (SELECT id FROM country WHERE name = 'Italie')
),

('Columbian',
 'Café moyennement corsé avec une acidité vive et une saveur riche.',
 18.75,
 '100955894',
 true,
 (SELECT id FROM country WHERE name = 'Colombie')
),

('Ethiopian Yirgacheffe',
 'Réputé pour son arôme floral, son acidité vive et ses notes de saveur citronnée.',
 22.50,
 '105589090',
 true,
 (SELECT id FROM country WHERE name = 'Éthiopie')
),

('Brazilian Santos',
 'Café doux et lisse avec un profil de saveur de noisette.',
 17.80,
 '134009550',
 true,
 (SELECT id FROM country WHERE name = 'Brésil')
),

('Guatemalan Antigua',
 'Café corsé avec des nuances chocolatées et une pointe d''épice.',
 21.25,
 '256505890',
 true,
 (SELECT id FROM country WHERE name = 'Guatemala')
),

('Kenyan AA',
 'Café complexe connu pour son acidité rappelant le vin et ses saveurs fruitées.',
 23.70,
 '295432730',
 true,
 (SELECT id FROM country WHERE name = 'Kenya')
),

('Sumatra Mandheling',
 'Café profond et terreux avec un corps lourd et une faible acidité.',
 19.95,
 '302932754',
 true,
 (SELECT id FROM country WHERE name = 'Indonésie')
),

('Costa Rican Tarrazu',
 'Café vif et net avec une finition propre et une acidité vive.',
 24.50,
 '327302954',
 true,
 (SELECT id FROM country WHERE name = 'Costa Rica')
),

('Vietnamese Robusta',
 'Café audacieux et fort avec une saveur robuste distinctive.',
 16.75,
 '549549090',
 true,
 (SELECT id FROM country WHERE name = 'Vietnam')
),

('Tanzanian Peaberry',
 'Acidité vive avec un profil de saveur rappelant le vin et un corps moyen.',
 26.80,
 '582954954',
 true,
 (SELECT id FROM country WHERE name = 'Tanzanie')
),

('Jamaican Blue Mountain',
 'Reconnu pour sa saveur douce, son acidité vive et son absence d''amertume.',
 39.25,
 '589100954',
 true,
 (SELECT id FROM country WHERE name = 'Jamaïque')
),

('Rwandan Bourbon',
 'Café avec des notes florales prononcées, une acidité vive et un corps moyen.',
 21.90,
 '650753915',
 true,
 (SELECT id FROM country WHERE name = 'Rwanda')
),

('Panamanian Geisha',
 'Café rare aux arômes floraux complexes, une acidité brillante et un profil de saveur distinctif.',
 42.00,
 '795501340',
 true,
 (SELECT id FROM country WHERE name = 'Panama')
),

('Peruvian Arabica',
 'Café équilibré avec des notes de chocolat, une acidité modérée et un corps velouté.',
 19.40,
 '954589100',
 false,
 (SELECT id FROM country WHERE name = 'Pérou')
),

('Hawaiian Kona',
 'Café rare au goût riche, une acidité douce et des nuances subtiles.',
 55.75,
 '958090105',
 false,
 (SELECT id FROM country WHERE name = 'Hawaï')
),

('Nicaraguan Maragogipe',
 'Café avec des notes de fruits, une acidité vive et un corps plein.',
 28.60,
 '691550753',
 false,
 (SELECT id FROM country WHERE name = 'Nicaragua')
);

-- 4. Liens café <-> catégories
INSERT INTO coffee_category (coffee_id, category_id) VALUES
((SELECT id FROM coffee WHERE name = 'Espresso'), (SELECT id FROM category WHERE label = 'Corsé')),
((SELECT id FROM coffee WHERE name = 'Espresso'), (SELECT id FROM category WHERE label = 'Épicé')),

((SELECT id FROM coffee WHERE name = 'Columbian'), (SELECT id FROM category WHERE label = 'Acide')),

((SELECT id FROM coffee WHERE name = 'Ethiopian Yirgacheffe'), (SELECT id FROM category WHERE label = 'Doux')),
((SELECT id FROM coffee WHERE name = 'Ethiopian Yirgacheffe'), (SELECT id FROM category WHERE label = 'Fruité')),

((SELECT id FROM coffee WHERE name = 'Brazilian Santos'), (SELECT id FROM category WHERE label = 'Doux')),

((SELECT id FROM coffee WHERE name = 'Guatemalan Antigua'), (SELECT id FROM category WHERE label = 'Corsé')),

((SELECT id FROM coffee WHERE name = 'Kenyan AA'), (SELECT id FROM category WHERE label = 'Doux')),
((SELECT id FROM coffee WHERE name = 'Kenyan AA'), (SELECT id FROM category WHERE label = 'Acide')),

((SELECT id FROM coffee WHERE name = 'Sumatra Mandheling'), (SELECT id FROM category WHERE label = 'Corsé')),

((SELECT id FROM coffee WHERE name = 'Costa Rican Tarrazu'), (SELECT id FROM category WHERE label = 'Acide')),

((SELECT id FROM coffee WHERE name = 'Vietnamese Robusta'), (SELECT id FROM category WHERE label = 'Épicé')),

((SELECT id FROM coffee WHERE name = 'Tanzanian Peaberry'), (SELECT id FROM category WHERE label = 'Fruité')),
((SELECT id FROM coffee WHERE name = 'Tanzanian Peaberry'), (SELECT id FROM category WHERE label = 'Corsé')),

((SELECT id FROM coffee WHERE name = 'Jamaican Blue Mountain'), (SELECT id FROM category WHERE label = 'Doux')),

((SELECT id FROM coffee WHERE name = 'Rwandan Bourbon'), (SELECT id FROM category WHERE label = 'Fruité')),

((SELECT id FROM coffee WHERE name = 'Panamanian Geisha'), (SELECT id FROM category WHERE label = 'Fruité')),

((SELECT id FROM coffee WHERE name = 'Peruvian Arabica'), (SELECT id FROM category WHERE label = 'Corsé')),
((SELECT id FROM coffee WHERE name = 'Peruvian Arabica'), (SELECT id FROM category WHERE label = 'Chocolaté')),

((SELECT id FROM coffee WHERE name = 'Hawaiian Kona'), (SELECT id FROM category WHERE label = 'Doux')),

((SELECT id FROM coffee WHERE name = 'Nicaraguan Maragogipe'), (SELECT id FROM category WHERE label = 'Corsé')),
((SELECT id FROM coffee WHERE name = 'Nicaraguan Maragogipe'), (SELECT id FROM category WHERE label = 'Fruité'));
