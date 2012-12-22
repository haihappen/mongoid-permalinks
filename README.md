# mongoid-permalink

Mongoid::Permalink adds a permalink based on your document `to_s` method.

## Installation

In your Gemfile:

```ruby
gem 'mongoid-permalink', github: 'haihappen/mongoid-permalink'
```

You have to use the GitHub branch for now, because [http://rubygems.org/gems/mongoid-permalink](http://rubygems.org/gems/mongoid-permalink) is occupied at the moment. ([Help me to get the repo!](https://github.com/jgwmaxwell/mongoid-permalink/issues/1))

## Usage

```ruby
class Document
  include Mongoid::Document
  include Mongoid::Permalink
  
  field :name, type: String
  
  alias_method :to_s, :name
end
```

```ruby
document = Document.create(name: 'Mongoid::Permalink is awesome')
document.permalink # => 'mongoid-permalink-is-awesome'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

(The MIT license)

Copyright (c) 2012 Mario Uher

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.