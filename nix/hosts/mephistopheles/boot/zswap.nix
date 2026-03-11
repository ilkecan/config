{
  ...
}:

{
  boot.kernelParams = [
    "zswap.compressor=lz4" # compression algorithm
    "zswap.enabled=1" # enables zswap
    "zswap.max_pool_percent=30" # maximum percentage of RAM that zswap is allowed to use
    "zswap.shrinker_enabled=1" # whether to shrink the pool proactively on high memory pressure
  ];
}
