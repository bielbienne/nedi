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
To install this recipie, copy the whole puppet-module folder into your modules folder in you Puppet environment. It will setup the folder structure for nedi, create a user for NeDi, create a virtual host and manages the crontab for the user nedi.
It is highly recommended that you read the documentation of NeDi **BEFORE** you use this recipie. Since it is still in an early development statium, there can occur several erros. If you expirience something unexpected, please let us know, so we can fix it.
You need initialize NeDi by yourself, since there are a few parameters, which aren't implemented into this recipie yet. The application part, of NeDi will be found in */usr/local/nedi*. The home directory and  all varying files of NeDi are located in */var/nedi*. The puppet recipie creates all the necessary symlinks.

Roadmap
-------
* Initializing NeDi within the recipie


Contributors
------------
Module is in development by City of Biel.

###License
This puppet module is part of free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.
