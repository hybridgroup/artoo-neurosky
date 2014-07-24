# Artoo Adaptor For Neurosky Mindwave

This repository contains the Artoo (http://artoo.io/) adaptor for the Neurosky Mindwave Mobile EEG (http://store.neurosky.com/products/mindwave-mobile).

Artoo is a open source framework for robotics using Ruby.

For more information abut Artoo, check out our repo at https://github.com/hybridgroup/artoo

[![Code Climate](https://codeclimate.com/github/hybridgroup/artoo-neurosky.png)](https://codeclimate.com/github/hybridgroup/artoo-neurosky) [![Build Status](https://travis-ci.org/hybridgroup/artoo-neurosky.png?branch=master)](https://travis-ci.org/hybridgroup/artoo-neurosky)

## Installing

```
gem install artoo-neurosky
```

## Using

```ruby
require 'artoo'

connection :neurosky, :adaptor => :neurosky, :port => '/dev/rfcomm0'
device :neurosky, :driver => :neurosky, :interval => 0.1

def handle_eeg(sender, data)
  puts data
end

work do
  puts "Scanning..."
  on neurosky, :eeg => :handle_eeg
end
```

## Connecting to Mindwave

### OSX

The main steps are:
- Pair your computer and the Mindwave
- Connect to the device via Artoo

First pair your computer and Mindwave. You might be prompted for a passcode, if so enter '0000'.

Once paired, use the `artoo connect scan` command to find out your connection info:

```
$ artoo connect scan
```

Now you are ready to connect to the Mindwave using a serial connection.

### Ubuntu

The main steps are:
- Pair your computer and the Mindwave
- Map your device to a unix port
- Use a socket to serial connection to map a TCP socket to the local unix port
- Connect to the device via Artoo

First pair your computer and Mindwave. You might be prompted for a passcode, if so enter '0000'.

Once paired, use the `artoo connect scan` command to find out your connection info:

```
$ artoo connect scan
Scanning ...
  00:06:66:4A:14:99 Mindwave
```

Next, you need to bind the Mindawave to the system port. In the above example, /dev/rfcomm0. The easiest way to do this is to use the `artoo connect bind` command:

```
artoo connect bind 00:06:66:4A:14:99 /dev/rfcomm0
```

Now you are ready to connect to the Sphero using system port.

### Windows

We are currently working with the Celluloid team to add Windows support. Please check back soon!

## Documentation

Check out our [documentation](http://artoo.io/documentation/) for lots of information about how to use Artoo.

If you want to help us with some documentation on the site, you can go to [artoo.io branch](https://github.com/hybridgroup/artoo/tree/artoo.io) and then, follow the instructions.

## IRC

Need more help? Just want to say "Hello"? Come visit us on IRC freenode #artoo

## Contributing
* All active development is in the dev branch. New or updated features must be added to the dev branch. Hotfixes will be considered on the master branch in situations where it does not alter behaviour or features, only fixes a bug.
* All patches must be provided under the Apache 2.0 License
* Please use the -s option in git to "sign off" that the commit is your work and you are providing it under the Apache 2.0 License
* Submit a Github Pull Request to the appropriate branch and ideally discuss the changes with us in IRC.
* We will look at the patch, test it out, and give you feedback.
* Avoid doing minor whitespace changes, renamings, etc. along with merged content. These will be done by the maintainers from time to time but they can complicate merges and should be done seperately.
* Take care to maintain the existing coding style.
* Add unit tests for any new or changed functionality.
* All pull requests should be "fast forward"
  * If there are commits after yours use “git rebase -i <new_head_branch>”
  * If you have local changes you may need to use “git stash”
  * For git help see [progit](http://git-scm.com/book) which is an awesome (and free) book on git


(c) 2012-2014 The Hybrid Group
