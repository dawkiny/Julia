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
using IJulia; notebook(detached=true)
Process(`'/media/dawkiny/M/' notebook`, ProcessRunning)
