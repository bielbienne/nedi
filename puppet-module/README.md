nedi
====

Overview
--------
The nedi module allows you to manage your NeDi application.

Module Description
------------------
NeDi can discover your network on a regular basis. It allows you to locate and track all
connected devices, monitor traffic or broadcasts, send mails or SMS when certain events occur and backup the configuration of your switches & routers in addition. It even lets you observe the printer supplies! - [*Remo Rickli*](mailto:rickli@nedi.ch)

Setup
-----
Because this recepie is still in a alpha, you need to extract and initialize NeDi by yourself. Just extract the tarball in the files directory to */usr/local/nedi*. It is strongly recommended that you read the documentation of NeDI **BEFORE** you run NeDI for the first time.
The application part, of NeDi will be found in */usr/local/nedi*. The home directory and  all varying files of NeDi are located in */var/nedi*. The puppet recipie creates all the necessary symlinks.
This manifest also copies a crontab example into */var/nedi/crontab*. There are just a few examples how you could run NeDi regularly. There are also some examples in the folder "files", which you can just copy to your server or modify to your needs.

Roadmap
-------
* Installing NeDI within the recpie
* Managin nedi.conf by templates
* Manage crontab

Contributors
------------
Module is in development by City of Biel.

###License
This puppet module is part of free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.
