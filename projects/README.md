# Îagûara

## The project structure

```
  project-name/
            |- rootfs/
            |- Dockerfile
            |- Makefile
```

The `rootfs` is optional, used to copy files to the root of the image
file system (the path `/` inside image).

The `Dockerfile` is optional, used only when we want to generate
a new Docker image (the `Makefile` must have a `build` task).

The `Makefile` contains tasks to build and run the project.
