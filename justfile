# Compile, package, serve and open the browser - all in one command
default: package serve open-browser

# Compile the Scala code to JavaScript
package:
  scala-cli --power package --js . -o out/hello.js -f

# Continuously compile the Scala code to JavaScript
packageW:
  scala-cli --power package --js . -o out/hello.js -f -w

# Serve the directory (a background task) out onport 8000
serve:
  $JAVA_HOME/bin/jwebserver -d {{invocation_directory()}}/out -p 8000 &

setup-ide:
  scala-cli setup-ide .

# Might open a browser in a platform independent way.
open-browser:
  if [[ "$(uname)" == "Darwin" ]]; then \
      open -a Safari http://localhost:8000; \
  elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then \
      google-chrome http://localhost:8000; \
  elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]]; then \
      start chrome ; \
  fi

