CREATE TABLE Huolto (
    huoltonumero TEXT PRIMARY KEY,
    työntekijäID TEXT REFERENCES Työntekijä(ID),
    auto TEXT REFERENCES Auto(rekisterinumero),
    asiakas TEXT REFERENCES Asiakas(sähköposti),
    ohjelma TEXT REFERENCES HuoltoOhjelma(ID),
    pvm DATE NOT NULL,
    alkamisaika TIME NOT NULL,
    loppumisaika TIME NOT NULL
);
 
CREATE TABLE Omistaja(
    puhellinnro TEXT PRIMARY KEY,
    nimi TEXT
);
 
CREATE TABLE Asiakas(
    sähköposti TEXT PRIMARY KEY,
    nimi TEXT,
    osoite TEXT,
    puhellinnro TEXT
);
 
CREATE TABLE Auto (
    rekisterinumero TEXT PRIMARY KEY,
    valmistaja TEXT,
    kilometrit INTEGER
);
 
CREATE TABLE Työvuoro (
    päivämäärä DATE,
    ID TEXT,
    alkaa TIME NOT NULL,
    loppuu TIME NOT NULL,
    PRIMARY KEY (päivämäärä, ID),
    FOREIGN KEY (ID) REFERENCES Työntekijä(ID)
);
 
CREATE TABLE Työntekijä (
    ID TEXT PRIMARY KEY,
    nimi TEXT
);
 
CREATE TABLE HuoltoOhjelma (
    ID TEXT PRIMARY KEY,
    nimi TEXT
);
 
CREATE TABLE Toimenpide (
    toimenpidetunnus TEXT PRIMARY KEY,
    nimi TEXT NOT NULL, 
    huoltoOhjelmaID TEXT REFERENCES HuoltoOhjelma(ID),
    kesto INTEGER NOT NULL
);
 
CREATE TABLE Varaosa (
    nimi TEXT PRIMARY KEY,
    hinta REAL NOT NULL
);
    
CREATE TABLE Laite (
    laitenumero TEXT PRIMARY KEY,
    tyyppi TEXT REFERENCES Laitetyyppi(tyyppi)
);
 
CREATE TABLE Laitetyyppi (
    tyyppi TEXT PRIMARY KEY
);
    
CREATE TABLE Varaus (
    varausnumero TEXT PRIMARY KEY,
    huoltonumero TEXT REFERENCES Huolto(huoltonumero),
    laitenro TEXT REFERENCES Laite(laitenumero),
    alkamisaika TIME NOT NULL,
    loppumisaika TIME NOT NULL
);

CREATE TABLE Lasku (
    laskunro TEXT PRIMARY KEY,
    huoltonumero TEXT REFERENCES Huolto(huoltonumero),
    hinta REAL NOT NULL,
    eräpäivä DATE NOT NULL,
    maksustatus BOOLEAN 
);
 
CREATE TABLE Maksumuistutus (
    muistutusnro TEXT,
    laskunro TEXT,
    eräpäivä DATE NOT NULL,
    status BOOLEAN,
    lisämaksu REAL,
    PRIMARY KEY (muistutusnro)
    FOREIGN KEY (laskunro) REFERENCES Lasku(laskunro)
);
 
CREATE TABLE Omistaa (
    omistajaPuhelinnro TEXT,
    rekisterinumero TEXT,
    FOREIGN KEY (rekisterinumero) REFERENCES Auto(rekisterinumero),
    FOREIGN KEY (omistajaPuhelinnro) REFERENCES Omistaja(puhellinnro)
);
 
CREATE TABLE Tarvitaan (
    varaosaNimi TEXT,
    huoltonumero TEXT,
    määrä INTEGER,
    FOREIGN KEY (varaosaNimi) REFERENCES Varaosa(nimi),
    FOREIGN KEY (huoltonumero) REFERENCES Huolto(huoltonumero)
);
 
CREATE TABLE Käytetään (
    toimenpidetunnus TEXT,
    tyyppi TEXT,
    FOREIGN KEY (toimenpidetunnus) REFERENCES Toimenpide(toimenpidetunnus),
    FOREIGN KEY (tyyppi) REFERENCES Laitetyyppi(tyyppi)
);
 



INSERT INTO Työntekijä VALUES (
    "8fuc76ge",
    "Keijo"    
);

INSERT INTO Työntekijä VALUES (
    "7dbva73k",
    "Pekka"    
);

INSERT INTO Työntekijä VALUES (
    "8jhg5678",
    "Liisa"    
);

INSERT INTO Työntekijä VALUES (
    "68c2f890",
    "Maija"    
);

INSERT INTO Työntekijä VALUES (
    "1w6yc873",
    "Urpo"    
);

INSERT INTO Työvuoro VALUES (
    "2022-4-3",
    "8fuc76ge",
    "10:00",
    "18:00"
);

INSERT INTO Työvuoro VALUES (
    "2022-4-4",
    "8fuc76ge",
    "11:00",
    "19:00"
);

