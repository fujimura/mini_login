# token_attribute [<img src="https://secure.travis-ci.org/fujimura/token_attribute.png"/>](http://travis-ci.org/fujimura/token_attribute)

Small macro to define unique random token generator for ActiveRecord.

## How to Use

```ruby

## Basic

class ApplicationController < ActionController::Base
  include Login

  # Login#login! creates current_user, otherwise raises Login::Unauthorized
  def login_required
    login! current_user
  end

  # If not logged in, redirect to login form
  rescue_from Login::Unauthorized do
    redirect_to new_session_path
  end
end

class SessionController
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      login! user # Login as found and authenticated user
    else
      render :new # Authenticate again
    end
  end
end

## Install

```
gem 'mini_login', :git => 'git://github.com/fujimura/mini_login.git'
```

## Supported Versions

Ruby 1.9.2

Rails 3.1.x and maybe Rails 3.0.x

## Motivation

[letmein](https://github.com/GBH/letmein) is small and beautiful piece.

But with Rails 3.1.x, which came with SecurePassword, login solution could be more minimalistic.



## Copyright

(The MIT License)

Copyright © 2011 Fujimura Daisuke

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
