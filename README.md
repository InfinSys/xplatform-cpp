# Cross-Platform C++ Template

### **Start your next cross-platform C++ project with confidence!**
### **This repository provides a robust and opinionated template, designed to streamline your development workflow from day one. Say goodbye to tedious boilerplate setup and dive straight into building your application, whether you're targeting Windows, Linux, macOS, or beyond. Leveraging the power of CMake, this template offers a pre-configured, highly adaptable foundation that integrates seamlessly with modern development environments like VS Code, while remaining flexible for your preferred tools**

</br>

## Designed with several key characteristics to empower cross-platform C++ development
### **CMake-Centric Build System:**
> At the core of this template is CMake, serving as the primary build abstraction. This provides unparalleled flexibility and control over your project's compilation, linking, and packaging across diverse platforms. Many of the template's advanced features are powered directly by CMake's capabilities.

### **Customizable CMake Variables (Scope Convention):**
> The template introduces a 'scope' convention for caching CMake variables. You'll define a short, unique scope identifier for your project. Furthermore, critical template-controlling variables are prefixed with `PRJ_` in the root `CMakeLists.txt`. Users are encouraged to locate these *PRJ_* prefixed variables and override their default values to tailor the template to their specific project needs.

### **VS Code Integration:**
> While fully compatible with any development environment, this template is designed with Visual Studio Code in mind. The included `.vscode` directory contains pre-configured `extensions.json`, `tasks.json`, and `launch.json` files. These configurations streamline common development tasks:
> - **Tasks:** Pre-configured tasks automate CMake configuration and building of the primary developer command-line interface (CLI) executable.
> - **Launchers:** The debugger (`launch.json`) is set up to automatically run these CMake tasks before launching the developer CLI executable, ensuring a smooth "Run and Debug" experience directly within VS Code.
> - ***Note:*** *(The provided VS Code configurations are specifically tailored for the developer CLI executable to avoid over-imposing on prospective project structures.)*

### **Automated Code Formatting (Clang-Format Compatible):**
> Maintain a consistent codebase effortlessly. This template is "*clang-format compatible*", including a fully customized `.clang-format` file in the root directory. This allows for automated code formatting, ensuring readability and adherence to coding standards across a team.
