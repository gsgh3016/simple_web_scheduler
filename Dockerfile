FROM python:3.9-alpine
RUN pip3 install Django
WORKDIR /
RUN django-admin startproject simple_web_scheduler
WORKDIR /simple_web_scheduler/simple_web_scheduler/
RUN sed -i "s/ALLOWED_HOSTS = \[\]/ALLOWED_HOSTS = ['*']/g" settings.py
WORKDIR /simple_web_scheduler
EXPOSE 8000
CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8000" ]