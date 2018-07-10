# PhotoDB

PhotoDB is an attempt to create a database for film photography that can be used to track
cameras, lenses, accessories, films, negatives and prints, to fully catalogue a collection of
photographic equipment as well as the pictures that are made with them.

PhotoDB can also write EXIF tags to scanned images taken with film cameras, so they appear in
your digital photo library with the correct metadata (time, date, focal length, geotag, etc).

At the moment, the PhotoDB project is unfinished and the code continues to change unpredictably.
Look for a tagged release in the future!

The heart of PhotoDB is the MySQL/MariaDB backend database schema. This is the most complete
part of the project and describes all the data that is recorded.

The application is a relatively new addition to the project. It is currently an interactive
command-line tool to make it easier to add and edit data in the database. It is not a graphical
interface or web application (but someone with the right enthusiasm and skills could use the
logic I've already written to make a basic graphical interface quite quickly).

The application is not yet feature-complete, so for now you may also need to edit parts of
the database directly. You can access the raw database using the MySQL command line, or by
using an application such as [MySQL Workbench](http://www.mysql.com/products/workbench/) or
[phpMyAdmin](http://www.phpmyadmin.net/home_page/index.php) to obtain a GUI for manipulating
the tables.

## Documentation

* [Installing PhotoDB](docs/INSTALL.md)
* [Using PhotoDB](docs/USAGE.md)
* [Developing PhotoDB](docs/CONTRIBUTING.md)
* [Schema description](docs/SCHEMA.md)
* [Glossary](docs/GLOSSARY.md)
