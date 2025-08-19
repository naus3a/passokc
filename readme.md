# passokc
An wxtension for [pass](https://www.passwordstore.org/) to use your [OpenKeyChain](https://www.openkeychain.org/) keys in [termux](https://termux.dev/).

## Dependencies
* Android phone
* [termux](https://termux.dev/)
* [OpenKeyChain](https://www.openkeychain.org/)
* [OkcAgent](https://github.com/DDoSolitary/OkcAgent)
* [pass](https://www.passwordstore.org/)

## Motivation
I use `pass` everywhere and I am happy with it. For a long time I've been using the Android client on my phone and it kinda did the job, except a few things kept bugging me:
1. what's the point of using a tool that integrates beautifully with my unix system, if I have to access it from a GUI disconnected from my trusty `bash`?
2. sure, I could easily solve point 1. by using `pass` in `termux`, but I have my keys on hardware tokens and poor little `gpg` has no clue how to reach an NFC smartcard from its sandbox.

Luckily `OpenKeyChain` supports NFC smartcards and you can tap into it from `termux` using `OkcAgent`: the only missing ingredient separating me from a fully staisfying password managing experience was `pass` being able to use `OpenKeyChain`, so here we are

## Installation
Easy peasy:
```
make install
```

## How to use
Setup the `OpenKeyChain` to use:
```
pass okc-id yourkeyid
```
Add a new password:
```
pass okc-insert youraccount
```
Get/decrypt a password:
```
pass okc-get youraccount
```
