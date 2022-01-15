-- DB_recipe_book_table_creation
-- DB Name: DB_recipe_book
-- 1:n --
-- Kathegorie --
DROP TABLE IF EXISTS category;
CREATE TABLE category (categoryId INT PRIMARY KEY,
                        categoryName CHAR(32),
                        categoryDescription TEXT);
INSERT INTO category VALUES (1, 'Hauptgerichte', 'Geeignet um satt zu werden.'),
                            (2, 'Dessert', 'Passt immernoch rein'),
                            (3, 'Salate', 'Für Zwischendurch und als Beilage'),
                            (4, 'Kuchen und Torten', 'Für Geburtstage und zum Kaffee'),
                            (5, 'Getränke', 'Zum Durstlöschen mit Geschmack'),
                            (6, 'Weihnachtsgebäck', 'Kann man immer essen');
-- Quelle --
DROP TABLE IF EXISTS fount;
CREATE TABLE fount (fountId INT PRIMARY KEY,
                    fountName CHAR(32),
                    fountAuthor CHAR(32),
                    fountLink CHAR(128));
INSERT INTO fount VALUES (1, 'Chefkoch', NULL, 'www.chefkoch.de'),
                         (2, 'YouTube', NULL, 'www.youtube.com');
-- Zeitkategorie --
DROP TABLE IF EXISTS timeCategory;
CREATE TABLE timeCategory (timeCategoryId INT PRIMARY KEY,
                           upperLimit INT,
                           timeCatName CHAR(16));
INSERT INTO timeCategory VALUES (1, 15, 'schnell'),
                                 (2, 30, 'mittel'),
                                 (3, 60, 'aufwändig'),
                                 (4, NULL, 'sehr aufwändig');
-- Kostenkategorie --
DROP TABLE IF EXISTS costCategory;
CREATE TABLE costCategory(costCategoryId INT PRIMARY KEY,
                   upperLimit INT,
                   costCatName CHAR(10));
INSERT INTO costCategory (costCategoryId, upperLimit, costCatName) VALUES (1, 5, 'günstig'),
                                 (2, 15, 'mittel'),
                                 (3, 25, 'teuer'),
                                 (4, NULL, 'Wucher!');
-- Schwierigkeitsgrad --
DROP TABLE IF EXISTS difficultyLevel;
CREATE TABLE difficultyLevel(difficultyLevelId INT PRIMARY KEY,
                             levelName CHAR(16));
INSERT INTO difficultyLevel VALUES  (1, 'einfach'),
                                    (2, 'mittel'),
                                    (3, 'schwer'),
                                    (4, 'Profi');
-- Allergen --
DROP TABLE IF EXISTS allergen;
CREATE TABLE allergen(allergenId INT PRIMARY KEY,
                      allergenName CHAR(32),
                      allergenDescription TEXT);
