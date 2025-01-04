# Tracing Redis

## Docker
Don't use docker: it doesn't work (see [syso](https://www.github.com/tcassar-diss/syso))

## `benchmark.sh`

```shell
sudo ./benchmark.sh
```

nice and easy

## From scratch

1. Make sure no other redis instances are running (run `redis-benchmark`: it should complain)
2. Install syso at latest version
3. `sudo syso redis-server`
4. (in another shell) `redis-benchmark`
5. ctrl-c when the benchmark has finished

