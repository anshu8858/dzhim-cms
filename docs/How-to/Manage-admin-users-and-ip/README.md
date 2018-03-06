### / [dzhim-cms](./../../../) / [docs](./../../) / [How-to](./../) / [Manage admins users and IP](./)

-----------------------------------------------------------------------------------

# Manage admin users

![image](images/login.png)

## How can I access the admin panel for the first time?

* Go to the [Login page](http://dzhim-cms.local/admin/).
* Email: admin@dzhim-cms.local
* Password: admin

## Update an existing user

* Find the user in the list and click on it.

![image](images/Users.png)

* Change the data and click on the save button (piggy).

![image](images/Edit-user.png)

## Create a new user

* Click on the '+' button in the user list.

![image](images/Add-user.png)

* Fill the required data.

![image](images/New-user.png)

* User will be added to the list after a successful save.

![image](images/Users-2.png)

## My user was blocked. What to do?

![image](images/incorrect-attempt.png)

5 incorrect attempts will block the user

![image](images/blocked.png)

If You can, log-in with another admin account and go to the 'Users', find the blocked account,
change the status, save.
If You don't have another account, log into Your database and go to the `dzhim__usr` table,
find the blocked account, change the status to 'active'.

![image](images/usr-status-tab.png)

## How to allow another IP?

I haven't created an admin interface for this yet, so You need to add a record to the `dzhim_ip` table.

![image](images/ip-tab.png)