INSERT INTO Työvuoro VALUES (
    "2022-1-2",
    "68c2f890",
    "9:00",
    "18:00"
);

INSERT INTO Työvuoro VALUES (
    "2022-1-3",
    "68c2f890",
    "9:00",
    "18:00"
);

INSERT INTO Työvuoro VALUES (
    "2022-5-5",
    "1w6yc873",
    "8:00",
    "16:00"
);

INSERT INTO Työvuoro VALUES (
    "2022-5-6",
    "1w6yc873",
    "8:00",
    "16:00"
);

INSERT INTO Työvuoro VALUES (
    "2022-3-8",
    "7dbva73k",
    "10:00",
    "15:00"
);

INSERT INTO Työvuoro VALUES (
    "2022-3-9",
    "7dbva73k",
    "8:00",
    "10:00"
);

INSERT INTO Työvuoro VALUES (
    "2022-5-6",
    "8jhg5678",
    "8:00",
    "16:00"
);

INSERT INTO Työvuoro VALUES (
    "2022-5-7",
    "8jhg5678",
    "11:00",
    "20:00"
);

INSERT INTO Auto VALUES (
    "ABC-511",
    "Toyota",
    100000
);

INSERT INTO Auto VALUES (
    "EBI-851",
    "Ford",
    120780
);

INSERT INTO Auto VALUES (
    "KJF-85",
    "Honda",
    83100
);

INSERT INTO Auto VALUES (
    "FAT-321",
    "Toyota",
    10070
);

INSERT INTO Auto VALUES (
    "III-111",
    "Ford",
    23089
);

INSERT INTO Laitetyyppi VALUES (
    "Pulttipyssy"
);

INSERT INTO Laitetyyppi VALUES (
    "Nosturi"
);

INSERT INTO Laitetyyppi VALUES (
    "Jakoavain"
);

INSERT INTO Laitetyyppi VALUES (
    "Leka"
);

INSERT INTO Laite VALUES (
    "98780",
    "Pulttipyssy"
);

INSERT INTO Laite VALUES (
    "98781",
    "Pulttipyssy"
);

INSERT INTO Laite VALUES (
    "97632",
    "Leka"
);

INSERT INTO Laite VALUES (
    "22337",
    "Jakoavain"
);

INSERT INTO Laite VALUES (
    "22338",
    "Jakoavain"
);

INSERT INTO Laite VALUES (
    "22339",
    "Jakoavain"
);

INSERT INTO Laite VALUES (
    "77621",
    "Nosturi"
);

INSERT INTO Asiakas VALUES (
    "teemu@gmail.fi",
    "Teemu",
    "suoratie 100",
    "0509999"
);

INSERT INTO Asiakas VALUES (
    "liisa@outloook.com",
    "Liisa",
    "kumputie 4",
    "0503333"
);

INSERT INTO Asiakas VALUES (
    "mikko@hotmail.com",
    "Mikko",
    "viistokuja 1",
    "0444444"
);

INSERT INTO Asiakas VALUES (
    "maija@hotmail.com",
    "Maija",
    "jÃ¤merÃ¤ntaival 15",
    "04041411"
);

INSERT INTO Omistaja VALUES (
    "04041411",
    "Maija"
);

INSERT INTO Omistaja VALUES (
    "0444444",
    "Mikko"
);

INSERT INTO Omistaja VALUES (
    "12347",
    "Lauri"
);

INSERT INTO Omistaja VALUES (
    "9999888",
    "Aino"
);

INSERT INTO Omistaja VALUES (
    "01011001",
    "Ville"
);

INSERT INTO Omistaa VALUES (
    "01011001",
    "ABC-511"
);

INSERT INTO Omistaa VALUES (
    "0444444",
    "ABC-511"
);

INSERT INTO Omistaa VALUES (
    "0444444",
    "KJF-85"
);

INSERT INTO Omistaa VALUES (
    "9999888",
    "FAT-321"
);

INSERT INTO HuoltoOhjelma VALUES (
    "dw3i29jd",
    "100000km huolto"
);

INSERT INTO HuoltoOhjelma VALUES (
    "idu3e9ue", 
    "200000km huolto"
);

INSERT INTO HuoltoOhjelma VALUES (
    "sk9304u",
    "300000km huolto"
);

INSERT INTO HuoltoOhjelma VALUES (
    "dj47nr39",
    "moottoriremontti"
);


INSERT INTO Toimenpide VALUES (
    "öv-9873",
    "öljynvaihto",
    "sk9304u",
    15
);

INSERT INTO Toimenpide VALUES (
    "jpv-9873",
    "jarrupalojen vaihto",
    "idu3e9ue",
    30
);


INSERT INTO Huolto VALUES (
    "H-200000-4-4-2022",
    "8fuc76ge",
    "ABC-511",
    "teemu@gmail.fi",
    "idu3e9ue",
    "2022-4-4",
    "12:00",
    "14:00"
);

