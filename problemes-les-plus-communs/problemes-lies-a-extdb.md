---
description: Guide de résolution des problèmes courants rencontrés avec extDB
---

# Problèmes liés à extDB



## Guide de résolution des problèmes liés à extDB2 <a id="bkmrk-page-title"></a>

**Résolution des problèmes courants** 

**Problème \#1**

> _Call extension 'extDB2' could not be found_

Si vous avez cette erreur dans vos logs RPT, 1

```text
Call extension 'extDB2' could not be found
```

Vous devez vérifier les éléments suivants : 

* **Assurez-vous** que le dossier `@extDB2` est bien présent à la racine de votre serveur.
* **Assurez-vous** que "extDB2" est bien présent dans vos options de lancement, comme ceci : 

1

```text
-mod="@life_server;@extDB2"
```

* **Assurez-vous** que votre dossier @extDB2 contient bien un sous dossier `/addons` qui contient un .pbo
* **Assurez-vous** d'avoir la librarie Windows `tbbmalloc.dll` la racine de votre serveur.

**Problème \#2**

> _extDB2: Problem with database connection_

Si vous avez cette erreur dans vos logs RPT,1

```text
extDB2: Problem with database connection
```

Vous devez vérifier les éléments suivants :

* **Assurez-vous** que votre fichier extdb-conf.ini situé dans votre dossier @extDB2 est bien configuré avec vos identifiants pour vous connecter à votre base de données.
* **Assurez-vous que cette ligne :**

1

```text
[MySQL_Example] ; <-- celle ci
```

2

```text
Type = MySQL
```

3

```text
Name = Database_Name
```

4

```text
​
```

5

```text
Username = root
```

6

```text
Password = password
```

7

```text
​
```

8

```text
IP = 127.0.0.1
```

9

```text
Port = 3306
```

10

```text
​
```

11

```text
;minSessions = 2
```

12

```text
idleTime = 60
```

13

```text
​
```

14

```text
compress = false
```

15

```text
; Really should only use this if MySQL server is external. Also only for MySQL
```

16

```text
​
```

17

```text
Secure Auth = true
```

18

```text
; Recommend you turn this on  http://dev.mysql.com/doc/refman/5.6/en/mysql-command-options.html#option_mysql_secure-auth
```

est bien modifiée comme ceci `[altislife]`  

* **Assurez-vous** que l'utilisateur utilisé a les permissions nécessaires pour se connecter à la base de données ET que vous pouvez vous connecter en local / distant avec ce dernier.



## Guide de résolution des problèmes liés à extDB3 <a id="bkmrk-page-title"></a>

**Résolution des problèmes courants** 

**Problème \#1** 

> _Call extension 'extDB3' could not be found_

Si vous avez cette erreur dans vos logs RPT, 1

```text
Call extension 'extDB3' could not be found
```

Vous devez vérifiez les éléments suivants : 

* **Assurez-vous** que le dossier `@extDB3` est bien présent à la racine de votre serveur.
* **Assurez-vous** que "extDB3" est bien présent dans vos options de lancement, comme ceci : 

1

```text
-mod="@life_server;@extDB3"
```

* **Assurez-vous** que votre dossier @extDB3 contient bien un sous dossier `/addons` qui contient un .pbo
* **Assurez-vous** d'avoir les 2 libraries Windows `tbbmalloc.dll` et `tbbmalloc_x64.dll` à la racine de votre serveur

**Problème \#2**

> _extDB2: Problem with database connection_

Si vous avez cette erreur dans vos logs RPT,1

```text
extDB2: Problem with database connection
```

Vous devez vérifier les éléments suivants :

* **Assurez-vous** que votre fichier extdb-conf.ini situé dans votre dossier @extDB3 est bien configuré avec vos identifiants pour vous connecter à votre base de données.
* **Assurez-vous que cette ligne :**

1

```text
[Main]
```

2

```text
Version = 1
```

3

```text
​
```

4

```text
Randomize Config File = false
```

5

```text
;; Randomizes Config File after loading.
```

6

```text
;;   Recommend to turn on, if you have enabled filepatching on arma.
```

7

```text
​
```

8

```text
Allow Reset = false
```

9

```text
;; Allows 9:RESET, usefull for development work
```

10

```text
​
```

11

```text
Thread = 0;
```

12

```text
;; Option to force number of worker threads for extDB3.
```

13

```text
;;   Auto = 0, Min = 2, Max = 6
```

14

```text
​
```

15

```text
[Log]
```

16

```text
Flush = true;
```

17

```text
;; Flush logfile after each update.
```

18

```text
;;    Option really only usefull if running DEBUG BUILD
```

19

```text
​
```

20

```text
​
```

21

```text
[Database] <---- Cette ligne
```

22

```text
IP = 127.0.0.1
```

23

```text
Port = 3306
```

24

```text
Username = changeme
```

25

```text
Password =  changeme
```

26

```text
Database = changeme
```

est bien modifiée comme ceci `[altislife]`  

* **Assurez-vous** que l'utilisateur utilisé a les permissions nécessaires pour se connecter à la base de données ET que vous pouvez vous connecter en local / distant avec ce dernier.

