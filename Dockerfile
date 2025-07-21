FROM denoland/deno:1.42.4


WORKDIR /app

RUN chown -R deno:deno /app

USER deno

COPY deps.ts .
RUN deno cache deps.ts

COPY . .
RUN deno cache main.ts

ENV PORT=8080

CMD ["run", "--allow-env", "--allow-net=:8080,discord.com", "main.ts"]
