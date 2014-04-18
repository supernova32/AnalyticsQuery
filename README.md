# Simple Analytics Filter

This is a small Rails application that serves as
both front-end and back-end to a filtering system
that reads analytics data from a MongoDB Database.

## Installation

Clone the repository to your machine and
load your local MongoDB with the dump data.

    $ mongorestore --port 27017 /path/to/dump/file

Once you have the database ready, you can start the
rails server with:

    $ rails s

After that, just point your browser to `http://localhost:3000`
and you should see the empty filters. You can add
as many filtering options as you like. Once you are
ready, press `Go!` and the results should be loaded
to the table below.
