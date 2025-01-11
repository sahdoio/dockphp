# Lesson Challenge 01

## Setting Up a Project  
Set up the project in the `./src` folder.

To run the project:
```sh
docker compose up -d
```

To execute a command in the container:
```sh
docker compose exec dockphp [your command here]
```

Record the information in a `details.txt` file:

1. Identify the PHP and Zend Engine version.
2. List the installed extensions.
3. Locate the `php.ini` file inside the container.
4. Replace the internal `php.ini` file with a new one using a volume.
5. Set the default PHP timezone to `America/Sao_Paulo`.
6. Increase the PHP memory limit to 512MB.
7. Fix the project display error.

## Personal Challenge (Not to be Submitted)
1. Find out the version of the `pdo_sqlite` extension.
2. Compile PHP using the process demonstrated in class.

Two suggestions:
- Create a Docker Ubuntu image and compile as shown in class.
- Create a VM (using VirtualBox) and compile PHP in the system.

Note: The steps are outlined in the [README](README.md).

## Happy Learning!


---

## Developer Notes

I found the following error:

![img.png](docs/img.png)

The code was indeed retrieving the wrong value:

![img_1.png](docs/img_1.png)

I fixed the error by changing the `index.php` file:

![img_3.png](docs/img_3.png)

The code now retrieves the correct value:'

![img_2.png](docs/img_2.png)
