# Exsockets

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add exsockets to your list of dependencies in `mix.exs`:

        def deps do
          [{:exsockets, "~> 0.0.1"}]
        end

  2. Ensure exsockets is started before your application:

        def application do
          [applications: [:exsockets]]
        end


## ruby client:

```
$ ruby -r ./subscriber -e "Subscriber.new.subscribe('custom/test')"
```

```
$ ruby -r ./publisher -e "Publisher.new.publish('custom/test', 'hello')"
```
