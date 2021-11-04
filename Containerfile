FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN lp_flask_endpoints create-db
RUN lp_flask_endpoints populate-db
RUN lp_flask_endpoints add-user -u admin -p admin
EXPOSE 5000
CMD ["lp_flask_endpoints", "run"]
