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
  <li>WordPress 4.2.4 (PHP-Version 5.4) (<a href="https://github.com/WordPress/WordPress/commit/a4279152fcf286da771777580e1da93a626fb11a">https://github.com/WordPress/WordPress/commit/a4279152fcf286da771777580e1da93a626fb11a</a>)</li>
  <li>
    <span>Wallabag 2.0.0-beta.1 (PHP-Version 5.6) (<a href="https://github.com/wallabag/wallabag/tree/94314e14eeeef7c43365a9fddbece04aec7173e3">https://github.com/wallabag/wallabag/tree/94314e14eeeef7c43365a9fddbece04aec7173e3</a>)</span>
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
  <li>Vorgeschlagene Änderungen sahen auf den ersten Blick trivial aus. Das könnte allerdings an dem von uns ausgesuchtem Beispielprojekt liegen (alte WordPress-Version)</li>
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
<table class="wrapped">
  <colgroup> <col/> <col/> </colgroup>
  <tbody>
    <tr>
      <th>Pro</th>
      <th>Contra</th>
    </tr>
    <tr>
      <td>Potenziell in der Lage komplexe Migrationsoperationen durchzuführen (einfachster Weg um zehntausend Unittests zu updaten)</td>
      <td>Aktuell bugbehaftet</td>
    </tr>
    <tr>
      <td>Kommt mit vorkonfiguriertem Docker-Container</td>
      <td>Dokumentation zum Troubleshooting lässt zu Wünschen übrig</td>
    </tr>
    <tr>
      <td>Viele Rulesets und Findings</td>
      <td>Installation und Konfiguration fragil und daher zeitaufwendig</td>
    </tr>
  </tbody>
</table>
<p>
  <br/>
</p>
<p>
  <br/>
</p>
<h2>Rating:</h2>
<h3>
  <span style="color: rgb(255,153,0);">★★</span>☆☆☆ <strong>"Amazonsterne"<br/>
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
<h2>
  <ac:inline-comment-marker ac:ref="b3016897-ce22-4789-90b7-e9dd205bb461">Beispieloutput</ac:inline-comment-marker>
</h2>
<h3>WordPress:</h3>

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
<h3 class="auto-cursor-target">Wallabag:</h3>

```diff
50) wallabag/src/Wallabag/ImportBundle/Command/ImportCommand.php

    ---------- begin diff ----------
--- Original
+++ New
@@ @@
 namespace Wallabag\ImportBundle\Command;

 use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
-use Symfony\Component\Config\Definition\Exception\Exception;
-use Symfony\Component\Console\Input\InputArgument;
-use Symfony\Component\Console\Input\InputInterface;
-use Symfony\Component\Console\Output\OutputInterface;
-
-class ImportCommand extends ContainerAwareCommand
+use Exception;
+use InputArgument;
+use InputInterface;
+use OutputInterface;
+class ImportCommand extends \Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand
 {
     protected function configure()
     {
-        $this
-            ->setName('wallabag:import-v1')
-            ->setDescription('Import entries from a JSON export from a wallabag v1 instance')
-            ->addArgument('userId', InputArgument::REQUIRED, 'User ID to populate')
-            ->addArgument('filepath', InputArgument::REQUIRED, 'Path to the JSON file')
-        ;
+        $this->setName('wallabag:import-v1')->setDescription('Import entries from a JSON export from a wallabag v1 instance')->addArgument('userId', InputArgument::REQUIRED, 'User ID to populate')->addArgument('filepath', InputArgument::REQUIRED, 'Path to the JSON file');
     }
-
     protected function execute(InputInterface $input, OutputInterface $output)
     {
-        $output->writeln('Start : '.(new \DateTime())->format('d-m-Y G:i:s').' ---');
-
+        $output->writeln('Start : ' . (new DateTime())->format('d-m-Y G:i:s') . ' ---');
         $em = $this->getContainer()->get('doctrine')->getManager();
         // Turning off doctrine default logs queries for saving memory
         $em->getConnection()->getConfiguration()->setSQLLogger(null);
-
         $user = $em->getRepository('WallabagUserBundle:User')->findOneById($input->getArgument('userId'));
-
         if (!is_object($user)) {
             throw new Exception(sprintf('User with id "%s" not found', $input->getArgument('userId')));
         }
-
         $wallabag = $this->getContainer()->get('wallabag_import.wallabag_v1.import');
-        $res = $wallabag
-            ->setUser($user)
-            ->setFilepath($input->getArgument('filepath'))
-            ->import();
-
+        $res = $wallabag->setUser($user)->setFilepath($input->getArgument('filepath'))->import();
         if (true === $res) {
             $summary = $wallabag->getSummary();
-            $output->writeln('<info>'.$summary['imported'].' imported</info>');
-            $output->writeln('<comment>'.$summary['skipped'].' already saved</comment>');
+            $output->writeln('<info>' . $summary['imported'] . ' imported</info>');
+            $output->writeln('<comment>' . $summary['skipped'] . ' already saved</comment>');
         }
-
         $em->clear();
-
-        $output->writeln('End : '.(new \DateTime())->format('d-m-Y G:i:s').' ---');
+        $output->writeln('End : ' . (new DateTime())->format('d-m-Y G:i:s') . ' ---');
     }
 }
    ----------- end diff -----------

```
