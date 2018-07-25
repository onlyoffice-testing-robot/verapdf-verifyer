FROM ruby:2.5

RUN apt-get -y update && \
    apt-get -y install default-jre \
                       unzip \
                       wget

# Install verapdf
ADD verapdf-auto-install.xml /tmp/verapdf-auto-install.xml
RUN wget http://software.verapdf.org/releases/1.12/verapdf-greenfield-1.12.1-installer.zip -O /tmp/verapdf-installer.zip
RUN unzip /tmp/verapdf-installer.zip -d /tmp/verapdf-installer
RUN java -jar /tmp/verapdf-installer/*/verapdf-izpack-installer-*.jar /tmp/verapdf-auto-install.xml
RUN rm -rf /tmp/verapdf*