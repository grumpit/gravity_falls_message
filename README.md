# Gravity Falls Message

A gem to encode and decode messages using the ciphers as presented on Disney XD's show Gravity Falls. For more detailed information about the ciphers and how they are used, visit [the Gravity Falls Wiki cryptograms page](http://gravityfalls.wikia.com/wiki/List_of_cryptograms "Gravity Falls Wiki - List of cryptograms")

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gravity_falls'
```

Run the following command to install it:

```console
bundle install
```

## Supported Ciphers

This gem currently supports the following ciphers:

- A1Z26
- atbash
- binary
- caesar
- vigenere

## Usage

**Gravity Falls Message** has two methods, `decode` and `encode`. `GravityFallsMessage::Cipher` is where the work gets done, and defaults to decoding.

The `decode` and `encode` methods take the `message` to be decoded or encoded as the first argument, followed by the `cipher` to be used, and finally an `options` hash.

The `options` hash is only used for the Caesar and Vigenère ciphers. Since a Vigenère cipher is just a Caesar cipher whose shift is calculated from a key, the Vigenère cipher calls the Caesar cipher, passing in its `options` hash.

The A1Z26 cipher expects encoded messages to have the integer representation for each letter delimited by a `-` character, i.e. `14-5-24-20 21-16` is the representation of `NEXT UP`, where `N = 14`, `5 = E`, `24 = X`, etc.

### Valid Options for Caesar and Vigenère Ciphers

Options other than those listed here are ignored.

**Valid Options:**

- `encode:` When present or `true`, switches the Cipher so it encodes the message rather than decoding it.
- `key:` A `String`. Characters other than `/[a-zA-z]/` are ignored.
- `shift:` An `Integer` representing the number of characters to shift. Defaults to 3. Must be positive (for now). 

### Decoding Messages

```console
# decode a message using the A1Z26 cipher
> message = "20-15 2-5 3-15-14-20-9-14-21-5-4..."
=> "20-15 2-5 3-15-14-20-9-14-21-5-4..."
> GravityFallsMessage.decode(message, 'a1z26')
=> "TO BE CONTINUED..."
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/gravity_falls_message/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
