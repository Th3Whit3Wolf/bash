#!/bin/bash

if [ -d ".git" ]; then
    :
else git init
fi

read -r -p "Do you want to use SSH on Github? [Y/n] " input
case $input in
        [yY][eE][sS]|[yY])
    ssh="yes"
    ;;

        [nN][oO]|[nN])
    ssh="no"
    ;;

        *)
    echo "Invalid input..."
    exit 1
    ;;
esac
read -rep $'What shall the new repo be called? \n' REPO
USER=$(cat ~/.gitconfig | grep name | cut -d ' ' -f3)
curl -u $USER https://api.github.com/user/repos -d '{"name" : "'$REPO'"}'

if [ -f "README.md" ]; then
    :
else
  echo "<h1 align="center">$REPO</h1>
  <h3 align="center">This is a description of $REPO</h3>

  ## Features

  * Feature 1
  * Feature 2
  * Feature 3
  * Feature 4

  ## Usage

  \`\`\`
  Example code for $REPO
  \`\`\`
  ## Installation

  ### Prerequisites

  To build $REPO  from source, you need this, this, and this.

  #### Fedora / RHEL / etc.

  \`\`\`
  sudo dnf install this this this
  \`\`\`

  #### Ubuntu / Mint / Elementary / etc.

  \`\`\`
  sudo apt-get install this this this
  \`\`\`

  #### Arch Linux

  \`\`\`
  sudo pacman -S this this this
  yaourt -S this this this
  \`\`\`

  #### Void Linux

  \`\`\`
  sudo xbps-install this this this
  \`\`\`

  ### Building

  \`\`\`
  git clone https://github.com/$USER/$REPO.com
  cd $REPO
  mkdir build
  cd build
  cmake ..
  make
  sudo make install
  \`\`\`
  ## Goals
  - Goal 1
  - Goal 2

  ## Support

  | Thing 1 | Thing 2 | Thing 3 |
  |---------|---------|---------|
  | Item 1  | yes | no		  |
  | Item 2  | yes | no         |

  ## ToDos

  - [x] Accomplished Objective 1
  - [ ] Todo 1
  - [x] Accomplished Objective 2
  - [ ] Todo 2

  #### Warning
  **USE IT AT YOUR OWN RISK - YOU ARE RESPONSIBLE FOR BACKING UP AND RESTORING YOUR DATA**

  ## screenshot

  ![This is a screenshot of $REPO ](screenshot.png)

  Contributors and THANKS!
  ------------------------

  Thanks go to:

  * Everyone
  * That
  * Helped

  ## license

  This project is license used the MIT license. See [LICENSE](LICENSE) for more details." > README.md
fi
if [ "$ssh" == "yes" ]; then
    git remote add origin git@github.com:$USER/$REPO.git
else
    git remote add origin https://github.com/$USER/$REPO.git
fi
git add -A
git commit -m "First Commit"
git push origin master
