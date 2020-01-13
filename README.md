I) Setup DB bpmspace_liam3_v1  
  1) bpmspace_liam3_v1_create.sql  
  2) bpmspace_liam3_v1_structur.sql  
  3) bpmspace_liam3_v1_statemachine.sql  
  4) bpmspace_liam3_v1_min.sql  
  5) bpmspace_liam3_v1_diff.sql  
  
II) CONFIG bpmspace_liam3_v1  
  1) cp config.EXAMPLE_SECRET.inc.php config.SECRET.inc.php  
  2) EXAMPLE CONFIG  

```<?php  
     // APMS Generated Project (2019-11-12 16:11:26)  
     // Version: https://github.com/BPMspaceUG/APMS2/tree/446cc441e6c8d38ca3b4ccdd585fcc89f1cb6dfd  
     // ==================================================  
     //-- Database  
     define('DB_USER', 'bpmspace_liam3_v1');  
     define('DB_PASS', 'exampledbpasswd');  
     define('DB_HOST', 'localhost');  
     define('DB_NAME', 'bpmspace_liam3_v1');  
     //-- Authentication + API  
     define('API_URL_LIAM', 'https://blabla.at:PORT/liam3_client/liam3_Client_login.php'); // URL from Authentication-Service -> returns a JWT-Token  
     define('AUTH_KEY', 'EXAMPLEKEY'); // Shared AuthKey which has to be known by the Authentication-Service  
```
III) LIAM-Client config  - ACHTUNG INC!!!!  
..1) cp liam3_Client_api.EXAMPLE_secret.inc.php liam3_Client_api.secret.inc.php  
..2) EXAMPLE CONFIG - create with iamdummy and  "m" "m" adn EXAMPLEKEY a token - authkey "EXAMPLEKEY" from II-2 - must be identical  

```<?php  
     	$url="https://blabla.at:PORT/liam3/api.php";  
     	$token = "CCC";  
     	define('LIAM3_URL', 'https://blabla.at:PORT/liam3_client/');  
```
