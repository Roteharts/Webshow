from python:3.11.3-bullseye
WORKDIR /app
RUN apt update
RUN apt purge mysql* -y
RUN apt install mysql* -y
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install --upgrade wheel
COPY  requirements.txt ./
RUN pip install -r requirements.txt
RUN apt -y install sshpass
RUN apt -y install jq
RUN apt-get install iputils-ping -y
RUN apt -y install mailutils
RUN apt -y install bsd-mailx
RUN apt -y install sendmail
RUN apt-get install libxml2-utils -y
RUN apt -y install s-nail
ENV PYTHONUNBUFFERED=1
RUN wget https://nodejs.org/dist/v18.16.1/node-v18.16.1-linux-x64.tar.xz
RUN mv node-v18.16.1-linux-x64.tar.xz /usr/local
RUN tar -xf /usr/local/node-v18.16.1-linux-x64.tar.xz -C /usr/local
RUN ln -s /usr/local/node-v18.16.1-linux-x64/bin/npm /bin/npm
RUN ln -s /usr/local/node-v18.16.1-linux-x64/bin/node /bin/node
RUN ln -s /usr/local/node-v18.16.1-linux-x64/bin/npx /bin/npx
RUN ln -s /usr/local/node-v18.16.1-linux-x64/bin/corepack /bin/corepack
RUN npm install react react-dom


EXPOSE 7000
CMD ["python3","manage.py","runserver","0:7000"]
