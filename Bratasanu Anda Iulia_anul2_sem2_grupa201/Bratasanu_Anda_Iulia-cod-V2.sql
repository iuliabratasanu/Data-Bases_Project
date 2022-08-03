/* Bratasanu Anda Iulia, grupa 201, anul II, sem II, tema pentru acasa - BD */

CREATE DATABASE subpunct1_problema1;
USE subpunct1_problema1;

/* mai jos sunt construite entitatile, impreuna cu atributele sale,
   precum si cheile; este foarte importanta ordinea entitatilor */
CREATE TABLE grupa(

cod_grupa CHAR(3) NOT NULL UNIQUE,
cod_student_sef_grupa CHAR(6),
cod_prof_indrumator_grupa CHAR(4),
PRIMARY KEY(cod_grupa) 

);

CREATE TABLE student(

cod_student CHAR(6) NOT NULL UNIQUE,
cod_grupa CHAR(3) NOT NULL,
nume_student VARCHAR(50),
prenume_student VARCHAR(50),
initiale_tata_student VARCHAR(3),
adresa_student VARCHAR(200),
telefon_student VARCHAR(15),
media_student INT UNSIGNED,
PRIMARY KEY(cod_student),
FOREIGN KEY (cod_grupa) REFERENCES grupa(cod_grupa)

);

CREATE TABLE profesor(

cod_prof CHAR(4) NOT NULL UNIQUE,
nume_prof VARCHAR(20),
prenume_prof VARCHAR(20),
adresa_prof VARCHAR(200),
telefon_prof VARCHAR (15),
PRIMARY KEY(cod_prof)

);

ALTER TABLE grupa 
ADD FOREIGN KEY (cod_student_sef_grupa) references student(cod_student); /* aici imi da eroare */

ALTER TABLE grupa 
ADD FOREIGN KEY (cod_prof_indrumator_grupa) references profesor(cod_prof);  /* aici imi da eroare */

CREATE TABLE curs(

cod_curs CHAR(5) NOT NULL UNIQUE,
descriere_curs VARCHAR(200),
cod_prof CHAR(4) NOT NULL,
PRIMARY KEY(cod_curs),
FOREIGN KEY (cod_prof) REFERENCES profesor(cod_prof)
);

CREATE TABLE nota(

cod_nota CHAR(7), /* cod_nota este creat prin procesul de normalizare */
cod_student CHAR(6),
cod_curs CHAR(4),
valoare_nota INT UNSIGNED,
sesiune_nota VARCHAR(20),
tip_examinare_nota VARCHAR(20),
nr_credite_nota INT UNSIGNED,
PRIMARY KEY(cod_nota),
FOREIGN KEY (cod_student) REFERENCES student(cod_student),
FOREIGN KEY (cod_curs) REFERENCES curs(cod_curs)
);

/* mai jos ne vom ocupa de popularea bazei, am ales sa lucrez in ordinea in care am initializat entitatile */

INSERT INTO grupa (cod_grupa, cod_student_sef_grupa, cod_prof_indrumator_grupa) VALUES ('201', 'S21001', 'P221');
INSERT INTO grupa (cod_grupa, cod_student_sef_grupa, cod_prof_indrumator_grupa) VALUES ('202', 'S21004', 'P222');
INSERT INTO grupa (cod_grupa, cod_student_sef_grupa, cod_prof_indrumator_grupa) VALUES ('203', 'S21007', 'P223');
/* codul studentului a fost format astfel: S = Prima litera a cuvantului 'student', 2 = anul II, 2 = semestrul II, 00X = numarul studentului - un fel de indexare */
/* codul profesorului a fost format astfel: P = Prima litera a cuvantului 'profesor', 2 = anul II, 2 = semestrul II, iar ultima cifra reprezinta numarul de indexare al profesorului */

INSERT INTO student (cod_student, cod_grupa, nume_student, prenume_student, initiale_tata_student, adresa_student, telefon_student, media_student) VALUES ('S22001', '201', 'Bratasanu', 'Anda-Iulia', 'M', 'Strada Margaretelor nr. 19', '0728000999', '8');
INSERT INTO student (cod_student, cod_grupa, nume_student, prenume_student, initiale_tata_student, adresa_student, telefon_student, media_student) VALUES ('S22002', '201', 'Petrescu', 'Giga-Andrei', 'L', 'Strada Vinului nr. 1, ap.6', '0728111222', '6');
INSERT INTO student (cod_student, cod_grupa, nume_student, prenume_student, initiale_tata_student, adresa_student, telefon_student, media_student) VALUES ('S22003', '201', 'Blandiana', 'Ana-Maria', 'AI', 'Strada Florilor Albe nr. 5', '0728123456', '10');
INSERT INTO student (cod_student, cod_grupa, nume_student, prenume_student, initiale_tata_student, adresa_student, telefon_student, media_student) VALUES ('S22004', '202', 'Tomescu', 'Liviu Gabi', 'GMF', 'Strada Fericirii Mov, ap.3', '0728676767', '7');
INSERT INTO student (cod_student, cod_grupa, nume_student, prenume_student, initiale_tata_student, adresa_student, telefon_student, media_student) VALUES ('S22005', '202', 'Caravia', 'Mircea-Alex', 'EC', 'Strada Rasaritului, nr. 10', '0728222222', '5');
INSERT INTO student (cod_student, cod_grupa, nume_student, prenume_student, initiale_tata_student, adresa_student, telefon_student, media_student) VALUES ('S22006', '202', 'Craciunoiu', 'Cosmina', 'DTV', 'Strada Gheorghe AI. nr. 19', '0728348956', '4');
INSERT INTO student (cod_student, cod_grupa, nume_student, prenume_student, initiale_tata_student, adresa_student, telefon_student, media_student) VALUES ('S22007', '203', 'Marussi', 'Andreea Ana', 'ER', 'Bulevardul Frumusetii nr.4', '0728777779', '8');
INSERT INTO student (cod_student, cod_grupa, nume_student, prenume_student, initiale_tata_student, adresa_student, telefon_student, media_student) VALUES ('S22008', '203', 'Panu', 'Anastasie-Ioana', 'F', 'Strada Bibliotecii, nr. 88', '0728342458', '10');
INSERT INTO student (cod_student, cod_grupa, nume_student, prenume_student, initiale_tata_student, adresa_student, telefon_student, media_student) VALUES ('S22009', '203', 'Zamfir', 'Vlad-Traian', 'G', 'Bulevardul Castanilor nr. 27', '0728983743', '9');

