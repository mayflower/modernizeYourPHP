<h2>Zweck des Tools (Was verspricht es?):</h2>
<ul>
  <li>Statische Codeanalyse</li>
  <li>Ruleset sucht nach deprecated Sprachkonstrukten</li>
  <li>Kann Unterset von Issues selbstständig reparieren</li>
</ul>
<h2>Relevante Links (Gitrepo, Website, Docs):</h2>
<ul>
  <li>
    <a href="https://github.com/squizlabs/PHP_CodeSniffer">https://github.com/squizlabs/PHP_CodeSniffer</a>
  </li>
  <li>
    <a href="https://github.com/PHPCompatibility/PHPCompatibility">https://github.com/PHPCompatibility/PHPCompatibility</a>
  </li>
</ul>
<h2>Angewendet auf:</h2>
<ul>
  <li>WordPress 4.2.4 (PHP-Version 5.4) (<a href="https://github.com/WordPress/WordPress/commit/a4279152fcf286da771777580e1da93a626fb11a">https://github.com/WordPress/WordPress/commit/a4279152fcf286da771777580e1da93a626fb11a</a>)</li>
  <li>
    <span>Wallabag 2.0.0-beta.1 (PHP-Version 5.6) (<a href="https://github.com/wallabag/wallabag/tree/94314e14eeeef7c43365a9fddbece04aec7173e3">https://github.com/wallabag/wallabag/tree/94314e14eeeef7c43365a9fddbece04aec7173e3</a>)</span>
  </li>
</ul>
<h2>Was wurde getestet:</h2>
<ul>
  <li>Regelsatz PHPCompatibility</li>
</ul>
<h2>Erfahrungen:</h2>
<ul>
  <li>Gut dokumentiert</li>
  <li>Detaillierter Output</li>
  <li>Etwas komplizierter aufzusetzen (<a href="https://github.com/Dealerdirect/phpcodesniffer-composer-installer">phpcodesniffer-composer-installer</a> hilft hier)</li>
  <li>Hat auch viele Regeln für PHP 8</li>
  <li>Hat einen Autofixer, der ca 80% der Issues automatisch fixen kann</li>
  <li>Liefert ausschließlich wichtige Änderungen und lässt "verschönernde" Sprachkonstrukte außen vor</li>
</ul>
<h2>Bewertung:</h2>
<ul>
  <li>Detaillierter und nachvollziehbarer Output</li>
  <li>Findet Dinge, die andere Tools nicht gefunden haben</li>
</ul>
<p>
  <br/>
</p>
<h2>Rating:</h2>
<h3>
  <strong> <span style="color: rgb(255,153,0);">★★★★★</span> "Amazonsterne"<br/>
  </strong>
</h3>
<ul>
  <li>
    <strong>Tut was es soll. Definitiv der bessere PHPDeprecationDetector. Kann nicht alles autofixen (verspricht es auch nicht). Hat bisher am meisten sinnvolle Dinge gefunden. Installation etwas holprig.</strong>
  </li>
</ul>
<h2>
  <ac:inline-comment-marker ac:ref="7e7c74f3-e803-4ee8-9984-f557794ddbb2">Beispieloutput</ac:inline-comment-marker>
</h2>
<h3>WordPress:</h3>

```php
FILE: /home/alexander/Code/php-update/wp-docker/wp-root/wp-admin/includes/class-ftp.php
----------------------------------------------------------------------------------------------------------------------------------------------
FOUND 10 ERRORS AND 4 WARNINGS AFFECTING 9 LINES
----------------------------------------------------------------------------------------------------------------------------------------------
188 | WARNING | [x] Curly brace syntax for accessing array elements and string offsets has been deprecated in PHP 7.4. Found: $lucifer[0]{0}
189 | WARNING | [x] Curly brace syntax for accessing array elements and string offsets has been deprecated in PHP 7.4. Found: $lucifer[0]{0}
383 | ERROR | [ ] Function ereg_replace() is deprecated since PHP 5.3 and removed since PHP 7.0; Use preg_replace() instead
383 | ERROR | [ ] Extension 'ereg' is deprecated since PHP 5.3 and removed since PHP 7.0; Use pcre instead
427 | ERROR | [ ] Function ereg_replace() is deprecated since PHP 5.3 and removed since PHP 7.0; Use preg_replace() instead
427 | ERROR | [ ] Extension 'ereg' is deprecated since PHP 5.3 and removed since PHP 7.0; Use pcre instead
447 | ERROR | [ ] Function ereg_replace() is deprecated since PHP 5.3 and removed since PHP 7.0; Use preg_replace() instead
447 | ERROR | [ ] Extension 'ereg' is deprecated since PHP 5.3 and removed since PHP 7.0; Use pcre instead
778 | WARNING | [ ] Function each() is deprecated since PHP 7.2; Use a foreach loop instead
821 | ERROR | [ ] Function ereg() is deprecated since PHP 5.3 and removed since PHP 7.0; Use preg_match() instead
821 | ERROR | [ ] Extension 'ereg' is deprecated since PHP 5.3 and removed since PHP 7.0; Use pcre instead
822 | ERROR | [ ] Function eregi() is deprecated since PHP 5.3 and removed since PHP 7.0; Use preg_match() instead
822 | ERROR | [ ] Extension 'ereg' is deprecated since PHP 5.3 and removed since PHP 7.0; Use pcre instead
902 | WARNING | [ ] Function dl() is deprecated since PHP 5.3
----------------------------------------------------------------------------------------------------------------------------------------------
PHPCBF CAN FIX THE 2 MARKED SNIFF VIOLATIONS AUTOMATICALLY
----------------------------------------------------------------------------------------------------------------------------------------------

```
<h3 class="auto-cursor-target">Wallabag:</h3>

```php
FILE: /home/alexander/Code/php-update/modernize4phpstack/exampleProject/wallabag/var/SymfonyRequirements.php
------------------------------------------------------------------------------------------------------------
FOUND 0 ERRORS AND 4 WARNINGS AFFECTING 4 LINES
------------------------------------------------------------------------------------------------------------
506 | WARNING | Function create_function() is deprecated since PHP 7.2; Use an anonymous function instead
524 | WARNING | Function create_function() is deprecated since PHP 7.2; Use an anonymous function instead
542 | WARNING | Function create_function() is deprecated since PHP 7.2; Use an anonymous function instead
682 | WARNING | Function create_function() is deprecated since PHP 7.2; Use an anonymous function instead
------------------------------------------------------------------------------------------------------------

```
