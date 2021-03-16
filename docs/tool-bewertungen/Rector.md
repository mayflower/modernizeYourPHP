<h2>Zweck des Tools (Was verspricht es?):</h2>
<ul>
  <li>Automatisierte Versionsmigrationen von PHP-Code</li>
  <li>Versionsmigrationen auf neueres Framework (z.B. Symfony)</li>
  <li>Automatische Architekturrefactorings</li>
  <li>
    <blockquote>"We'll speed up your development by 300%"</blockquote>
  </li>
  <li>Es gibt einen "Dry Run"-Modus, der die vorzunehmenden Änderungen nur auflistet</li>
</ul>
<h2>Relevante Links (Gitrepo, Website, Docs):</h2>
<ul>
  <li>
    <a href="https://getrector.org/">https://getrector.org/</a>
  </li>
  <li>
    <a href="https://github.com/rectorphp/rector">https://github.com/rectorphp/rector</a> (Dokumentationen nur hier)</li>
</ul>
<h2>Angewendet auf:</h2>
<ul>
  <li>Wordpress 4.2.4 (PHP-Version 5.4) (<a href="https://github.com/WordPress/WordPress/commit/a4279152fcf286da771777580e1da93a626fb11a">https://github.com/WordPress/WordPress/commit/a4279152fcf286da771777580e1da93a626fb11a</a>
    <span>)</span>
  </li>
</ul>
<h2>Was wurde getestet:</h2>
<ul>
  <li>Regelsätze PHP70 und DEADCODE</li>
  <li>Dry-Run- und Standardmodus</li>
</ul>
<h2>Erfahrungen:</h2>
<ul>
  <li>War in der Lage einfache Veränderungen in Richtung Search/Replace durchzuführen</li>
  <li>Outputformat in JSON angeblich möglich, führte aber zu Fehlern</li>
  <li>War nicht-trivial zu konfigurieren, hat Autoloadfehler geworfen (obwohl es vorgibt ein statischer Codeanalysator zu sein), für die wir in der Timebox keine Lösung finden konnten</li>
  <li>Vorgeschlagene Änderungen sahen auf den ersten Blick trivial aus. Das könnte allerdings an dem von uns ausgesuchtem Beispielprojekt liegen (alte Wordpress-Version)</li>
  <li>Feature Flags wurden nicht erkannt und falsch gerefactored</li>
</ul>
<h2>Bewertung:</h2>
<ul>
  <li>Die Autoload-Probleme haben es schwierig gemacht in vernünftiger Zeit bewertbare Ergebnisse zu bekommen</li>
  <li>Wir glauben, dass es in bestimmten, engen, Anwendungsbereichen (z.B. viele Unittests mit Search/Replace updaten) sinnvoll sein könnte</li>
  <li>Beurteilung der Toolqualität wird auch präziser wenn wir es mit anderen Tools vergleichen (Wer findet was?)</li>
</ul>
<p>
  <br/>
</p>
<h2>Rating:</h2>
<h3>
  <strong>★★☆☆☆ "Amazonsterne"<br/>
  </strong>
</h3>
<ul>
  <li>
    <strong>Es verspricht viel, hat theoretisch Potenzial, nur wir konnten damit nicht in vernünftigem Zeitrahmen zu produktiven Ergebnissen kommen (technische Schwierigkeiten, Dokumentation unzureichend).</strong>
  </li>
</ul>
<p>
  <br/>
</p>
<h2>Beispieloutput:</h2>

```diff
1 file with changes
===================

1) wp-login.php

---------- begin diff ----------
--- Original
+++ New
@@ @@
// Main
//

-$action = isset($_REQUEST['action']) ? $_REQUEST['action'] : 'login';
+$action = $_REQUEST['action'] ?? 'login';
$errors = new WP_Error();

if ( isset($_GET['key']) )
@@ @@
}
}

- $requested_redirect_to = isset( $_REQUEST['redirect_to'] ) ? $_REQUEST['redirect_to'] : '';
+ $requested_redirect_to = $_REQUEST['redirect_to'] ?? '';
/**
* Filter the login redirect URL.
*
----------- end diff -----------


Applied rules:

* Rector\Php70\Rector\Ternary\TernaryToNullCoalescingRector
```
