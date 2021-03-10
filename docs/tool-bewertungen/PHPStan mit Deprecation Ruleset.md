<h2>Zweck des Tools (Was verspricht es?):</h2>
<ul>
  <li>Statische Codeanalyse mit vielen Regelsätzen</li>
  <li>Fokus auf Codestandards und Sicherheit</li>
</ul>
<h2>Relevante Links (Gitrepo, Website, Docs):</h2>
<ul>
  <li>
    <a href="https://github.com/phpstan/phpstan">https://github.com/phpstan/phpstan</a>
  </li>
  <li>
    <a href="https://github.com/phpstan/phpstan-deprecation-rules">https://github.com/phpstan/phpstan-deprecation-rules</a>
  </li>
</ul>
<h2>Angewendet auf:</h2>
<ul>
  <li>Wordpress 4.2.4 (PHP-Version 5.4) (<a class="external-link" href="https://github.com/WordPress/WordPress/commit/a4279152fcf286da771777580e1da93a626fb11a" rel="nofollow">https://github.com/WordPress/WordPress/commit/a4279152fcf286da771777580e1da93a626fb11a</a> <span>)</span>
  </li>
</ul>
<h2>Was wurde getestet:</h2>
<ul>
  <li>Ausführung mit Deprecation-Ruleset</li>
</ul>
<h2>Erfahrungen:</h2>
<ul>
  <li>Etwas Konfigurationsaufwand (wichtig war <em>customRulesetUsed: true</em>).</li>
  <li>Überraschend wenige Funde, im Vergleich zu anderen Tools.</li>
</ul>
<h2>Bewertung:</h2>
<ul>
  <li>Die Regeln scheinen lediglich auf '@deprecated'-Annotations zu prüfen. Die Ergebnisse haben daher leider nur begrenzten Nutzen für unseren Anwendungsfall.</li>
</ul>
<p>
  <br/>
</p>
<h2>Rating:</h2>
<h3>
  <strong>2/5 "Amazonsterne"</strong>
</h3>
<p>
  <br/>
</p>
<h2>Beispieloutput:</h2>
<p>
  <br/>
</p>
```
➜  WordPress git:(VeryOld) ✗ vendor/phpstan/phpstan/phpstan analyze .            
Note: Using configuration file /home/eric/Downloads/WordPress/phpstan.neon.
 2392/2392 [▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓] 100%

 ------ -------------------------------------------------------------------- 
  Line   wp-includes/class-json.php                                          
 ------ -------------------------------------------------------------------- 
         Reflection error: PEAR_Error not found.                             
          Learn more at https://phpstan.org/user-guide/discovering-symbols  
 ------ -------------------------------------------------------------------- 

 ------ -------------------------------------------------------------------- 
  Line   wp-includes/class-wp-customize-control.php                          
 ------ -------------------------------------------------------------------- 
  245    Access to deprecated property $json of class WP_Customize_Control:  
         It is better to just call the json() method                         
  247    Access to deprecated property $json of class WP_Customize_Control:  
         It is better to just call the json() method                         
  250    Access to deprecated property $json of class WP_Customize_Control:  
         It is better to just call the json() method                         
  251    Access to deprecated property $json of class WP_Customize_Control:  
         It is better to just call the json() method                         
  252    Access to deprecated property $json of class WP_Customize_Control:  
         It is better to just call the json() method                         
  253    Access to deprecated property $json of class WP_Customize_Control:  
         It is better to just call the json() method                         
  254    Access to deprecated property $json of class WP_Customize_Control:  
         It is better to just call the json() method                         
  255    Access to deprecated property $json of class WP_Customize_Control:  
         It is better to just call the json() method                         
  256    Access to deprecated property $json of class WP_Customize_Control:  
         It is better to just call the json() method                         
  257    Access to deprecated property $json of class WP_Customize_Control:  
         It is better to just call the json() method                         
  269    Access to deprecated property $json of class WP_Customize_Control:  
         It is better to just call the json() method                         
  598    Access to deprecated property $json of class WP_Customize_Control:  
         It is better to just call the json() method                         
  599    Access to deprecated property $json of class WP_Customize_Control:  
         It is better to just call the json() method                         
  717    Access to deprecated property $json of class WP_Customize_Control:  
         It is better to just call the json() method                         
  718    Access to deprecated property $json of class WP_Customize_Control:  
         It is better to just call the json() method                         
  741    Access to deprecated property $json of class WP_Customize_Control:  
         It is better to just call the json() method                         
  746    Access to deprecated property $json of class WP_Customize_Control:  
         It is better to just call the json() method                         
  746    Access to deprecated property $json of class WP_Customize_Control:  
         It is better to just call the json() method                         
  748    Access to deprecated property $json of class WP_Customize_Control:  
         It is better to just call the json() method                         
  879    Access to deprecated property $json of class WP_Customize_Control:  
         It is better to just call the json() method                         
  1227   Access to deprecated property $json of class WP_Customize_Control:  
         It is better to just call the json() method                         
  1305   Access to deprecated property $json of class WP_Customize_Control:  
         It is better to just call the json() method                         
  1345   Access to deprecated property $json of class WP_Customize_Control:  
         It is better to just call the json() method                         
 ------ -------------------------------------------------------------------- 

 -- ------------------------------------------------------------------------------------------------------------------------ 
     Error                                                                                                                   
 -- ------------------------------------------------------------------------------------------------------------------------ 
     Reached internal errors count limit of 50, exiting...                                                                   
     Internal error: Child process timed out after 60.0 seconds. Try making it longer with parallel.processTimeout setting.  
 -- ------------------------------------------------------------------------------------------------------------------------ 

                                                                                                                        
 [ERROR] Found 26 errors                                                                                                
```
