# Pizzabot

Instructions for delivering pizza with pizzabot.
In more specific terms, given a grid (where each point on the grid is one house) and a list of points representing houses in need of pizza delivery, it returns a list of instructions for getting Pizzabot to those locations and delivering.

## Installation
You should be using `ruby 2.6.6`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv):

```shell
rbenv install 2.6.6
```

### Install dependencies

You should be using [Bundler](https://github.com/bundler/bundler):
```shell
bundle in
stall
```

## Usage

To run pizza bot open the tar file with `tar zxvf pizzabot`command.
```shell
From the root directory, navigate to `lib/pizzabot`and type
```shell
`./pizzabot "5x5 (0, 0) (1, 3) (4, 4) (4, 2) (4, 2) (0, 1) (3, 2) (2, 3) (4, 1)"`
Pizzabot lists the instructions!
```

The corect output for these is: `DENNNDEEENDSSDDWWWWSDEEENDWNDEESSD`

Tests are written with Rspec, cd to root and run ``` rspec ```.

