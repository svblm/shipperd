![logo](https://www.dropbox.com/meta_dl/eyJzdWJfcGF0aCI6ICIiLCAidGVzdF9saW5rIjogZmFsc2UsICJzZXJ2ZXIiOiAiZGwuZHJvcGJveHVzZXJjb250ZW50LmNvbSIsICJpdGVtX2lkIjogbnVsbCwgImlzX2RpciI6IGZhbHNlLCAidGtleSI6ICJleW5ya3JtNTZqdnpqbDcifQ/AAGRa3bGdrXq-ER0rX4ujfhWdXMXYc1tc21-2XjtiJNh0Q)
Shipperd ![build status](https://travis-ci.org/svblm/shipperd.svg?branch=master)
-----

*Wrangle your game assets with dropbox.*

**Currently in development**

#### Intro

Shipperd is an asset wrangling service. Say you work on a game development team for example, this is how you would use it:

1. You (the project manager) would create an account.
2. After signing in you will create a project (in this case, it's your games title)
3. Shipperd prompts you to link your account to dropbox.
4. After you've created your project, you can start inviting your team members to it (via email address, for example)
5. Jim, your team member, joins your project.
6. Jim has made a really cool 3D model, and he wants to get your opinion on it.
7. Jim creates an asset under your project, he uploads his .fbx file, and texture .pngs to Shipperd
8. Shipperd copies those files to dropbox under /apps/shippered/PROJECT/ASSET/ and creates a page for that asset
9. You want to review Jim's asset, so you go to his asset page.
10. On the asset page, Jim has uploaded a render of his model for a first glance.
11. You click a link and download the model (or sync his project folder under your dropbox)
12. After reviewing you decide that it needs some changes
13. You leave some comments on Jim's asset.
14. Jim updates his asset with the changes you suggested.
15. You take another look, much better! You tell Jim to ship it.
16. Jim clicks the ship button on his asset and it goes from being staged to being shipped.

TL;DR Shipperd guides you along the review process, helping your team colaborate and maintain high quality assets.

#### Getting up and running

1. Clone this repo -> `$ git clone git@github.com:svblm/shipperd`
2. Install the dependencies -> `$ bundle install`
3. run the tests -> `bundle exec rake`
4. run the server -> `bundle exec rails server`

#### Dropbox integration

In development, you will need to integrate with dropbox to use the whole application. The two enviroment variables you will need to set are:

```Bash
export $SHIPPERD_APP_TOKEN=your_app_token
export $SHIPPERD_APP_SECRET=your_app_secret
```

Create your own app here: https://www.dropbox.com/developers/apps, and use your own app token and secret if you want to develop for the dropbox application.

#### Collaborating

I am actively accepting pull requests! please [fork](/svblm/shipperd/fork) and send me a pull request if you need or want to implement a feature. If you need a rails run down, look at the guides [here](http://guides.rubyonrails.org/).

Looking for something to do? The issues on this repository are a good place to start.

Message me on twitter (@JakeCataford) if you have any questions or concerns.

