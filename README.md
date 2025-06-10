
<!--
    (June 2025 - Jamon T. Bailey)

This is not an HTML document.
-->

<div align="center">
    <h1>Cross-Platform C++ Template</h1>
</div>

</br>

<div>
    <h3>Accelerate your cross-platform C++ development</h3>
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
    <h2>Setup</h2>
    <h4>Clone this repository using the CLI:</h4>
    <pre align="center"><code>git clone https://github.com/InfinSys/xplatform-cpp.git [destination]</code></pre>
    <strong><h3 align="center">OR</h3></strong>
    <h4 align="center">
        <a href="https://github.com/InfinSys/xplatform-cpp/archive/refs/heads/main.zip">download the source ZIP file</a>
        and extract it to a preferred location.
    </h4></br>
    <p>
        Once you have the repository locally available, you can begin modifying the template as you please and configure/build
        the project. This template is designed to achieve both of these straight out of the box, so you need not modify anything
        to verify everything is functioning accordingly. Simply <code>cd</code> to the repositories directory and run the following
        command:
    </p>
    <blockquote>
        <h3>Windows:</h3>
        <pre><code>cmake --preset win32-x64-Debug</code></pre>
        <h3>Linux:</h3>
        <pre><code>cmake --preset linux-x64-Debug</code></pre>
    </blockquote></br>
    <h3><em>HEADS-UP:</em></h3>
    <h4>Once you instruct CMake to configure the project, <em>this</em> README will be overwritten by the configured version!</h4>
    <h4>
        You can modify the README by changing the template
        <a href="https://github.com/InfinSys/xplatform-cpp/blob/api-style/docs/templ/README.md.in">README.md.in</a>
        file.
    </h4></br>
    <p>
        You alternatively could command CMake to build the project and the configuration step will be taken care of automatically:
    </p>
    <blockquote>
        <h3>Windows:</h3>
        <pre><code>cmake --build --preset win32-x64-Debug</code></pre>
        <h3>Linux:</h3>
        <pre><code>cmake --build --preset linux-x64-Debug</code></pre>
    </blockquote>
</div></br>
<hr>

</br>

<div>
    <h2 align="center">Designed with several key characteristics to empower C++ development</h2>
    <h3><strong>CMake-Centric Build System:</strong></h3>
    <blockquote>
        <p>
            At the core of this template is CMake, serving as the primary build abstraction. This provides unparalleled
            flexibility and control over your project's compilation, linking, and packaging across diverse platforms.
            Many of the template's advanced features are powered directly by CMake's capabilities. You can find the
            <a href="https://cmake.org/cmake/help/latest/index.html">official CMake documentation here</a>.
        </p>
    </blockquote></br>
    <h3><strong>Customizable CMake Variables (Scope Convention):</strong></h3>
    <blockquote>
        <p>
            This template features a project-specific 'scope' convention for CMake cache variables. This mechanism is crucial
            for preventing silent cache clashes when managing multiple projects derived from this template, or when integrating
            with other CMake-based workflows. You'll define a short, unique scope identifier for your project that will be used
            by CMake to mask the project cache variables behind a prefix. This scope prefix can be specified in the root
            <a href="https://github.com/InfinSys/xplatform-cpp/blob/api-style/CMakeLists.txt">CMakeLists.txt</a>
            file by modifying the <code>PRJ_SCOPE</code> variable. Furthermore, critical template configuration is controlled by
            similar variables (prefixed with <code>PRJ_</code> in the root
            <a href="https://github.com/InfinSys/xplatform-cpp/blob/api-style/CMakeLists.txt">CMakeLists.txt</a>.
        </p></br>
        <div align="center">
            <table>
                <tr>
                    <th><h3>Template CMake Variables:</h3></th>
                </tr>
                <tr><td><code>PRJ_NAME</code></td></tr>
                <tr><td><code>PRJ_SCOPE</code></td></tr>
                <tr><td><code>PRJ_C_STANDARD</code></td></tr>
                <tr><td><code>PRJ_CXX_STANDARD</code></td></tr>
                <tr><td><code>PRJ_CMAKE_MODULE_DIR</code></td></tr>
                <tr><td><code>PRJ_INCLUDE_DIRS</code></td></tr>
            </table>
        </div></br>
        <h3>Users are expected to customize these variables to align with their project requirements.</h3>
        <p>
            <em>The</em> <code>PRJ_SCOPE</code> <em>variable is especially important</em>; it defines the unique prefix for your
            project's cached variables, ensuring isolation and preventing conflicts. CMake script variables prefixed with
            <code>PRJ_</code> are integral to the template and initial CMake setup but can also be leveraged throughout your
            project's CMake logic. The variables listed above are not the only easily customizable elements of this template.
        </p>
    </blockquote></br>
    <h3><strong>Centralized Project Metadata Configuration:</strong></h3>
    <blockquote>
        <p>
            This template includes a
            <a href="https://github.com/InfinSys/xplatform-cpp/blob/api-style/scripts/cmake/configure_metadata.cmake">
                configure_metadata.cmake
            </a>
            script to centralize and manage essential software metadata. This script allows you to define key project attributes
            that are then "baked" into the resulting executables or libraries by configuring template <code>.in</code> source
            files.
        </p>
        <ul type="circle">
            <li>
                <strong>Configurable Fields:</strong>
                Predefined metadata fields include:
                <ul type="square">
                    <li><code>PUBLISHER</code></li>
                    <li><code>PRODUCT_TYPE</code> (e.g., <em>Executable</em>, <em>Library</em>, or <em>Firmware</em>)</li>
                    <li><code>INTERFACE_TYPE</code> (e.g., <em>GUI</em>, <em>CLI</em>, <em>API</em>, or <em>HSI</em>)</li>
                    <li><code>UUID</code></li>
                    <li><code>LICENSE_TYPE</code> (e.g., <em>MIT</em>, <em>GPLv3</em>, <em>Proprietary</em>, etc.)</li>
                    <li><code>FULL_NAME</code></li>
                    <li><code>SHORT_NAME</code></li>
                    <li><code>MAIN_BINARY_NAME</code></li>
                    <li><code>META_PREFIX</code> (<em>for generated in-code metadata symbols</em>)</li>
                </ul>
            </li>
            <li>
                <strong>Project-Wide Consistency:</strong>
                These defined values are cached and used to configure critical project files, such as
                <a href="https://github.com/InfinSys/xplatform-cpp/blob/api-style/docs/templ/README.md.in">README.md</a>,
                <a href="https://github.com/InfinSys/xplatform-cpp/blob/api-style/docs/templ/LICENSE.in">LICENSE</a>,
                <a href="https://github.com/InfinSys/xplatform-cpp/blob/api-style/docs/templ/Doxyfile.in">Doxyfile</a>,
                and
                <a href="https://github.com/InfinSys/xplatform-cpp/tree/api-style/libs/metadata">
                    internal software metadata/version headers
                </a>.
                This mechanism ensures consistent version strings and project details across all relevant documentation and binaries,
                significantly reducing potential inconsistencies.
            </li>
        </ul>
        <p>
            <strong>NOTE:</strong>
            The metadata "<em>fields</em>" mentioned above cannot be referenced as they appear in
            <a href="https://github.com/InfinSys/xplatform-cpp/blob/api-style/scripts/cmake/configure_metadata.cmake">
                configure_metadata.cmake
            </a>. These names are components of the full variable name. The <code>set_metadata()</code> macro abstracts these details
            away and makes it easy to add additional metadata fields, and <code>create_template_reference()</code> makes it effortless
            to use those values in template files.
        </p>
    </blockquote></br>
    <!--Continue-->
</div>
