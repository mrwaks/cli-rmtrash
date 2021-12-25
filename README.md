<h1 align="center">RECYCLE BIN FOR TERMINAL 🏀 🗑️</h1>

<p align="center">
    <a href="https://github.com/mrwaks/cli-rmtrash/blob/main/license" target="_blank">
        <img src="https://img.shields.io/badge/license-MIT-green.svg" alt="Labo-cli is released under the MIT license." />
    </a>
    <a href="https://www.youtube.com/watch?v=bpyX5E1tARk" target="_blank">
        <img src="https://img.shields.io/badge/certified-by%20this%20man%20%F0%9F%98%81-orange" alt="A man who never misses a shot in his basket" />
    </a>
</p>

<p style="font-weight: bold;" align="center">Recycle bin for command line terminal to avoid deleting without a second chance with the "rm" command.</p>

<br>

<p align="center">I imagine that just like me, you have already deleted something with the "rm" command in your terminal. 😁</p>

<p align="center">Then you had a regret for this action, and you wished you could recover this deleted item. 😱</p>

<p align="center">Impossible thing with the "rm" command. 🛑</p>

<p align="center">Thanks to rmtrash, you can now obtain a trash directly in your terminal to throw your waste there and recover it if necessary. 🙏</p>

<br>

<h1 style="font-weight:bold;" id="summary">❓ What’s In This Document</h1>

- <a href="#installation">Installation</a>
- <a href="#uninstallation">Uninstallation</a>
- <a href="#updating">Updating</a>
- <a href="#rmtrash">Usage or rmtrash command line</a>
- <a href="#emptyrmtrash">Usage or emptyrmtrash command line</a>
- <a href="#advice">Advice</a>
- <a href="#contribute">How to Contribute</a>
- <a href="#license">License</a>

<br>

<h1 style="font-weight:bold;" id="installation">👷 Installation:</h1>

### **Run this command line to build on MAC OS from the root of the cli-rmtrash repository**:

    ./build/installation/macos/install_macos.sh

This will create an invisible .RMTRASH directory in the "~" directory.

Finally this will install the necessary commands in the /usr/local/bin directory.

### **You can run it with npm command line from the root of the cli-rmtrash repository**:

    npm run install_macos

<br>

### **Run this command line to build on LINUX OS from the root of the cli-rmtrash repository**:

    ./build/installation/linux/install_linux.sh

This will create an invisible .RMTRASH directory in the ~ directory.

Finally this will install the necessary commands in the /usr/local/bin directory.

### **You can run it with npm command line from the root (.)**:

    npm run install_linux

<a href="#summary" style="font-size:15px">Go back to summary ⬆️</a>

<br>

<h1 style="font-weight:bold;" id="uninstallation">👷 Uninstallation:</h1>

### **To uninstall rmtrash on MacOs, run this from the root of the cli-rmtrash repository:**

    ./build/uninstallation/macos/uninstall_macos.sh

This will remove the invisible directory .RMTRASH.

Finally, this will delete the commands in the /usr/local/bin directory.

### **You can run it with npm command line from the root of the cli-rmtrash repository**:

    npm run uninstall_macos

### **To uninstall rmtrash on Linux, run this from the root of the cli-rmtrash repository:**

    ./build/uninstallation/linux/uninstall_linux.sh

This will remove the invisible directory .RMTRASH.

Finally, this will delete the commands in the /usr/local/bin directory.

### **You can run it with npm command line from the root of the cli-rmtrash repository**:

    npm run uninstall_linux

<a href="#summary" style="font-size:15px">Go back to summary ⬆️</a>

<br>

<h1 style="font-weight:bold;" id="updating">👷 Updating:</h1>

### **To update rmtrash to the latest version, just run from the root of the cli-rmtrash repository:**

### With Macos:

    git pull && ./build/uninstallation/macos/uninstall_macos.sh && ./build/installation/macos/install_macos.sh

### or with npm:

    git pull && npm run uninstall_macos && npm run install_macos

### With Linux:

    git pull && ./build/uninstallation/linux/uninstall_linux.sh && ./build/installation/linux/install_linux.sh

### or with npm:

    git pull && npm run uninstall_linux && npm run install_linux

<a href="#summary" style="font-size:15px">Go back to summary ⬆️</a>

<br>

<h1 style="font-weight:bold;" id="rmtrash">🎓 Usage with rmtrash command line:</h1>

### **Run this command line to place in the rmtrash bin**:

    rmtrash [...items]

The deleted item(s) will be placed in your .RMTRASH located in the "~" directory.

### **Run this command line to listing content of rmtrash bin**:

    rmtrash ls

### **Run this command line to see the version of rmtrash**:

    rmtrash [-v] | [--version]

### **Run this command line to open the helper:**

    rmtrash [-h] | [-help] | [--help]

<a href="#summary" style="font-size:15px">Go back to summary ⬆️</a>

<br>

<h1 style="font-weight:bold;" id="emptyrmtrash">🎓 Usage with emptyrmtrash command line:</h1>

### **Run this command line to empty the rmtrash bin with confirmation:**

    emptyrmtrash

### **Run this command line to empty the rmtrash bin without confirmation:**

    emptyrmtrash -y

### **Run this command line to shred all files in the rmtrash and empty all files in it with confirmation:**

    emptyrmtrash [shred] | [-shred] | [--shred]

### **Run this command line to shred all files in the rmtrash and empty all files in it without confirmation:**

    emptyrmtrash [shred -y] | [-shred -y] | [--shred -y]

### **Run this command line to see the version of rmtrash**:

    emptyrmtrash [-v] | [--version]

### **Run this command line to open the helper:**

    emptyrmtrash [-h] | [-help] | [--help]

<a href="#summary" style="font-size:15px">Go back to summary ⬆️</a>

<br>

<h1 style="font-weight:bold;" id="advice">💡 Advice:</h1>

You can very well if you wish to modify the name of the commands in your .bashrc or .zshrc file by creating aliases. 😎

Example:

- In case you want to replace the original rm command:

    alias rm="rmtrash"

- In case you don't want to replace the original rm command:

    alias rmt="rmtrash"

- For emptyrmtrash command line:

    alias em="emptyrmtrash"

<a href="#summary" style="font-size:15px">Go back to summary ⬆️</a>

<h1 id="contribute">🤝 How to Contribute</h1>

<p>Whether you want to help fix bugs, improve the documentation or spread the word, it will be a pleasure to taste this vanilla ice cream together. 💪 ❤️</p>

<p>Do not hesitate to take a look at the <a href="https://github.com/mrwaks/cli-rmtrash" target="_blank">github repository of cli-rmtrash</a>.</p>

<p>For any questions or suggestions do not hesitate to write to<a href="mailto: rudy.waks@gmail.com"> rudy.waks@gmail.com</a>.</p>

<a href="#summary" style="font-size:15px">Go back to summary ⬆️</a>

<h1 id="license">📝 License</h1>

<p>Licensed under <a href="https://github.com/mrwaks/cli-rmtrash/blob/main/license" target="_blank">the MIT License</a>.</p>

<a href="#summary" style="font-size:15px">Go back to summary ⬆️</a>

<br>

<h2>P.S:</h2>

<h3>🗑️ ♻️ Please keep clean and throw your waste in the trash 🙏</h3>

<a href="#summary" style="font-size:15px">Go back to summary ⬆️</a>