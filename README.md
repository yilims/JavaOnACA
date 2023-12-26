# How to configure Java Buildpacks

| Environment Varaible                   | Description | Default Value |
|----------------------------------------|-------------|---------------|
| `$BP_JVM_VERSION`                      |Configure the JVM version (e.g. `8`, `11`, `17` and `21`).| `17` |
| `$BP_MAVEN_VERSION`                    | Configure the major Maven version (e.g. `3`, `4`).  Since the buildpack only ships a single version of each supported line, updates to the buildpack can change the exact version of Maven installed. If you require a specific minor/patch version of Maven, use the Maven wrapper instead.| `3` |
| `$BP_MAVEN_BUILD_ARGUMENTS`            | Configure the arguments to pass to Maven. `--batch-mode` will be prepended to the argument list in environments without a TTY. | `-Dmaven.test.skip=true --no-transfer-progress package` |
| `$BP_MAVEN_ADDITIONAL_BUILD_ARGUMENTS` | Configure the additionnal arguments (e.g. `-DskipJavadoc`; appended to BP_MAVEN_BUILD_ARGUMENTS) to pass to Maven.  | `` (empty string)|
| `$BP_MAVEN_ACTIVE_PROFILES`            | Configure the active profiles (comma separated: e.g. `p1,!p2,?p3`) to pass to Maven. | `` (empty string) |
| `$BP_MAVEN_BUILT_MODULE`               | Configure the module to find application artifact in.  | the root module (empty) |
| `$BP_MAVEN_BUILT_ARTIFACT`             | Configure the built application artifact explicitly. Supersedes `$BP_MAVEN_BUILT_MODULE`. Can match a single file, multiple files or a directory. Can be one or more space separated patterns. | `target/*.[ejw]ar` |
| `$BP_MAVEN_POM_FILE`                   | Specifies a custom location to the project's `pom.xml` file. It should be relative to the root of the project (i.e. `/workspace'). | `pom.xml` |
| `$BP_MAVEN_DAEMON_ENABLED`             | Triggers apache maven-mvnd to be installed and configured for use instead of Maven.  Set to `true` to use the Maven Daemon. | `false`|
| `$BP_MAVEN_SETTINGS_PATH`              | Specifies a custom location to Maven's `settings.xml` file. ||
| `$BP_INCLUDE_FILES`                    | Colon separated list of glob patterns to match source files. Any matched file will be retained in the final image. | `` (i.e. nothing) |
| `$BP_EXCLUDE_FILES`                    | Colon separated list of glob patterns to match source files. Any matched file will be specifically removed from the final image. If include patterns are also specified, then they are applied first and exclude patterns can be used to further reduce the fileset. | `` (i.e. nothing) |
| `$BP_JAVA_INSTALL_NODE`                | Configure whether to request that `yarn` and `node` are installed by another buildpack**. If set to `true`, the buildpack will check the app root or path set by `$BP_NODE_PROJECT_PATH` for either: A `yarn.lock` file, which requires that `yarn` and `node` are installed or, a `package.json` file, which requires that `node` is installed. | `false` |
| `$BP_NODE_PROJECT_PATH`                | Configure a project subdirectory to look for `package.json` and `yarn.lock` files | |
| `$ORYX_DISABLE_TELEMETRY`              | Configure whether to disable telemetry collection. | `false` |
