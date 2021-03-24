<h2>Zweck des Tools (Was verspricht es?):</h2>
<ul>
  <li>Analyse von PHP-Code auf Verwendung von deprecated features<ul>
      <li>Entfernte oder als deprecated markierte Features (Funktionen, Objekte, Variablen, Konstanten, INI-Direktiven)</li>
      <li>Verwendung von in neueren Versionen reservierten Schlüsselwörtern</li>
    </ul>
  </li>
  <li>Generieren von Reports, entweder als Text oder als JSON</li>
</ul>
<h2>Relevante Links (Gitrepo, Website, Docs):</h2>
<ul>
  <li>
    <a href="https://github.com/wapmorgan/PhpDeprecationDetector">https://github.com/wapmorgan/PhpDeprecationDetector</a>
  </li>
</ul>
<h2>Angewendet auf:</h2>
<ul>
  <li>Wordpress 4.2.4 (PHP-Version 5.4) (<a href="https://github.com/WordPress/WordPress/commit/a4279152fcf286da771777580e1da93a626fb11a">https://github.com/WordPress/WordPress/commit/a4279152fcf286da771777580e1da93a626fb11a</a>)</li>
  <li>
    <span>Wallabag 2.0.0-beta.1 (PHP-Version 5.6) (<a href="https://github.com/wallabag/wallabag/tree/94314e14eeeef7c43365a9fddbece04aec7173e3">https://github.com/wallabag/wallabag/tree/94314e14eeeef7c43365a9fddbece04aec7173e3</a>)</span>
  </li>
</ul>
<h2>Was wurde getestet:</h2>
<ul>
  <li>Deprecations zwischen PHP-Versionen 5.3 und 7.4 (entspricht dem vollen Umfang der Prüfregeln des Tools)</li>
  <li>Generierung des JSON-reports</li>
</ul>
<h2>Erfahrungen:</h2>
<ul>
  <li>Relativ einfach zu installieren und zu benutzen</li>
  <li>Vergleichsweise schnell (Rector)</li>
  <li>Erzeugt einen verständlichen Report, zum Teil mit Korrekturvorschlägen und Erläuterungen</li>
  <li>Noch keine Regeln für PHP 8 verfügbar</li>
</ul>
<h2>Bewertung:</h2>
<ul>
  <li>Tool funktioniert wie erwartet</li>
  <li>Kein Autofixing, Korrekturen müssen selbst umgesetzt werden, sie sind ggf. nicht trivial.</li>
</ul>
<p>
  <br/>
</p>
<h2>Rating:</h2>
<h3>
  <span style="color: rgb(255,153,0);">★★</span> <span style="color: rgb(255,153,0);">★★</span>☆<strong> "Amazonsterne"</strong>
</h3>
<ul>
  <li>
    <strong>Verspricht nicht zu viel, aber das was es verspricht, das hält es ein. PHP 8 wird (noch) nicht unterstützt.<br/>
    </strong>
  </li>
</ul>
<h2>Beispieloutput</h2>
<h3>Wordpress:</h3>

```bash
- PHP 5.3 (20) - your version is greater or equal
+-----------------------------------------------+---------+---------------------------------------------------------------------+
| File:Line                                     | Type    | Issue                                                               |
+-----------------------------------------------+---------+---------------------------------------------------------------------+
| /vendor/nette/utils/src/Utils/Strings.php:488 | changed | Function usage pcre() (@call_with_passing_by_reference) is changed. |
|                                               |         | Call with passing by reference is deprecated. Problem is "&$m"      |
| /vendor/nette/utils/src/Utils/Strings.php:503 | changed | Function usage pcre() (@call_with_passing_by_reference) is changed. |
|                                               |         | Call with passing by reference is deprecated. Problem is "&$m"      |
| /wp-admin/includes/class-ftp-pure.php:113     | removed | Function ereg_replace() is removed.                                 |
|                                               |         | Consider replace with preg_replace()                                |
| /wp-admin/includes/class-ftp-sockets.php:134  | removed | Function ereg_replace() is removed.                                 |
|                                               |         | Consider replace with preg_replace()                                |
| /wp-admin/includes/class-ftp.php:383          | removed | Function ereg_replace() is removed.                                 |
|                                               |         | Consider replace with preg_replace()                                |
| /wp-admin/includes/class-ftp.php:427          | removed | Function ereg_replace() is removed.                                 |
|                                               |         | Consider replace with preg_replace()                                |
| /wp-admin/includes/class-ftp.php:447          | removed | Function ereg_replace() is removed.                                 |
|                                               |         | Consider replace with preg_replace()                                |
| /wp-admin/includes/class-ftp.php:821          | removed | Function ereg() is removed.                                         |
|                                               |         | Consider replace with preg_match()                                  |
| /wp-admin/includes/class-ftp.php:822          | removed | Function eregi() is removed.                                        |
|                                               |         | Consider replace with preg_match()                                  |
| /wp-admin/includes/class-ftp.php:902          | removed | Function dl() is removed.                                           |
| /wp-admin/includes/class-pclzip.php:5340      | removed | Function set_magic_quotes_runtime() is removed.                     |
| /wp-admin/includes/class-pclzip.php:5371      | removed | Function set_magic_quotes_runtime() is removed.                     |
| /wp-includes/atomlib.php:151                  | removed | Function split() is removed.                                        |
|                                               |         | Consider replace with preg_split()                                  |
| /wp-includes/atomlib.php:230                  | removed | Function split() is removed.                                        |
|                                               |         | Consider replace with preg_split()                                  |
| /wp-includes/atomlib.php:305                  | removed | Function split() is removed.                                        |
|                                               |         | Consider replace with preg_split()                                  |
| /wp-includes/class-phpmailer.php:2137         | removed | Function set_magic_quotes_runtime() is removed.                     |
| /wp-includes/class-phpmailer.php:2146         | removed | Function set_magic_quotes_runtime() is removed.                     |
| /wp-includes/class-phpmailer.php:2139         | removed | Ini magic_quotes_runtime is removed.                                |
| /wp-includes/class-phpmailer.php:2148         | removed | Ini magic_quotes_runtime is removed.                                |
| /wp-includes/rss.php:107                      | removed | Function split() is removed.                                        |
|                                               |         | Consider replace with preg_split()                                  |
+-----------------------------------------------+---------+---------------------------------------------------------------------+
```
<h3 class="auto-cursor-target">Wallabag:</h3>

```bash
- PHP 7.2 (4) - your version is greater or equal
+----------------------------------+---------+----------------------------------------+
| File:Line                        | Type    | Issue                                  |
+----------------------------------+---------+----------------------------------------+
| /var/SymfonyRequirements.php:506 | removed | Function create_function() is removed. |
| /var/SymfonyRequirements.php:524 | removed | Function create_function() is removed. |
| /var/SymfonyRequirements.php:542 | removed | Function create_function() is removed. |
| /var/SymfonyRequirements.php:682 | removed | Function create_function() is removed. |
+----------------------------------+---------+----------------------------------------+


Total issues: 4
Peak memory usage: 29.498 MB

```
