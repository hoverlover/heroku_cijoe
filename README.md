# Heroku CI Joe: Run CI Joe on Heroku!

I <3 [CI Joe](https://github.com/defunkt/cijoe)!  But CI Joe uses conventions that don't jive with [Heroku](http://www.heroku.com), like:

* git config variables
* git hooks

Heroku CI Joe attempts to solve these problems so you can run the
awesome goodness of CI Joe on the raddest platform out there!

## Additional Features
Along with the features provided by CI Joe, you also get:

* Twitter integration - Tweet your build results
* Automatic shortening of URLs in the build messages using [Bit.ly](http://bit.ly)

If you would like to have additional notification methods or features available, feel free to
fork and contribute!  The ci-joe fork that actually does all the work is
located [here](https://github.com/hoverlover/cijoe).

## Quickstart
1. Clone me
2. Deploy to Heroku
3. Configure
4. Push some commits to your git repo
5. Let the buildin' begin

## Configuration
CI Joe reads it's configuration from git config.  This, of course, won't
work on Heroku.  Heroku CI Joe gets around this hurdle by using Heroku
config variables.  For example the CI Joe config variable `cijoe.runner`
can be configured for Heroku CI Joe by executing the folowing using the
heroku command:

    heroku config:add cijoe_runner=rake spec

Notice how "." is replace by "\_" in the config variables.  Any CI Joe
config variable can be used in Heroku CI Joe.  Simply replace the "."
with "_".  The following sections outline the configuration variables
that are available.

### Twitter
To tweet your build results, you will need a Twitter account, of course.
Also, you will need to [register](http://dev.twitter.com/apps) the build server
as a Twitter application.  Once the registration is complete you will
need to set the following configuration variables:

* `twitter_consumer_key`
* `twitter_consumer_secret`
* `twitter_oauth_token`
* `twitter_oauth_token_secret`

### Bit.ly
You can use [Bit.ly](http://bit.ly) to automatically shorten the URLs in
the build messages.  You will need a Bit.ly account.  Once you have an
account, set the following configuration variables:

* `bitly_api_key`
* `bitly_user_name`

### CI Joe
* `cijoe_buildallfile` - see the [CI Joe README](https://github.com/defunkt/cijoe/blob/master/README.md) for this variable
* `cijoe_runner` - see the [CI Joe README](https://github.com/defunkt/cijoe/blob/master/README.md) for this variable
* `cijoe_ci_server_url` - this is the URL for your deployed instance of
  Heroku CI Joe (used in the build status message)
* `cijoe_git_url` - this is the URL to your git repository
* `cijoe_user` - HTTP basic auth user for Heroku CI Joe
* `cijoe_pass` - HTTP basic auth password for Heroku CI Joe

## Caveats
Heroku's platform is, for the most part, a [read-only filesystem](http://docs.heroku.com/constraints#read-only-filesystem).  Heroku CI Joe writes builds to the `./tmp` directory.  This means that after a build is performed, the results may or may not be available to review.  If you immediately go look at the results after a build notification, I've noticed that they are generally available.  If you wait for very long after the build is complete, they usually are not available.

## Future Features

* Writing builds to Amazon S3, or some other endpoint
* Configurable build message format
