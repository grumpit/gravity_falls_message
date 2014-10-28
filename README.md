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
- `key:` A `String`. Characters other than `/[a-zA-Z]/` are ignored.
- `shift:` An `Integer` representing the number of characters to shift. Defaults to 3. 

### Decoding Messages

```console
# decode a message using the A1Z26 cipher
> message = "20-15 2-5 3-15-14-20-9-14-21-5-4..."
=> "20-15 2-5 3-15-14-20-9-14-21-5-4..."
> GravityFallsMessage.decode(message, 'a1z26')
=> "TO BE CONTINUED..."

# decode a message using the atbash cipher
> message = "MLG S.T. DVOOH ZKKILEVW."
=> "MLG S.T. DVOOH ZKKILEVW."
> GravityFallsMessage.decode(message, 'atbash')
=> "NOT H.G. WELLS APPROVED."

# decode a message using binary
> message = "0101001101001000010011110101001001010100"
=> "0101001101001000010011110101001001010100"
> GravityFallsMessage.decode(message, 'binary')
=> "SHORT"

# decode a message using the caesar cipher
> message = "ZHOFRPH WR JUDYLWB IDOOV."
=> "ZHOFRPH WR JUDYLWB IDOOV."
> GravityFallsMessage.decode(message, 'caesar')
=> "WELCOME TO GRAVITY FALLS."

# decode a message using the caesar cipher with a specified shift
> message = "YMNX NX F RTWJ HTRUQNHFYJI YJXY"
=> "YMNX NX F RTWJ HTRUQNHFYJI YJXY"
> GravityFallsMessage.decode(message, 'caesar', shift: 5)
=> "THIS IS A MORE COMPLICATED TEST"

# decode a message using the vigenere cipher
> message = "NLMXQWWN IIZ LZFNF"
=> "NLMXQWWN IIZ LZFNF"
> GravityFallsMessage.decode(message, 'vigenere', key: 'WHATEVS')
=> "REMEMBER BIG HENRY"
```

### Encoding Messages

```console
# encode a message using the A1Z26 cipher
> message = "TO BE CONTINUED..."
=> "TO BE CONTINUED..."
> GravityFallsMessage.encode(message, 'a1z26')
=> "20-15 2-5 3-15-14-20-9-14-21-5-4..."

# encode a message using the atbash cipher
> message = "NOT H.G. WELLS APPROVED."
=> "NOT H.G. WELLS APPROVED."
> GravityFallsMessage.encode(message, 'atbash')
=> "MLG S.T. DVOOH ZKKILEVW."

# encode a message using binary
> message = "SHORT"
=> "SHORT"
> GravityFallsMessage.encode(message, 'binary')
=> "0101001101001000010011110101001001010100"

# encode a message using the caesar cipher
> message = "WELCOME TO GRAVITY FALLS."
=> "WELCOME TO GRAVITY FALLS."
> GravityFallsMessage.encode(message, 'caesar')
=> "ZHOFRPH WR JUDYLWB IDOOV."

# encode a message using the caesar cipher with a specified shift
> message = "THIS IS A MORE COMPLICATED TEST"
=> "THIS IS A MORE COMPLICATED TEST"
> GravityFallsMessage.encode(message, 'caesar', shift: 5)
=> "YMNX NX F RTWJ HTRUQNHFYJI YJXY"

# encode a message using the vigenere cipher
> message = "REMEMBER BIG HENRY"
=> "REMEMBER BIG HENRY"
> GravityFallsMessage.encode(message, 'vigenere', key: 'WHATEVS')
=> "NLMXQWWN IIZ LZFNF"
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/gravity_falls_message/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
