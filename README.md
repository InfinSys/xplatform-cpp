# Cross-Platform C++ Template
</br>

### **Accelerate your cross-platform C++ development**

**This repository offers a robust template, designed to provide a comprehensive foundation for your next C++ project. It eliminates the complexities of initial setup, allowing you to focus immediately on application logic across diverse operating systems such as Windows, Linux, and macOS. Using CMake, this template integrates seamlessly with modern development tools and environments like VS Code, Visual Studio, CLion, and more, while maintaining the flexibility to adapt to your preferred toolchain.**

</br>

## Setup
#### Clone this repository using the CLI: </br> `git clone https://github.com/InfinSys/xplatform-cpp.git [destination]`

### **OR**

#### by [downloading the source ZIP file](https://github.com/InfinSys/xplatform-cpp/archive/refs/heads/main.zip) and extracting it to a prefered location.

</br>

> Once you have the repository locally available, you can begin modifying the template as you please and configure/build the project. This template is designed to achieve both of these straight out of the box, so you need not modify anything to verify everything is functioning accordingly. Simply `cd` to the repositories directory and run the following command:
> ### Windows:
> ```bash
>cmake --preset win32-x64-Debug
> ```
>
> ### Linux:
>```bash
>cmake --preset linux-x64-Debug
>```

### ***HEADS-UP:*** </br>Once you instruct CMake to configure the project, this README will be overwritten by the configured version!
#### You can modify the README by changing the template [`README.md.in`](https://github.com/InfinSys/xplatform-cpp/blob/b06d854d63d8c083ee801c989dd81c896d28e89b/docs/templ/README.md.in)

</br>

> You could alternatively command CMake to build the project and the configuration step will be taken care of automatically:
> ### Windows:
>```bash
>cmake --build --preset win32-x64-Debug
>```
>
> ### Linux:
>```bash
>cmake --build --preset linux-x64-Debug
>```

</br>

## Designed with several key characteristics to empower cross-platform C++ development
### **CMake-Centric Build System:**</br>
> At the core of this template is CMake, serving as the primary build abstraction. This provides unparalleled flexibility and control over your project's compilation, linking, and packaging across diverse platforms. Many of the template's advanced features are powered directly by CMake's capabilities. You can find the [official CMake documentation here](https://cmake.org/cmake/help/latest/index.html).

### **Customizable CMake Variables (Scope Convention):**</br>
> This template features a *project-specific 'scope'* convention for CMake cache variables. This mechanism is crucial for preventing silent cache clashes when managing multiple projects derived from this template, or when integrating with other CMake-based workflows. You'll define a short, unique scope identifier for your project that will be used by CMake to mask the project cache variables behind a prefix. This scope prefix can be specified in the root [`CMakeLists.txt`](https://github.com/InfinSys/xplatform-cpp/blob/b86575e355d7e92912cc33ecb97e35759eee3e14/CMakeLists.txt) file by modifying the `PRJ_SCOPE` variable. Furthermore, critical template configuration is controlled by similar variables (prefixed with `PRJ_`) in the root [`CMakeLists.txt`](https://github.com/InfinSys/xplatform-cpp/blob/b86575e355d7e92912cc33ecb97e35759eee3e14/CMakeLists.txt).
>
> ### </br>Template CMake Variables:
> - `PRJ_NAME`
> - `PRJ_SCOPE`
> - `PRJ_C_STANDARD`
> - `PRJ_CXX_STANDARD`
> - `PRJ_CMAKE_MODULE_DIR`
> - `PRJ_INCLUDE_DIRS`
>
> ### </br>Users are expected to customize these variables to align with their project requirements.
> *The* `PRJ_SCOPE` *variable is especially significant*; it defines the unique prefix for your project's cached variables, ensuring isolation and preventing conflicts. CMake script variables prefixed with `PRJ_` are integral to the template and initial CMake setup but can also be leveraged throughout your project's CMake logic. The variables listed above are not the only easily customizable elements of this template.