INSERT INTO Huolto VALUES (
    "H-mr-1-2-2022",
    "68c2f890",
    "FAT-321",
    "liisa@outloook.com",
    "sk9304u",
    "2022-1-2",
    "11:00",
    "15:00"
);

INSERT INTO Varaosa
Values('rengas', 109.33);

INSERT INTO Varaosa
Values('sivupeili', 47.21);

INSERT INTO Varaosa
Values('tuulilasi', 103);

INSERT INTO Varaosa
Values('jarrupala', 83.48);

INSERT INTO Varaosa
Values('ratti',256.11);


INSERT INTO Varaus VALUES (
    "xje9",
    "H-mr-1-2-2022",
    "22338",
    "12:45",
    "13:20" );

INSERT INTO Tarvitaan VALUES (
    "rengas",
    "H-mr-1-2-2022",
    4);

INSERT INTO Lasku VALUES (
    "5243",
    "H-mr-1-2-2022",
    58,
    "2023-01-01",
    "FALSE");

INSERT INTO Käytetään VALUES (
    "jpv-9873",
    "Nosturi");

INSERT INTO Maksumuistutus VALUES (
    "k4683",
    "5243",
    "2023-02-02",
    "TRUE",
    5);


CREATE VIEW Maksamattomat AS
SELECT Laskunro, Asiakas.nimi, eräpäivä
FROM Lasku, Huolto, Asiakas
WHERE Huolto.huoltonumero = Lasku.huoltonumero AND Huolto.asiakas = sähköposti AND maksustatus = 'FALSE' ;

CREATE INDEX Huoltohistoria ON
    Huolto(auto)
    

SELECT rekisterinumero, Huolto.asiakas, Asiakas.nimi, Asiakas.puhellinnro
FROM Auto, Huolto, Asiakas
WHERE rekisterinumero = Huolto.auto AND sähköposti = Huolto.asiakas


SELECT *
FROM Maksamattomat
WHERE nimi = 'Maija';

SELECT AVG(hinta)
FROM Lasku, Huolto
WHERE Huolto.huoltonumero = Lasku.huoltonumero AND Huolto.ohjelma = "moottoriremontti";

SELECT muistutusnro, COUNT(laskunro)
FROM Maksumuistutus;

SELECT *
FROM Huolto
WHERE pvm = '2022-1-2';

SELECT nimi, kesto
FROM Toimenpide;

SELECT Toimenpide.nimi, tyyppi
FROM Laitetyyppi, Toimenpide, Käytetään
WHERE Toimenpide.toimenpidetunnus = Käytetään.toimenpidetunnus AND Laitetyyppi.tyyppi = Käytetään.tyyppi;

SELECT Auto.rekisterinumero, Omistaja.nimi, Omistaja.puhellinnro
FROM Auto, Omistaja, Omistaa
WHERE omistajaPuhelinnro = Omistaja.puhellinnro AND Omistaa.rekisterinumero = Auto.rekisterinumero AND Auto.rekisterinumero = ('ABC-511');

SELECT laskunro, hinta
FROM Lasku
WHERE laskunro = '5243';

SELECT Työntekijä.ID, Työntekijä.nimi FROM
Huolto, Työntekijä WHERE
Huolto.työntekijäID = Työntekijä.ID AND Huolto.pvm = "2022-4-4";

SELECT varaosaNimi, määrä FROM Tarvitaan
WHERE huoltonumero = "H-mr-1-2-2022";

SELECT SUM(hinta * määrä) FROM 
Tarvitaan JOIN Huolto ON Tarvitaan.huoltonumero = Huolto.huoltonumero
JOIN Varaosa ON Varaosa.nimi = Tarvitaan.varaosaNimi
WHERE Huolto.huoltonumero = "H-mr-1-2-2022";

SELECT Työntekijä.ID, nimi, päivämäärä, alkaa, loppuu FROM
Työvuoro, Työntekijä WHERE Työntekijä.ID = Työvuoro.ID
AND päivämäärä >= "2022-3-1" AND päivämäärä < "2022-4-1";

SELECT Toimenpide.nimi, Käytetään.tyyppi FROM
Toimenpide JOIN Käytetään ON Toimenpide.toimenpidetunnus = Käytetään.toimenpidetunnus
JOIN HuoltoOhjelma ON Toimenpide.HuoltoOhjelmaID = HuoltoOhjelma.ID
WHERE HuoltoOhjelma.nimi = "200000km huolto"
GROUP BY Toimenpide.nimi;

SELECT *
FROM Huolto
WHERE pvm = "2022-1-2";

SELECT nimi, kesto
FROM Toimenpide;

SELECT Auto.rekisterinumero, COUNT(Auto.rekisterinumero)
FROM Auto, Huolto
WHERE Auto.rekisterinumero = Huolto.auto
GROUP BY Auto.rekisterinumero;


