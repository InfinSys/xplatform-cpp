# Cross-Platform C++ Template
</br>

### **Accelerate your cross-platform C++ development**

**This repository offers a robust template, designed to provide a comprehensive foundation for your next C++ project. It eliminates the complexities of initial setup, allowing developers to focus immediately on application logic across diverse operating systems such as Windows, Linux, and macOS. Using CMake, this template integrates seamlessly with modern development environments like VS Code, Visual Studio, CLion, and more, while maintaining the flexibility to adapt to your preferred toolchain and needs.**

</br>

## Designed with several key characteristics to empower cross-platform C++ development
### **CMake-Centric Build System:**
> At the core of this template is CMake, serving as the primary build abstraction. This provides unparalleled flexibility and control over your project's compilation, linking, and packaging across diverse platforms. Many of the template's advanced features are powered directly by CMake's capabilities.

### **Customizable CMake Variables (Scope Convention):**
> The template introduces a 'scope' convention for caching CMake variables. You'll define a short, unique scope identifier for your project. Furthermore, critical template-controlling variables are prefixed with `PRJ_` in the root `CMakeLists.txt`. Users are encouraged to locate these '*PRJ_*' prefixed variables and override their default values to tailor the template to their specific project needs.

### **VS Code Integration:**
> While fully compatible with any development environment, this template is designed with Visual Studio Code in mind. The included `.vscode` directory contains pre-configured `extensions.json`, `tasks.json`, and `launch.json` files. These configurations streamline common development tasks:
> - **Tasks:** Pre-configured tasks automate CMake configuration and building of the primary developer command-line interface (CLI) executable.
> - **Launchers:** The debugger (`launch.json`) is set up to automatically run these CMake tasks before launching the developer CLI executable, ensuring a smooth "Run and Debug" experience directly within VS Code.
> - ***Note:*** *(The provided VS Code configurations are specifically tailored for the developer CLI executable to avoid over-imposing on prospective project structures.)*

### **Automated Code Formatting (Clang-Format Compatible):**
> Maintain a consistent codebase effortlessly. This template is "*clang-format compatible*", including a fully customized `.clang-format` file in the root directory. This allows for automated code formatting, ensuring readability and adherence to coding standards across a team.

### **Integrated Testing & Benchmarking:**
> Accelerate your development with built-in support for industry-standard testing and benchmarking frameworks. This template is configured to pull GoogleTest and Google Benchmark directly from GitHub during CMake configuration. These features can be individually activated by defining `<PRJ_SCOPE>_<FEATURE>` (*e.g.*, `MYPROJ_TEST` or `MYPROJ_BENCHMARK`) in the provided `CMakePresets.json` file. Setting these values to '*ON*' or '*OFF*' will control their inclusion during the configuration and build steps.

### **Streamlined Documentation Generation:**
> Documenting your project is made easier with a dedicated `docs` folder. This includes a pre-configured `Doxygen` file, enabling the generation of comprehensive PDF and HTML documentation for your codebase. To further simplify this process, handy `generate_docs.bat` (*for Windows*) and `generate_docs.sh` (*for Linux/macOS*) scripts are provided, automating the Doxygen invocation.
> 
> ***Note:*** **Doxygen must be installed on your system.**
