
<!--
    (June 2025 - Jamon T. Bailey)

This is not an HTML document.
-->

<div align="center">
    <h1>Cross-Platform C++ Template</h1>
</div>

</br>

<div>
    <h3>⚡ Accelerate your cross-platform C++ development</h3>
    <p><strong>
        This repository offers a robust template, designed to provide a comprehensive foundation for your next C++ project.
        It eliminates the complexities of initial setup, allowing you to focus immediately on application logic across diverse
        operating systems such as Windows, Linux, and macOS. Using CMake, this template integrates seamlessly with modern
        development tools and environments like VS Code, Visual Studio, CLion, and more, while maintaining the flexibility to
        adapt to your preferred toolchain.
    </strong></p>
</div>

</br>

<div>
    <h2>🚀 Setup</h2>
    <h4>Clone this repository using the CLI:</h4>
    <pre align="center"><code>git clone https://github.com/InfinSys/xplatform-cpp.git [destination]</code></pre>
    <strong><h3 align="center">OR</h3></strong>
    <h4 align="center">
        <a href="https://github.com/InfinSys/xplatform-cpp/archive/refs/heads/main.zip">📂download the source ZIP file</a>
        and extract it to a preferred location.
    </h4></br>
    <p>
        Once you have the repository locally available, you can begin modifying the template as you please and configure/build
        the project. This template is designed to achieve both of these straight out of the box, so you need not modify anything
        to verify everything is functioning accordingly. Simply <code>cd</code> to the repositories root directory and run the
        following command:
    </p>
    <h3>🔧 Configure the project with CMake:</h3>
    <blockquote>
        <h3>Windows:</h3>
        <pre><code>cmake --preset win32-x64-Debug</code></pre>
        <h3>Linux:</h3>
        <pre><code>cmake --preset linux-x64-Debug</code></pre>
        <h3>macOS:</h3>
        <pre><code>cmake --preset macos-x64-Debug</code></pre>
    </blockquote></br>
</div>

> [!NOTE]
> <h3>⚠️ <em>HEADS-UP!</em></h3>
> <h4>Once you instruct CMake to configure the project, <em>this</em> README will be overwritten by the configured version!</h4>
> <h4>
>    You can modify the README by changing the template
>    <a href="https://github.com/InfinSys/xplatform-cpp/blob/api-style/docs/templ/README.md.in">README.md.in</a>
>    file.
> </h4>
> <p>(<em>More details on template files later</em>)</p>

<div>
    </br><p>
        Configuring the project results in a <code>build</code> folder appearing in the project root that contains a subdirectory
        specific to your preset. Because this template makes use of CMake presets, it is not necessary to naviagte to the
        build directory before invoking the CMake build command:
    </p>
    <h3>🔨 Build the project with CMake:</h3>
    <blockquote>
        <h3>Windows:</h3>
        <pre><code>cmake --build --preset win32-x64-Debug</code></pre>
        <h3>Linux:</h3>
        <pre><code>cmake --build --preset linux-x64-Debug</code></pre>
        <h3>macOS:</h3>
        <pre><code>cmake --build --preset macos-x64-Debug</code></pre>
    </blockquote>
</div></br>
<hr></br>

<div>
    <h2 align="center">Designed with Several Key Characteristics</br>to Empower C++ Development ✨</h2>
    <h3><strong>CMake-Centric Build System:</strong></h3>
    <div align="center">
        <img src="https://cmake.org/wp-content/uploads/2023/08/CMake-Logo.svg" alt="CMake Logo" width=200>
    </div></br>
    <blockquote>
        <p>
            At the core of this template is CMake, serving as the primary build abstraction. This provides unparalleled
            flexibility and control over your project's compilation, linking, and packaging across diverse platforms.
            <strong>Many of the template's advanced features are powered directly by CMake's capabilities.</strong>
        </p>
        <p>
            CMake's strength lies in its ability to manage external dependencies, configure project layouts, and orchestrate
            complex build processes. It offers amazing support for various compilers, build tools, and IDEs, enabling users
            to easily swap out toolchains and target different environments without modifying source code or project files.
            This abstraction simplifies maintaining a consistent build process across Windows, Linux, and macOS. You can find
            the
            <a href="https://cmake.org/cmake/help/latest/index.html">
                official CMake documentation here
            </a>.
        </p>
    </blockquote></br>
    <h3><strong>Flexible Foundation & Customization:</strong></h3>
    <blockquote>
        <p>
            This repository provides a comprehensive CMake foundation to help accelerate project setup. It includes a
            complete build script structure, predefined configure/build CMake presets, custom CMake modules to simplify
            common tasks, and a predefined set of <code>PRJ_</code> prefixed variables that drive core template behaviors.
        </p>
        <p>
            To enhance developer efficiency, this template incorporates
            <strong>several helper macros within its CMake modules</strong>. These macros abstract common build system
            operations, including (<em>but not limited to</em>):
        </p>
        <table align="center">
            <tr>
                <th>Provided CMake Macro</th>
                <th>Description</th>
            </tr>
            <tr>
                <td><code>format_source_code()</code></td>
                <td>For integrated code formatting</td>
            </tr>
            <tr>
                <td><code>set_cxx_standard()</code></td>
                <td>For managing C++ standards of individual targets</td>
            </tr>
            <tr>
                <td><code>set_metadata()</code></td>
                <td>For caching project metadata (<em>more on this later</em>)</td>
            </tr>
            <tr>
                <td><code>create_template_reference()</code></td>
                <td>For streamlining template file configuration</td>
            </tr>
        </table></br>
        <p>
            Most importantly, this foundation is (<em>obviously</em>) entirely customizable! While it offers a robust starting
            point, <strong>you're encouraged to modify, extend, or even restructure the provided project directory, CMake
            scripts/modules, shell scripts, and more to perfectly align with your project's unique requirements and your
            preferred build philosophy</strong>. The goal this repo has in mind is to provide a baseline that can evolve with
            your needs or inspire your own cross-platform C++ template!
        </p>
    </blockquote></br>
</div>

<!-- DO NOT DELETE CONTENTS BELOW -->
<hr>

</br><h3 align="center">( ...This README is still in progress... )</h3>
