# Pkg.build()


```sh
sudo apt-get install cmake
sudo julia
```

```julia
Pkg.add("IJulia")
Pkg.build("IJulia")
Pkg.build()
Pkg.update()

using IJuila;notebook()
