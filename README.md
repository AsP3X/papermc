[![PaperMC Check for Successfull build](https://github.com/AsP3X/papermc/actions/workflows/papermc-build-check.yml/badge.svg)](https://github.com/AsP3X/papermc/actions/workflows/papermc-build-check.yml)
[![PaperMC 1.8.8](https://github.com/AsP3X/papermc/actions/workflows/papermc1.8.8.yml/badge.svg)](https://github.com/AsP3X/papermc/actions/workflows/papermc1.8.8.yml)

```
####################################################################
## ZOUPA - (ZombyMediaIC open source usage protection agreement)  ##
## License as of: 21.06.2021 16:50 | #202106211650                ##
## Niklas Vorberg (AsP3X)                                         ##
####################################################################
```
https://github.com/ZombyMedia/LICENSE/blob/master/LICENSE-EN.txt <br>
Image Source: [https://github.com/AsP3X/papermc](https://github.com/AsP3X/papermc)

<br>
<h1>Info about this image</h1>
<p>
    These images are containing the optimized java server of papermc.<br>
    All other Versions will only get framework and script update if nessesary
</p>
<br>
Last update: <strong>07.01.2023</strong>
<br>
<br>
<h1>Getting started</h1>
<p>
    Pick and download the version you choose<br>
    please check our repository for the version you wan't to use. <br>
    Then download the image with following command:
</p>
<code>docker pull zombymediaic/papermc:VERSION</code>
<br>
<p><br>
    To start the server you can do multiple things:<br>
<br>
<p>
    <strong>- Default command without any extra flags:</strong>
</p>
<code>docker run -tid -p 25565:25565 zombymediaic/papermc:VERSION</code><br>
<br>
<p>
    <strong>- Naming the container for a easier workflow:</strong>
</p>
<code>docker run -tid --name NAME -p 25565:25565 zombymediaic/papermc:VERSION</code><br>
<br>
<p>
    <strong>- Set the amount of RAM assigned to the server:</strong>
</p>
<code>docker run -tid --name NAME -p 25565:25565 -e RAM=6G zombymediaic/papermc:VERSION</code><br>
<br>
<p>
    <strong>- Enabling the ssh service to access the container remotely:</strong>
</p>
<code>docker run -tid --name NAME -p 25565:25565 -e allowSSH=true zombymediaic/papermc:VERSION</code><br>

<br>
<hr>
<br>

<p>
    !! DONT REPLACE THE <strong>/server</strong> of the volume !!
</p>
<p>
    While the Server containers starts up, the minecraft server will get created
</p>