/*
Adatbázis létrehozása feladat

Készíts adatbázis-táblákat a feladat leírása alapján!
(Magát az adatbázist nem kell létrehoznod.)

Amit be kell adnod:
    - a táblák létrehozásának MySQL utasítása
    - a táblák mezőinek létrehozásához és beállításához szükséges MySQL utasítások

Az utasításokat jelen fájl tartalmazza!

A bónusz feladat megoldása nem kötelező.

Nem futtatható (azaz szintaktikai hibás) SQL utasításokért nem jár pont.
A feladatot részben teljesítő megoldásokért részpontszám jár.
A bónusz feladatnál csak a teljesen helyes megoldásért jár pont.

A feladat leírása törölhető.

Jó munkát!
*/

/*
Adatbázis-táblák létrehozása (20 pont)

Az általad létrehozott adatbázist egy üzenetküldő alkalmazáshoz szeretnénk használni.
Az alkalmazásban a felhasználók regisztrálás után tudnak üzenetet küldeni szintén regisztrált felhasználóknak,
valamint a kapott üzenetekre válaszolhatnak.
Nincs lehetőség több címzett megadására - azaz egy üzenetet csak egy felhasználó részére lehet küldeni.

Az adatbázisnak képesnek kell lennie a következő adatok tárolására:
    1. regisztrált felhasználók adatai
        - kötelező adatok: név, email-cím, jelszó, aktív felhasználó-e, a regisztrálás időpontja
    2. a regisztrált felhasználók által egymásnak küldött üzenetek adatai
        - kötelező adatok: küldő, címzett, üzenet szövege, az üzenet küldésének időpontja,
          továbbá ha az üzenet egy korábban kapottra válasz, akkor hivatkozás a megválaszolt üzenetre

Kritériumok az adatbázissal kapcsolatban:
    - legalább kettő, legfeljebb négy táblát tartalmazzon
    - legyen legalább egy kapcsolat a létrehozott táblák között (idegen kulccsal)
      (egy tábla saját magával is kapcsolódhat)
    - a fent leírt adatokon kívül más adatokat is tárolhat, de egy táblán legfeljebb 8 mező lehet
    - az adatbázis, a táblák és a mezők elnevezése rajtad áll, azonban használj angol megnevezéseket, méghozzá következetesen
      (ha az egyik táblában camel-case szerinti mező-neveket adtál, akkor a másik táblában is tégy úgy)


    CREATE TABLE `messenger_app`.`user_info`
    ( `id` INT NOT NULL AUTO_INCREMENT ,
        `name` VARCHAR(100) NOT NULL ,
        `email` VARCHAR(100) NULL DEFAULT NULL ,
        `password` VARCHAR(16) NOT NULL ,
        `isActive` BOOLEAN NOT NULL ,
        `dateOfRegistration` DATE NOT NULL DEFAULT CURRENT_TIMESTAMP ,
        PRIMARY KEY (`id`)) ENGINE = InnoDB;

    CREATE TABLE `messenger_app`.`message_info`
    ( `id` INT NOT NULL AUTO_INCREMENT ,
        `date` DATE NOT NULL DEFAULT CURRENT_TIMESTAMP ,
        `message` TEXT NOT NULL ,
        PRIMARY KEY (`id`)) ENGINE = InnoDB;

    CREATE TABLE `messenger_app`.`message_user`
    ( `fromID` INT NOT NULL ,
        `toID` INT NOT NULL ,
        `messageID` INT NOT NULL ,
        `isReply` BOOLEAN NOT NULL DEFAULT FALSE ,
        PRIMARY KEY (`fromID`, `toID`, `messageID`)) ENGINE = InnoDB;

    ALTER TABLE `messenger_app`.`message_user`
    ADD CONSTRAINT fk_fromID
    FOREIGN KEY (fromID)
    REFERENCES `user_info`(`id`);

    ALTER TABLE `messenger_app`.`message_user`
    ADD CONSTRAINT fk_toID
    FOREIGN KEY (toID)
    REFERENCES `user_info`(`id`);

    ALTER TABLE `messenger_app`.`message_user`
    ADD CONSTRAINT fk_messageID
    FOREIGN KEY (messageID)
    REFERENCES `message_info`(`id`);
*/


-- ---------------------------------------------------------------------------------------------------------------------

/*
Bónusz feladat (5 pont)

Adj hozzá adatokat mindegyik táblához!
(Az adatoknak nem kell valósnak lenniük. Egy felhasználói email-cím lehet például: 'valami@valami.va')

INSERT INTO `user_info`(`name`, `email`, `password`, `isActive`)
VALUES ('valaki', 'valaki@email.com', '123456a', 1),
('valaki más', 'valakimas@email.com', '123456b', 1),
('inaktiv', 'inaktiv@email.com', '123456c', 0);

INSERT INTO `message_info`(`message`)
VALUES ('juhuuu, ez egy üzenet');

INSERT INTO `message_user`(`fromID`, `toID`, `messageID`, `isReply`)
VALUES (1, 2, 1, 0);

*/
