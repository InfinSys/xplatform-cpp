
<!--
    (June 2025 - Jamon T. Bailey)

This is not an HTML document.
-->

<div align="center">
    <h1>Cross-Platform C++ Template</h1>
</div></br>

<div>
    <h3>:: API Style ::</h3>
    <p>
        The <strong>API style</strong> project directory is designed for <strong>building C++ libraries intended to be consumed by other developers</strong>. Unlike end-user applications, a library's project structure is part of its public interface. Downstream projects interact not only with its binaries and headers but also with its build system and dependency layout. This turns out to be part of the user experience. The intent of this templates style is to make a library easy to consume, extend, and maintain — whether by linking it via CMake, embedding it directly, or publishing it as a package.
    </p>
    <p>
        In contrast, <strong>End-User style</strong> projects focus on producing standalone executables or tools where internal organization is flexible and developer-facing ergonomics are less critical. You can find this template on the <a href="https://github.com/InfinSys/xplatform-cpp/tree/end-user-style">End-User Style branch</a>.
    </p>
</div></br>

<div>
    <h2>Template Setup</h2>
    <h4>Clone this repository using the CLI:</h4>
    <pre align="center"><code>git clone https://github.com/InfinSys/xplatform-cpp.git -b api-style [destination path]</code></pre>
    <strong><h3 align="center">OR</h3></strong>
    <h4 align="center">
        <a href="https://github.com/InfinSys/xplatform-cpp/archive/refs/heads/api-style.zip">📂download the source ZIP file</a>
        and extract it to a preferred location.
    </h4></br>
<!--
    <p>
        Once you have the repository locally available, you can begin modifying the template as you please and configure/build
        the project. This template is designed to achieve both of these straight out of the box, so you need not modify anything
        to verify everything is functioning accordingly. Simply <code>cd</code> to the repositories root directory and run the
        following command:
    </p>
    <h3>🔧 Run the CMake configuration:</h3>
    <blockquote>
        <h3>Windows:</h3>
        <pre><code>cmake --preset win32-x64-debug</code></pre>
        <h3>Linux:</h3>
        <pre><code>cmake --preset linux-x64-debug</code></pre>
        <h3>macOS:</h3>
        <pre><code>cmake --preset macos-x64-debug</code></pre>
    </blockquote></br>
</div>
-->

<!--
> [!NOTE]
> <h3>⚠️ <em>HEADS-UP!</em></h3>
> <h4>Once you instruct CMake to configure the project, <em>this</em> README will be overwritten by the configured version!</h4>
> <h4>
>    You can modify the README by changing the template
>    <a href="https://github.com/InfinSys/xplatform-cpp/blob/api-style/docs/templ/README.md.in">README.md.in</a>
>    file.
> </h4>
> <p>(<em>More details on template files <a href="#-this-readme-is-still-in-progress-">below</a></em>)</p>
-->

<!--
<div>
    </br><p>
        Configuring the project results in a <code>build</code> folder appearing in the project root that contains a subdirectory
        specific to your preset. Because this template makes use of CMake presets, it is not necessary to navigate to the
        build directory before invoking the CMake build command:
    </p>
    <h3>🔨 Build your project with CMake:</h3>
    <blockquote>
        <h3>Windows:</h3>
        <pre><code>cmake --build --preset win32-x64-debug</code></pre>
        <h3>Linux:</h3>
        <pre><code>cmake --build --preset linux-x64-debug</code></pre>
        <h3>macOS:</h3>
        <pre><code>cmake --build --preset macos-x64-debug</code></pre>
    </blockquote>
</div></br></br>
-->

<!--
<div>
    <h2 align="center">N/a</h2>
    <h3><strong>CMake Build System:</strong></h3>
    <div align="center">
        <img src="https://cmake.org/wp-content/uploads/2023/08/CMake-Logo.svg" alt="CMake Logo" width=200>
    </div></br>
    <blockquote>
        <p>
            At the core of this template is CMake, serving as the primary build tool. This provides
            flexibility and control over your project's compilation, linking, and packaging across diverse platforms.
            <strong>Many of the template's features are powered directly by CMake's capabilities.</strong>
        </p>
        <p>
            CMake offers amazing support for various compilers, build tools, and IDEs, enabling users
            to easily swap out toolchains and target different environments without modifying source code or project files.
            This simplifies maintaining a consistent build process across Windows, Linux, and macOS. You can find
            the
            <a href="https://cmake.org/cmake/help/latest/index.html">
                official CMake documentation here
            </a>.
        </p>
    </blockquote></br>
</div>
-->

<!-- DO NOT DELETE CONTENTS BELOW -->
<hr>

</br><h3 align="center">( ...This README is still in progress... )</h3>