DELIMITER $$
INSERT INTO allergen VALUES 
(1, 'Glutenhaltiges Getreide', ', namentlich Weizen (wie Dinkel und Khorasan-Weizen), Roggen, Gerste, Hafer oder Hybridstämme davon, sowie daraus hergestellte Erzeugnisse, ausgenommen <br/>a) Glukosesirupe auf Weizenbasis einschließlich Dextrose; <br/>b) Maltodextrine auf Weizenbasis; <br/>c) Glukosesirupe auf Gerstenbasis; <br/>d) Getreide zur Herstellung von alkoholischen Destillaten einschließlich Ethylalkohol landwirtschaftlichen Ursprungs;'),
(2,'Krebstiere','und daraus gewonnene Erzeugnisse;'),
(3,'Eier', 'und daraus gewonnene Erzeugnisse;'),
(4,'Fische','und daraus gewonnene Erzeugnisse, außer <br/>a) Fischgelatine, die als Trägerstoff für Vitamin- oder Karotinoidzubereitungen verwendet wird; <br/>b) Fischgelatine oder Hausenblase, die als Klärhilfsmittel in Bier und Wein verwendet wird;'),
(5, 'Erdnüsse','und daraus gewonnene Erzeugnisse;'),
(6, 'Sojabohnen','und daraus gewonnene Erzeugnisse, außer <br/>a) vollständig raffiniertes Sojabohnenöl und -fett; <br/>b) natürliche gemischte Tocopherole (E306), natürliches D-alpha-Tocopherol, natürliches Dalpha-Tocopherolacetat, natürliches D-alpha-Tocopherolsukzinat aus Sojabohnenquellen; <br/>c) aus pflanzlichen Ölen gewonnene Phytosterine und Phytosterinester aus Sojabohnenquellen; <br/>d) aus Pflanzenölsterinen gewonnene Phytostanolester aus Sojabohnenquellen; '),
(7,'Milch','und daraus gewonnene Erzeugnisse (einschließlich Laktose), außer <br/>a) Molke zur Herstellung von alkoholischen Destillaten einschließlich Ethylalkohol
landwirtschaftlichen Ursprungs; <br/>b) Lactit;'),
(8,'Schalenfrüchte',', namentlich Mandeln (Amygdalus communis L.), Haselnüsse (Corylus avellana), Walnüsse (Juglans regia), Kaschunüsse (Anacardium occidentale), Pecannüsse (Carya illinoiesis (Wangenh.) K. Koch), Paranüsse (Bertholletia excelsa), Pistazien (Pistacia vera), Macadamia- oder Queenslandnüsse (Macadamia ternifolia) sowie daraus gewonnene
Erzeugnisse, außer Nüssen zur Herstellung von alkoholischen Destillaten einschließlich
Ethylalkohol landwirtschaftlichen Ursprungs;'),
(9,'Sellerie','und daraus gewonnene Erzeugnisse;'),
(10,'Senf','und daraus gewonnene Erzeugnisse;'),
(11,'Sesamsamen','und daraus gewonnene Erzeugnisse;'),
(12,'Schwefeldioxid und Sulphite','in Konzentrationen von mehr als 10 mg/kg oder 10 mg/l
als insgesamt vorhandenes SO2 , die für verzehrfertige oder gemäß den Anweisungen des
Herstellers in den ursprünglichen Zustand zurückgeführte Erzeugnisse zu berechnen sind;'),
(13,'Lupinen','und daraus gewonnene Erzeugnisse;'),
(14, 'Weichtiere','und daraus gewonnene Erzeugnisse.')$$
DELIMITER ;


-- Tag --
DROP TABLE IF EXISTS tag;
CREATE TABLE tag(tagId INT PRIMARY KEY,
                 tagName CHAR(16));
INSERT INTO tag VALUES (1, 'Snack'),
                       (2, 'Suppe'),
                       (3, 'Eintopf'),
                       (4, 'scharf'),
                       (5, 'süß'),
                       (6, 'FastFood'),
                       (7, 'low budget');
-- Zutat --
DROP TABLE IF EXISTS ingredient;
CREATE TABLE ingredient(ingredientId INT PRIMARY KEY,
                        ingredientName CHAR(32),
                        ingredientAmount CHAR(32),
                        ingredientUnit CHAR(16),
                        additionalInfo TEXT);
-- 1:1 --
-- Komponente --
DROP TABLE IF EXISTS component;
CREATE TABLE component(componentID INT PRIMARY KEY,
                       componentName CHAR(32));
-- main --
-- Rezept --
DROP TABLE IF EXISTS recipe;
CREATE TABLE recipe(recipeId INT PRIMARY KEY AUTO_INCREMENT,
                    categoryId_fk INT,
                    fountId_fk INT,
                    timeRequired INT,
                    difficultyLevelId_fk INT,
                    recipeName CHAR(32),
                    shortDescription TEXT,
                    longDescription TEXT,
                    costs FLOAT,
           FOREIGN KEY(categoryId_fk) REFERENCES category(categoryId),
           FOREIGN KEY(fountId_fk) REFERENCES fount(fountId),
           FOREIGN KEY(difficultyLevelId_fk) REFERENCES difficultyLevel(difficultyLevelId));

-- n:n --
-- Rezept-Allergen-Liste --
DROP TABLE IF EXISTS recipeAllerList;
CREATE TABLE recipeAllerList(
    recipeId_fk INT,
    allergenId_fk INT,
    FOREIGN KEY(recipeId_fk) REFERENCES recipe(recipeId),
    FOREIGN KEY(allergenId_fk) REFERENCES allergen(allergenId));
-- Rezept-Tag-Liste --
DROP TABLE IF EXISTS recipeTagList;
CREATE TABLE recipeTagList(
    recipeId_fk INT,
    tagId_fk INT,
    FOREIGN KEY(recipeId_fk) REFERENCES recipe(recipeId),
    FOREIGN KEY(tagId_fk) REFERENCES tag(tagId));
-- Rezept-Komponente-Liste --
DROP TABLE IF EXISTS recipeCompList;
CREATE TABLE recipeCompList(
    recipeId_fk INT,
    componentId_fk INT,
    FOREIGN KEY(recipeId_fk) REFERENCES recipe(recipeId),
    FOREIGN KEY(componentId_fk) REFERENCES component(componentId));
-- Komponente-Zutat_Liste --
DROP TABLE IF EXISTS compIngreList;
CREATE TABLE compIngreList(
    componentId_fk INT,
    ingredientId_fk INT,
    FOREIGN KEY(componentId_fk) REFERENCES component(componentId),
    FOREIGN KEY(ingredientId_fk) REFERENCES ingredient(ingredientId));

-- n:1 --
-- Bild --
DROP TABLE IF EXISTS picture;
CREATE TABLE picture(pictureID INT PRIMARY KEY,
                     recipeId_fk INT,
                     path CHAR(128),
                     pictureTitle CHAR(64),
                     FOREIGN KEY(recipeId_fk) REFERENCES recipe(recipeId));