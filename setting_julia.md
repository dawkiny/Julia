# Pkg.build()


```sh
sudo apt-get install cmake
sudo julia      # To get permission, or you'll get a message 'Permission Denied'.
```

```julia
Pkg.add("IJulia")
Pkg.build("IJulia")
Pkg.build()
Pkg.update()

using IJuila;notebook()
using IJulia; notebook(detached=true)
Process(`'/media/dawkiny/M/' notebook`, ProcessRunning)
