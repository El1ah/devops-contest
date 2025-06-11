FROM nginx:alpine

ENV DEVOPS=El1ah

COPY gen_html.sh /docker-entrypoint.d/gen_html.sh

RUN chmod +x /docker-entrypoint.d/gen_html.sh
