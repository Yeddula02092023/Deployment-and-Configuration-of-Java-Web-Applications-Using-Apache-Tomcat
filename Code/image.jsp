
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Java Application Deployment | Apache Tomcat</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    scroll-behavior: smooth;
}

body {
    font-family: Arial, sans-serif;
    background: #f4f7fc;
    color: #253047;
    line-height: 1.7;
}

header {
    background: linear-gradient(120deg,#092b63,#1263b5);
    color: white;
    padding: 35px 7%;
}

header h1 {
    font-size: 30px;
    margin-bottom: 10px;
}

header p {
    color: #dceaff;
}

nav {
    background: #092b63;
    padding: 14px 7%;
    position: sticky;
    top: 0;
    z-index: 10;
    display: flex;
    flex-wrap: wrap;
    gap: 18px;
}

nav a {
    color: white;
    text-decoration: none;
    font-size: 14px;
}

nav a:hover {
    color: #ffcb55;
}

.container {
    max-width: 1100px;
    margin: auto;
    padding: 30px 20px;
}

.hero {
    background: white;
    padding: 35px;
    border-radius: 12px;
    margin-bottom: 25px;
    box-shadow: 0 3px 12px #00000010;
}

.hero h2 {
    color: #1253a1;
    font-size: 27px;
    margin-bottom: 12px;
}

.hero .button {
    display: inline-block;
    background: #1263b5;
    color: white;
    padding: 10px 22px;
    border-radius: 6px;
    text-decoration: none;
    margin-top: 15px;
}

.card {
    background: white;
    padding: 25px;
    border-radius: 12px;
    margin-bottom: 22px;
    border-left: 5px solid #1263b5;
    box-shadow: 0 3px 12px #00000010;
}

.card h2 {
    color: #1253a1;
    margin-bottom: 12px;
    font-size: 22px;
}

.card h3 {
    margin: 16px 0 8px;
    color: #344b70;
}

.card ul, .card ol {
    padding-left: 25px;
}

.command {
    background: #101c30;
    color: #8ff0b1;
    padding: 15px;
    margin: 12px 0;
    border-radius: 7px;
    overflow-x: auto;
    font-family: Consolas, monospace;
    font-size: 14px;
    white-space: pre-wrap;
    overflow-wrap: anywhere;
}

.note {
    background: #fff5d9;
    padding: 13px;
    border-left: 4px solid #e9a500;
    margin-top: 14px;
    border-radius: 5px;
}

.success {
    background: #e5f8eb;
    color: #176b36;
    padding: 17px;
    border-radius: 8px;
    margin-top: 15px;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 15px;
}

th, td {
    padding: 11px;
    border: 1px solid #dce3ed;
    text-align: left;
}

th {
    background: #e8f0fc;
}

a {
    overflow-wrap: anywhere;
}

footer {
    background: #092b63;
    color: white;
    text-align: center;
    padding: 25px;
    margin-top: 30px;
}

@media(max-width:600px) {
    header h1 { font-size: 23px; }
    nav { gap: 12px; }
    nav a { font-size: 12px; }
    .hero, .card { padding: 18px; }
    table { font-size: 12px; }
}
</style>
</head>

<body>

<header>
    <h1>Java Application Deployment on Apache Tomcat</h1>
    <p>A Complete Step-by-Step Practical Guide Using AWS EC2, Ubuntu, Git, Maven and JDK</p>
</header>

<nav>
    <a href="#home">Home</a>
    <a href="#requirements">Requirements</a>
    <a href="#ec2">EC2 Setup</a>
    <a href="#putty">PuTTY</a>
    <a href="#install">Installation</a>
    <a href="#github">GitHub</a>
    <a href="#maven">Maven</a>
    <a href="#tomcat">Tomcat</a>
    <a href="#deploy">Deployment</a>
    <a href="#update">Update</a>
</nav>

<div class="container">

<!-- HOME -->

<section class="hero" id="home">
    <h2>Welcome to Java Application Deployment</h2>

    <p>
        This project explains how to deploy a Java Web Application
        on an Apache Tomcat server using an AWS EC2 Ubuntu instance.
    </p>

    <p>
        We will download the source code from GitHub, build the
        application using Maven, generate a WAR file, deploy it
        into Tomcat and access the application through a browser.
    </p>

    <a href="#requirements" class="button">Start Learning</a>
</section>

<!-- REQUIREMENTS -->

<section class="card" id="requirements">
    <h2>01. Required Tools and Technologies</h2>

    <table>
        <tr><th>Technology</th><th>Purpose</th></tr>
        <tr><td>AWS EC2</td><td>Provides a virtual Linux server.</td></tr>
        <tr><td>Ubuntu</td><td>Operating system for the EC2 instance.</td></tr>
        <tr><td>PuTTY</td><td>Connects to the remote Linux server.</td></tr>
        <tr><td>Git</td><td>Downloads source code from GitHub.</td></tr>
        <tr><td>JDK</td><td>Compiles and runs Java applications.</td></tr>
        <tr><td>Maven</td><td>Builds the Java application.</td></tr>
        <tr><td>Apache Tomcat</td><td>Runs the Java web application.</td></tr>
        <tr><td>Browser</td><td>Accesses the deployed website.</td></tr>
    </table>
</section>

<!-- EC2 -->

<section class="card" id="ec2">
    <h2>02. Create an AWS EC2 Instance</h2>

    <p><b>Purpose:</b> Create a virtual Ubuntu server to host our Java application.</p>

    <ol>
        <li>Log in to AWS Management Console.</li>
        <li>Search for EC2.</li>
        <li>Click Launch Instance.</li>
        <li>Enter instance name: Tomcat_Server.</li>
        <li>Select Ubuntu Server as the operating system.</li>
        <li>Select an appropriate instance type.</li>
        <li>Create or select a key pair.</li>
        <li>Configure the Security Group.</li>
        <li>Click Launch Instance.</li>
    </ol>

    <h3>Security Group Configuration</h3>

    <table>
        <tr><th>Protocol</th><th>Port</th><th>Purpose</th></tr>
        <tr><td>SSH</td><td>22</td><td>Remote server connection</td></tr>
        <tr><td>Custom TCP</td><td>8080</td><td>Tomcat application access</td></tr>
    </table>

    <div class="note">
        For SSH, allow your own IP address. Port 8080 can be opened
        to the required users. Avoid unrestricted public access unless
        needed for a temporary demonstration.
    </div>

    <div class="success">
        <b>Expected Result:</b> EC2 instance should be in Running state.
        Note down its Public IPv4 address.
    </div>
</section>

<!-- PUTTY -->

<section class="card" id="putty">
    <h2>03. Connect to EC2 Using PuTTY</h2>

    <p><b>Purpose:</b> Connect our local computer to the AWS Linux server.</p>

    <h3>Step 1: Convert the Key Pair</h3>
    <ol>
        <li>Open PuTTYgen.</li>
        <li>Click Load and select the downloaded PEM file.</li>
        <li>Click Save Private Key.</li>
        <li>Save the generated key as Tomcat_Server.ppk.</li>
    </ol>

    <h3>Step 2: Configure PuTTY</h3>
    <ol>
        <li>Open PuTTY.</li>
        <li>Enter ubuntu@YOUR_PUBLIC_IP in Host Name.</li>
        <li>Set Port to 22 and select SSH.</li>
        <li>Go to Connection → SSH → Auth → Credentials.</li>
        <li>Select your PPK private key file.</li>
        <li>Return to Session and click Open.</li>
        <li>Accept the host-key prompt if it is the expected server.</li>
        <li>Enter your key passphrase if configured.</li>
    </ol>

    <h3>Verify Server Connection</h3>
    <pre class="command">ls
pwd
whoami
hostname -i</pre>

    <p>These commands display files, current directory, username and server IP.</p>
</section>

<!-- INSTALL -->

<section class="card" id="install">
    <h2>04. Install Git, Maven and JDK</h2>

    <p><b>Purpose:</b> Prepare the Ubuntu server for Java application development and deployment.</p>

    <h3>Update Ubuntu Packages</h3>
    <pre class="command">sudo apt update -y</pre>

    <h3>Install Required Software</h3>
    <pre class="command">sudo apt install git maven default-jdk -y</pre>

    <h3>Verify Software Installation</h3>
    <pre class="command">git --version
mvn --version
java --version</pre>

    <div class="success">
        <b>Expected Result:</b> Git, Maven and Java version information
        should be displayed without errors.
    </div>
</section>

<!-- GITHUB -->

<section class="card" id="github">
    <h2>05. Download Java Application from GitHub</h2>

    <p><b>Purpose:</b> Download the application source code into our EC2 server.</p>

    <h3>Clone the Repository</h3>
    <pre class="command">git clone https://github.com/nageshvkn/iflipkart.git</pre>

    <h3>Enter the Project Directory</h3>
    <pre class="command">ls
cd iflipkart
ls</pre>

    <p>We should find the project files and the pom.xml Maven configuration file.</p>

    <h3>Check Web Application Configuration</h3>
    <pre class="command">cd src/main/webapp/WEB-INF/
ls
cat web.xml</pre>

    <p>
        The web.xml file contains deployment configuration such as
        servlet mappings and welcome page settings, if used by the project.
    </p>
</section>

<!-- MAVEN -->

<section class="card" id="maven">
    <h2>06. Build the Application Using Maven</h2>

    <p><b>Purpose:</b> Compile the Java source code and package the application into a WAR file.</p>

    <h3>Return to Project Root</h3>
    <pre class="command">cd /home/ubuntu/iflipkart</pre>

    <h3>Build the Application</h3>
    <pre class="command">mvn clean install</pre>

    <h3>Check the Generated WAR File</h3>
    <pre class="command">cd target
ls</pre>

    <p>We should find the following file:</p>

    <pre class="command">flipkart.war</pre>

    <div class="success">
        <b>Expected Result:</b> Maven successfully generates flipkart.war
        inside the target directory.
    </div>
</section>

<!-- TOMCAT -->

<section class="card" id="tomcat">
    <h2>07. Download and Install Apache Tomcat</h2>

    <p><b>Purpose:</b> Install the server that will run our Java web application.</p>

    <h3>Download Tomcat 9</h3>
    <pre class="command">cd /home/ubuntu/iflipkart

wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.123/bin/apache-tomcat-9.0.123.tar.gz</pre>

    <h3>Extract Tomcat</h3>
    <pre class="command">tar -zxvf apache-tomcat-9.0.123.tar.gz</pre>

    <h3>Enter Tomcat Directory</h3>
    <pre class="command">cd apache-tomcat-9.0.123
ls</pre>

    <p>Important directories:</p>
    <ul>
        <li>bin - Startup and shutdown scripts.</li>
        <li>conf - Configuration files.</li>
        <li>logs - Server log files.</li>
        <li>webapps - Application deployment directory.</li>
        <li>lib - Tomcat libraries.</li>
    </ul>

    <h3>Start Tomcat</h3>
    <pre class="command">cd bin
./startup.sh</pre>

    <h3>Check Tomcat Logs</h3>
    <pre class="command">tail -f ../logs/catalina.out</pre>

    <p>Press Ctrl + C to exit log monitoring without stopping Tomcat.</p>

    <div class="success">
        <b>Expected Result:</b> Tomcat should start successfully on port 8080.
    </div>
</section>

<!-- DEPLOY -->

<section class="card" id="deploy">
    <h2>08. Deploy Java Application into Tomcat</h2>

    <p><b>Purpose:</b> Copy the generated WAR file into Tomcat's webapps directory.</p>

    <h3>Step 1: Copy WAR File</h3>
    <pre class="command">cp /home/ubuntu/iflipkart/target/flipkart.war /home/ubuntu/iflipkart/apache-tomcat-9.0.123/webapps/</pre>

    <h3>Step 2: Check Deployment</h3>
    <pre class="command">cd /home/ubuntu/iflipkart/apache-tomcat-9.0.123/webapps/
ls</pre>

    <p>Tomcat should automatically extract flipkart.war into a flipkart directory if automatic deployment is enabled.</p>

    <h3>Step 3: Access Application</h3>
    <pre class="command">http://YOUR_EC2_PUBLIC_IP:8080/flipkart/</pre>

    <div class="success">
        <b>Deployment Successful!</b><br>
        Our Java application is now available through Apache Tomcat.
    </div>
</section>

<!-- UPDATE -->

<section class="card" id="update">
    <h2>09. Update JSP or HTML Files</h2>

    <p><b>Purpose:</b> Modify the website content and deploy the latest version.</p>

    <h3>Step 1: Open the JSP File</h3>
    <pre class="command">cd /home/ubuntu/iflipkart/src/main/webapp/
vim index.jsp</pre>

    <p>Press i to edit, make your changes, press Esc, type :wq and press Enter to save.</p>

    <h3>Step 2: Stop Tomcat</h3>
    <pre class="command">/home/ubuntu/iflipkart/apache-tomcat-9.0.123/bin/shutdown.sh</pre>

    <h3>Step 3: Remove Old Deployment</h3>
    <pre class="command">cd /home/ubuntu/iflipkart/apache-tomcat-9.0.123/webapps/

rm -rf flipkart flipkart.war</pre>

    <h3>Step 4: Rebuild Application</h3>
    <pre class="command">cd /home/ubuntu/iflipkart

mvn clean
mvn install</pre>

    <h3>Step 5: Copy Updated WAR File</h3>
    <pre class="command">cp target/flipkart.war apache-tomcat-9.0.123/webapps/</pre>

    <h3>Step 6: Start Tomcat Again</h3>
    <pre class="command">cd apache-tomcat-9.0.123/bin/

./startup.sh</pre>

    <h3>Step 7: Verify Updated Website</h3>
    <pre class="command">http://YOUR_EC2_PUBLIC_IP:8080/flipkart/</pre>

    <div class="success">
        <b>Update Completed!</b><br>
        The latest JSP and HTML content should now be visible.
    </div>
</section>

<!-- TROUBLESHOOTING -->

<section class="card" id="troubleshoot">
    <h2>10. Common Errors and Solutions</h2>

    <table>
        <tr><th>Error</th><th>Solution</th></tr>
        <tr><td>Connection timeout</td><td>Check Security Group port 8080.</td></tr>
        <tr><td>Java not found</td><td>Install JDK and verify Java.</td></tr>
        <tr><td>Maven not found</td><td>Install Maven.</td></tr>
        <tr><td>WAR not generated</td><td>Check Maven build errors.</td></tr>
        <tr><td>Tomcat not starting</td><td>Check catalina.out logs.</td></tr>
        <tr><td>404 error</td><td>Check application deployment and URL.</td></tr>
        <tr><td>500 error</td><td>Check application and server logs.</td></tr>
    </table>

    <h3>Useful Troubleshooting Commands</h3>
    <pre class="command">ps -ef | grep tomcat

sudo ss -lntp | grep 8080

tail -100 /home/ubuntu/iflipkart/apache-tomcat-9.0.123/logs/catalina.out</pre>
</section>

<!-- FINAL -->

<section class="hero">
    <h2>Project Completed Successfully!</h2>

    <p>
        We have successfully learned how to create an AWS EC2
        instance, connect using PuTTY, install Java development tools,
        download the source code from GitHub, build the application
        using Maven and deploy the WAR file into Apache Tomcat.
    </p>

    <h3 style="margin-top:20px;">Final Application URL</h3>

    <pre class="command">http://YOUR_EC2_PUBLIC_IP:8080/flipkart/</pre>

    <div class="success">
        <b>Technologies Used:</b><br>
        AWS EC2 | Ubuntu | Git | Maven | JDK | Apache Tomcat | JSP
    </div>
</section>

</div>

<footer>
    <h3>Java Application Deployment on Apache Tomcat</h3>
    <p>Practical Learning Project | AWS EC2 | Java Web Application</p>
    <p>Learn • Build • Deploy • Update</p>
</footer>

</body>
</html>

