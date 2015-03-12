Party of 4
====
This project is for jumpstarting Client and Citizen projects under the included MIT license. Feel free to license the client project or your own project as you see fit.

There is not intent to make this a public project. But consider it sour dough for for friends, family, and clients.

Local development setup
=========================================

1. Install [Postgres.app](http://postgresapp.com).
1. Install this project's gems by running:

               bundle

   a. If the "pg" gem fails to install on OS X, try running `env ARCHFLAGS="-arch x86_64" bundle` instead. Or better yet, switch to Docker (see below)

1. Initialize the app's database:

               rake db:setup

1. Install foreman:

    gem install foreman

1. Launch the server with `foreman start` and see it running at http://localhost:3000

1. To run tests, see Tools section below.

Heroku setup
============

1. Create the Heroku app:

		heroku apps:create my-app-name

   Or if it's already created, add the git remote to your local repository like this:

		git remote add heroku git@heroku.com:my-app-name.git

1. Set the host name to use when generating URLs in e-mails:

		heroku config:set ACTION_MAILER_HOST='your-app.herokuapp.com'

1. Turn on Postmark for SMTP mail:

		heroku addons:add postmark

1. Run this command and click on "Sender Signatures" at the top of the web page that opens:

		heroku addons:open postmark

1. Confirm an e-mail address to use for sending. Also set up DKIM for that sender if you are brave. (It involves editing DNS records for the sender's e-mail domain.)

1. Test e-mail by sending an e-mail to the address you configured in the last steps:

		heroku run console
		
		m = "registred_email_from_last_step"; ActionMailer::Base.mail(from:m, to:m, subject: Time.now.to_s, body: rand.to_s).deliver

1. Eventually, remove everyone from `config/automatically_admins.yml`. After a few admins exist, you should use the admin tools to grant new accounts admin permissions.

1. Exception notification is done through Airbrake:
    1. As an admin with payment configured, setup Airbrake on Heroku. This will add the heroku environment variable:

            heroku addons:add airbrake

  	1. All exceptions are sent by email:
    	* By default to the email group associated with the heroku account that owns the project. **For example**: `accounts+heroku@citizencode.io`
    	* This should be changed to the Citizen Code error account with a email alias for filtering by project: `errorhound+PROJECT_NAME@citizencode.io`
    	* You might have to accept a mailchimp "Newsletter Subscription" (!!?!?!) to receive airbrake notifications.
    
  	1. To view exceptions on the web, visit:
    	* https://addons-sso.heroku.com/apps/YOUR_APP_NAME/addons/airbrake
           Example: [citizen-rails-template airbrake](https://addons-sso.heroku.com/apps/citizen-rails-template/addons/airbrake)
  	1. To create a fake error for testing the system:
  	
            heroku run rake airbrake:test

1. Set up [daily backups](https://devcenter.heroku.com/articles/pgbackups) of a
   production Heroku database.

Tools
=====

Development
-----------

Run tests

    bin/spec

Run more thorough tests (with `render_views` turned on, as coverage for templates)

    bin/spect

Run thorough tests and deploy

    bin/shipit

Production
----------

[Rollback](https://devcenter.heroku.com/articles/heroku-postgres-rollback) a
production Heroku database to a prior state.  Hobby dbs do not have rollback,
Standard dbs can be rolled back to any time in the last day (in increments of 1
minute), and Premium dbs any time in the last week.

If you have [daily backups set
up](https://devcenter.heroku.com/articles/pgbackups) you can restore them.

References
==========

* [Configuring Rails for Heroku](https://devcenter.heroku.com/articles/getting-started-with-rails4)
* [Setting up Postgres on Heroku](https://devcenter.heroku.com/articles/heroku-postgresql)
