# Project - Linux Server Configuration
### Udacity Full Stack Nano Degree - Project #5  

## About
This is the second part of a catalog application.  This part required reconfiguration to use postgresql or another client server database, and then publish the application to a cloud server.  I choose publishing on Amazon lightsail hosting service.  

## Server Info
In order to access this application use the following:

http://54.201.16.71<br>or<br>http://jc.is-found.org/

SSH: Port number 2200, IP: 54.201.16.71

## About the application
This project publishes an application catalog containing categories and associated items. The application provides two methods provide authentication.  The first method is through a third-party provider.  The second method is by way of a simple user + password local method.  The third-party authentication used is by way of google.  

Any user can view categories and items; however, to add, modify, or delete, the user must be authenticated.  Also, to modify or delete a category, the user must be the owner/creator of the item.  

Some of the technologies used in this application include:
* Flask 
* Bootsrap
* Jinja2
* Postgres SQL

## Prerequisites
In order to install and execute, download or install the following:
* [Virtual Box](https://www.virtualbox.org/wiki/Downloads)
* [Install vagrant](https://www.vagrantup.com/)
* [Clone this repository](https://github.com/jcarter62/udacity-project5.git)
* [Amazon Lightsail](https://aws.amazon.com/lightsail/)

## Installing - Vagrant Environment
* Clone the repository listed above
* open a command line and change current directory to where you cloned the repository.
* perform _vagrant up_, and wait for a command prompt to return.
* perform _vagrant ssh_
* cd /vagrant/catalog
* execute _python app.py_
* open browser, and visit [http://localhost:8000](http://localhost:8000)
* if first time running, login in order to add categories or items.

## Installing - Amazon lightsail
* Create ubuntu 16.04 instance.
* Login via ssh
* clone the repository into a folder owned by user: ubuntu or another.
* Execute the script found in repository/sys-config/aws/install_script, in order to install required components.
* Modify apache2 configuration, using examples in repository/sys-config/apache.<br>* Add variable to envvars<br>* Modify 000-default.conf
* Create database named catalog, along with 3 tables described in the script /repository/create_tables.sql.
* Create user named: appuser with password: <some password>
* Update the connection string in repository/models.py with the password above.
* Grant access for this new user to the tables and related objects.
* Restart VM 

## Walkthrough Images

Startup<br>
Notice no add category or item buttons, because user is not logged in.
<img src="images/0-startup.png">

Login
<img src="images/1-login.png">

Google Auth dialog if user chooses google login method.
<img src="images/2-google-auth.png">

Home/Startup dialog after login completed.  Notice the buttons available and the user's name and image.
<img src="images/3-home-after-login.png">

Add Category
<img src="images/4-add-category.png">

Add Item1
<img src="images/5-add-item1.png">

Add Item2
<img src="images/5-add-item2.png">

Item List
<img src="images/6-item-list.png">

Logout Dialog
<img src="images/7-logout.png">

Item Modification Limit when user is not logged in
<img src="images/8-item-modification-limit.png">

Item Edit Dialog
<img src="images/9-item-edit.png">

Item Save Dialog
<img src="images/A-item-save.png">

Item Delete Dialog
<img src="images/B-item-delete.png">

## Available API calls
There are 3 main api endpoints available to users.
- /api/v1/catalog: <br>This returns a list of categories and associated items.
- /api/v1/categories <br>This returns a list of all categories.  
- /api/v1/categories/**category-name** <br>Returns one category where name=**category-name** record if found.
- /api/v1/items<br>Returns a list of all items in database.
- /api/v1/items/**item-id**<br>Returns one item record where item id=**item-id**.


## Resources
- [Flask Information](https://www.tutorialspoint.com/flask/index.htm)
- [Templates](https://www.tutorialspoint.com/flask/flask_templates.htm)
- [Bootstrap](https://getbootstrap.com/docs/4.3/content/tables/#contextual-classes)
- [PyCharm](#pycharm)
- [Lightsail](https://aws.amazon.com/lightsail/)
- [Postgres](https://planet.postgresql.org/)


## Authors
Jim Carter

## License
This project is licensed under the MIT License

