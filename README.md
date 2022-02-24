# The Ultimate MySQL Bootcamp

Started from July 9th 2021

Go to your IDE dashboard, [here](https://ide.goorm.io/my/dashboard), this is where you will create and manage your containers. Please bookmark this page, you will use it often.

Command to start the server: `mysql-ctl start` `mysql-ctl cli`
Exit sql: `exit`

`SHOW DATABASES`
`USE Database`
`SHOW TABLES`

Very good resource for understanding basic concepts: 
https://dataschool.com/how-to-teach-people-sql/introduction/

Use this for faker package: https://github.com/faker-js/faker 

Mysql package doc: https://github.com/mysqljs/mysql

Express for web application: https://expressjs.com/

# Setting up Node JS with Goorm.io

- If you followed the [signup and setup instructions](https://gist.github.com/nax3t/2773378c4d1bada8d66d12f4d5210248) from [lecture 12](https://www.udemy.com/course/the-ultimate-mysql-bootcamp-go-from-sql-beginner-to-expert/learn/lecture/7061932#overview), then you should already have Node JS installed in your Goorm.io container. If the following steps do not work for you, then please revisit the instructions linked above and use them to create a new Node JS container.
- To ensure that Node JS is installed, first run (open) your container and click inside of the terminal window (where it says `root@goorm:/workspace/your-container-name#`) then type `node -v` and press enter/return. You should get back something like `v10.16.3`, the number is not important, as long as you get back a version number then you know Node is properly installed.
- Now let's create a new javascript file and run it with the node command.
	- Click `FILE > New > New File` from the top menu, then input the File Name as `app.js` and click "OK".
	- The newly created file should open automatically, now click inside of the code editor (open file) where it says "Code goes here..." and type the following `console.log('Hello, world!');` then click `FILE > Save` from the top menu.
	- Return to your terminal window (where it says `root@goorm:/workspace/your-container-name#`) and click inside of that window so the cursor begins blinking.
		- If your terminal path reads anything other than `/workspace/your-container-name` then be sure to change directories with the `cd /workspace/your-container-name` command. **Note:** *your-container-name* will be whatever you named your container, e.g., I named mine *mysql*
	- Run the following command: `node app.js`. The terminal should output **Hello, world!**
	- If you got the proper output from the terminal then you have successfully created and run a Node JS file.

# Extending the final project

- Use Faker pacakge to generate random pet and owner information
- Create two tables:
	- owner: id, firstname, gender, jobtitle, city, petid
	- pet: cat types, ownerid, age
- Purposes (visitors can see):
	- for this gender, jobtitle, city, what is 5 most common cat types
	- for this cat types, what is the most common gender, jobtitle, city
	- users can type in their cats and personal information into the website
