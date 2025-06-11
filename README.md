
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
        command to configure the project:
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
        You alternatively could command CMake to build the project and the CMake configuration step will be taken care of
        automatically:
    </p>
    <blockquote>
        <h3>Windows:</h3>
        <pre><code>cmake --build --preset win32-x64-Debug</code></pre>
        <h3>Linux:</h3>
        <pre><code>cmake --build --preset linux-x64-Debug</code></pre>
    </blockquote>
</div></br>
<hr>

</br><h3 align="center">( ...This README is still in progress... )</h3>
