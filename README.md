# Artoo Adaptor For Sphero

This repository contains the Artoo (http://artoo.io/) adaptor for the Neurosky Mindwave Mobile EEG (http://store.neurosky.com/products/mindwave-mobile).

Artoo is a open source framework for robotics using Ruby.

For more information abut Artoo, check out our repo at https://github.com/hybridgroup/artoo

[![Code Climate](https://codeclimate.com/github/hybridgroup/artoo-neurosky.png)](https://codeclimate.com/github/hybridgroup/artoo-neurosky) [![Build Status](https://travis-ci.org/hybridgroup/artoo-neurosky.png?branch=master)](https://travis-ci.org/hybridgroup/artoo-neurosky)

## Installing

```
gem install artoo-neurosky
```

Afterwards you need to install `socat` - for this please run the following command (works on both OSX and Linux):

```
artoo install socat
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
- Use a socket to serial connection to map a TCP socket to the local unix port
- Connect to the device via Artoo

First pair your computer and Mindwave. You might be prompted for a passcode, if so enter '0000'.

Once paired, use the `artoo connect scan` command to find out your connection info:

```
$ artoo connect scan
```

Now you are ready to connect to the Mindwave using the socket, in this example port 4567:

```
artoo connect serial /dev/rfcomm0 4567
```

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

Now you are ready to connect to the Sphero using the socket, in this example port 4567:

```
artoo connect serial /dev/rfcomm0 4567
```

### Windows

We are currently working with the Celluloid team to add Windows support. Please check back soon!