### **Centralized Project Metadata Configuration:**</br>
> This template includes a [`configure_metadata.cmake`](https://github.com/InfinSys/xplatform-cpp/blob/b06d854d63d8c083ee801c989dd81c896d28e89b/scripts/cmake/configure_metadata.cmake) script to centralize and manage essential software metadata. This script allows you to define key project attributes that are then "baked" into the resulting executables or libraries by configuring template `.in` files.
> - **Configurable Fields:** Key metadata fields include: `PUBLISHER`, `PRODUCT_TYPE` (*e.g.*, Executable, Library, or Firmware), `INTERFACE_TYPE` (*e.g.*, GUI, CLI, API, or HSI), `UUID`, `LICENSE_TYPE` (*e.g.*, MIT, GPLv3, Proprietary, etc.), `FULL_NAME`, `SHORT_NAME`, `MAIN_BINARY_NAME`, and `META_PREFIX` (*for generated in-code metadata symbols*).</br>
> - **Project-Wide Consistency:** These defined values are cached and used to configure critical project files, such as [`README.md`](https://github.com/InfinSys/xplatform-cpp/blob/b06d854d63d8c083ee801c989dd81c896d28e89b/docs/templ/README.md.in), [`LICENSE`](https://github.com/InfinSys/xplatform-cpp/blob/b06d854d63d8c083ee801c989dd81c896d28e89b/docs/templ/LICENSE.in), [`Doxyfile`](https://github.com/InfinSys/xplatform-cpp/blob/b06d854d63d8c083ee801c989dd81c896d28e89b/docs/templ/Doxyfile.in), and internal software metadata/version headers. This mechanism ensures consistent version strings and project details across all relevant documentation and binaries, significantly reducing potential inconsistencies.
>
> **NOTE:** The "*fields*" mentioned above cannot be referenced as they appear in [`configure_metadata.cmake`](https://github.com/InfinSys/xplatform-cpp/blob/b06d854d63d8c083ee801c989dd81c896d28e89b/scripts/cmake/configure_metadata.cmake). These names are components of the full variable name. The `set_metadata()` macro abstracts these details away and makes it easy to add additional metadata fields, and `create_template_reference()` makes it effortless to use those values in template files.

### **VS Code Integration:**</br>
> While fully compatible with any development environment, this template is designed with [**Visual Studio Code**](https://code.visualstudio.com/) in mind. The included [`.vscode`](https://github.com/InfinSys/xplatform-cpp/tree/b86575e355d7e92912cc33ecb97e35759eee3e14/.vscode) directory contains pre-configured [`extensions.json`](https://github.com/InfinSys/xplatform-cpp/blob/b86575e355d7e92912cc33ecb97e35759eee3e14/.vscode/extensions.json), [`tasks.json`](https://github.com/InfinSys/xplatform-cpp/blob/b86575e355d7e92912cc33ecb97e35759eee3e14/.vscode/tasks.json), and [`launch.json`](https://github.com/InfinSys/xplatform-cpp/blob/b86575e355d7e92912cc33ecb97e35759eee3e14/.vscode/launch.json) files. These configurations streamline common development tasks:
> - **Tasks:** Pre-configured tasks automate CMake configuration and building of the primary developer command-line interface (CLI) executable.
> - **Launchers:** The debugger ([`launch.json`](https://github.com/InfinSys/xplatform-cpp/blob/b86575e355d7e92912cc33ecb97e35759eee3e14/.vscode/launch.json)) is set up to automatically run these CMake tasks before launching the developer CLI executable, ensuring a smooth "Run and Debug" experience directly within VS Code.
> - ***Note:*** *(The provided VS Code configurations are specifically tailored for the developer CLI executable to avoid over-imposing on prospective project structures.)*

> ### **Automated Code Formatting (Clang-Format Compatible):**
> Maintain a consistent codebase effortlessly. This template is "*clang-format compatible*", including a fully customized [`.clang-format`](https://github.com/InfinSys/xplatform-cpp/blob/b06d854d63d8c083ee801c989dd81c896d28e89b/.clang-format) file in the root directory. This allows for automated code formatting, ensuring readability and adherence to coding standards across a team.

> ### **Integrated Testing & Benchmarking:**
> Accelerate your development with built-in support for industry-standard testing and benchmarking frameworks. This template is configured to pull GoogleTest and Google Benchmark directly from GitHub during CMake configuration. These features can be individually activated by defining `<PRJ_SCOPE>_<FEATURE>` (*e.g.*, `MYPROJ_TEST` or `MYPROJ_BENCHMARK`) in the provided `CMakePresets.json` file. Setting these values to '*ON*' or '*OFF*' will control their inclusion during the configuration and build steps.

> ### **Streamlined Documentation Generation:**
> Documenting your project is made easier with a dedicated `docs` folder. This includes a pre-configured `Doxygen` file, enabling the generation of comprehensive PDF and HTML documentation for your codebase. To further simplify this process, handy `generate_docs.bat` (*for Windows*) and `generate_docs.sh` (*for Linux/macOS*) scripts are provided, automating the Doxygen invocation.
> 
> ***Note:*** **Doxygen must be installed on your system.**
