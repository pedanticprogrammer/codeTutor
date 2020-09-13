# codeTutor
Senior Software Project

This project requires the use of a database, and has only been tested with postgresql.
A dump is available to be imported into a preexisitng database.

The .env file contains sensitive information and is not included and must be manually added to the code/container.
It requires these variables:
  - DATABASE_URL in the form of "postgresql://{user}:{password}@{url}:{port}/{database}"
  - SESSION_SECRET
  - SECRET

The project must be hosted at the root of a server. It does not support being hosted in a subfolder.
