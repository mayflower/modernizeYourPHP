# modernize4phpstack
Wir beschäftigen uns mit Modernisierungstools für PHP-Projekte. Wir wollen Möglichkeiten finden, Entwicklern Versionsmigrationen von z. B. PHP 5 auf PHP 8 zu erleichtern.

Dieses Repo enthält alles an Code, der bei unserer Arbeit entstanden ist.

## Wallabag
Wir haben als Beispielprojekt für Versionsmigrationen das auf Symfony basierende Wallabag ausgesucht und einen Stand von vor sechs Jahren aus dem entsprechenden Composer-Repo gezogen.
Es läuft in einem Docker-Container mit PHP 5.6. Wir benutzen Wallabag in dieser alten Version als Ausgangspunkt, um Migrationstools zu testen und zu bewerten.

## Benutzung
Zum Starten unter Unix-Systemen das Skript `start.sh` im Unterordner `/exampleProject` benutzen, für Windows einfach `docker-compose up` ausführen.
Nach dem ersten Start (nach dem Bau der Container) reicht auch `docker-compose up`.

Der Zweck des Skripts besteht darin, die IDs des aktuellen Users und der Usergruppe an den Container weiterzureichen, um Berechtigungskonflikte beim Bind-Mount zu vermeiden.

Verifiziert unter Linux, Mac und Windows 10, andere Windows-Versionen ohne Gewähr.
