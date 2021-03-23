# modernizeYourPHP

Hier wollen wir Dinge festhalten, die beim Migrieren eines PHP-Projektes auf eine neuere Version helfen können. Darunter:

- Good Practices,
- interessante Tools und
- Scripte.

## Beispielprojekt

Zuerst haben wir die Migrationstools an Wordpress ausprobiert. Wir wollten aber ein kleineres, handlicheres Projekt, deshalb sind wir nun zu Wallabag gewechselt.
Das Beispielprojekt liegt unter [exampleProject](exampleProject)

### Docker-Setup für PHP-Anwendungen

Außerdem haben wir das Ganze "dockerisiert", so dass Wallabag samt PHP und Datenbank im Container läuft. **Diese Docker-Konfiguration kann als Template für eigene PHP-Anwendungen genutzt werden!**

## Tools

Hier eine Auswahl von Tools und unsere Bewertung dazu:

- [Rector](docs/tool-bewertungen/Rector.md)
- [PHP_CodeSniffer mit PHPCompatibility Ruleset](docs/tool-bewertungen/PHP_CodeSniffer%20mit%20PHPCompatibility%20Ruleset.md)
- [PHPStan mit Deprecation Ruleset](docs/tool-bewertungen/PHPStan%20mit%20Deprecation%20Ruleset.md)
- [PhpDeprecationDetector](docs/tool-bewertungen/PhpDeprecationDetector.md)

### Out of Scope

Folgende Tools hatten wir im Augenmerk, sie verfolgen aber leider ein anderes Ziel:

- [PHP Compat Info](docs/tool-bewertungen/PHP%20Compat%20Info.md)
- [Sonarqube](docs/tool-bewertungen/Sonarqube.md)