INSERT INTO profesor (cod_prof, nume_prof, prenume_prof, adresa_prof, telefon_prof) VALUES ('P221', 'Banica', 'Andrei Cristian', 'Strada Atentiei, nr. 60', '0728000777');
INSERT INTO profesor (cod_prof, nume_prof, prenume_prof, adresa_prof, telefon_prof) VALUES ('P222', 'Iulas', 'Cornelia Maria', 'Strada Concentrare, nr. 1', '0728291380');
INSERT INTO profesor (cod_prof, nume_prof, prenume_prof, adresa_prof, telefon_prof) VALUES ('P223', 'Zinca', 'Ruxandra Alina', 'Strada Preciziei, nr. 402', '0728123984');
INSERT INTO profesor (cod_prof, nume_prof, prenume_prof, adresa_prof, telefon_prof) VALUES ('P224', 'Moroianu', 'Tudor Razvan', 'Strada Atentiei, nr. 947', '0728497309');

INSERT INTO curs (cod_curs, descriere_curs, cod_prof) VALUES ('C220','Programare pe Obiecte', 'P221');
INSERT INTO curs (cod_curs, descriere_curs, cod_prof) VALUES ('C221','Metode Avansate de Programare', 'P221');
INSERT INTO curs (cod_curs, descriere_curs, cod_prof) VALUES ('C222','Fiabilitate si testarea aplicatiilor software', 'P222');
INSERT INTO curs (cod_curs, descriere_curs, cod_prof) VALUES ('C223','Baze de date', 'P223');
INSERT INTO curs (cod_curs, descriere_curs, cod_prof) VALUES ('C224','Educatie fizica', 'P224');
INSERT INTO curs (cod_curs, descriere_curs, cod_prof) VALUES ('C225','Tehnologii Web', 'P222');

INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2PO221','S22001', 'C220', 7,'iarna','examen', 5);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2PO222','S22002', 'C220', 8,'primavara','examen', 3);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2PO223','S22003', 'C220', 9,'iarna','examen', 2);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2PO224','S22004', 'C220', 4,'vara','examen', 1);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2PO225','S22005', 'C220', 10,'toamna','examen', 4);

INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2MP221','S22001', 'C221', 5,'primavara','examen', 8);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2MP222','S22002', 'C221', 7,'iarna','examen', 8);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2MP223','S22008', 'C221', 3,'toamna','examen', 8);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2MP224','S22004', 'C221', 8,'iarna','examen', 6);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2MP225','S22005', 'C221', 9,'primavara','examen', 8);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2MP226','S22006', 'C221', 10,'iarna','examen', 8);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2MP227','S22007', 'C221', 10,'vara','examen', 8);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2MP228','S22009', 'C221', 3,'iarna','examen', 8);

INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2FT221','S22001', 'C222', 6,'iarna','examen', 2);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2FT222','S22009', 'C222', 4,'iarna','examen', 3);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2FT223','S22005', 'C222', 10,'iarna','examen', 6);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2FT224','S22008', 'C222', 4,'iarna','examen', 4);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2FT225','S22002', 'C222', 8,'iarna','examen', 7);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2FT226','S22004', 'C222', 9,'iarna','examen', 5);

INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2BD221','S22001', 'C223', 7,'toamna','examen', 2);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2BD222','S22002', 'C223', 4,'iarna','examen', 1);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2BD223','S22003', 'C223', 8,'toamna','examen', 5);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2BD224','S22004', 'C223', 5,'primavara','examen', 6);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2BD225','S22005', 'C223', 10,'iarna','examen', 4);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2BD226','S22006', 'C223', 3,'iarna','examen', 0);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2BD227','S22008', 'C223', 10,'vara','examen', 5);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2BD228','S22009', 'C223', 9,'vara','examen', 7);

INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2EF221','S22001', 'C224', 10,'toamna','colocviu', 2);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2EF222','S22004', 'C224', 9,'iarna','colocviu', 1);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2EF223','S22007', 'C224', 10,'toamna','colocviu', 5);

INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2TW221','S22001', 'C225', 5,'iarna','examen', 8);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2TW222','S22002', 'C225', 10,'primavara','examen', 8);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2TW223','S22004', 'C225', 6,'iarna','examen', 4);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2TW224','S22006', 'C225', 3,'toamna','examen', 7);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2TW225','S22008', 'C225', 9,'iarna','examen', 6);
INSERT INTO nota (cod_nota, cod_student, cod_curs, valoare_nota, sesiune_nota, tip_examinare_nota, nr_credite_nota) VALUES ('N2TW226','S22005', 'C225', 4,'vara','examen', 1);
