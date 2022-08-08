# Managing Sneat Bootstrap Template

This application is built to use a Bootstrap 5 HTML template called `Sneat`.  This document describes how to manage
template upgrades and customization.

All the template files are stored in the directory `<project_root>/vendor/assets/sneat-bootstrap`.  It's important
to note that the build system configuration is managed in the file `build-config.js`.  If you update the template,
you will want to copy the build configuration file so it isn't overwritten.

## Setting up your Development Environment

Be sure to follow the setup instructions in the `README.md` file included in the root directory of this project.
The last step is to install all the components required by the template:

    $ npm run build --env=development

This command will compile all the required assets and place them in the `app/assets/vendor` directory.  By separating
the concerns in this manner, maintenance of the template will be easier and require less refactoring in the future.

The directory structure of the assets pipeline directory is as follows:

    app/
      assets/
        vendor/
          css/
          fonts/
          js/
          libs/

The contents of these directories will be managed by the template builder.