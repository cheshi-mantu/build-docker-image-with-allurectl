# And example on how to build a docker image

Docker image

- with all libs needed for your tests
- with allurectl on board

## Actions params

```yaml
      - name: Log in to GHCR
        uses: docker/login-action@v3
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.DEPLOY_TOKEN }}
```

DEPLOY_TOKEN is the end user's PAT with packages:write permission



