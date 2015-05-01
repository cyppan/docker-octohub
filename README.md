# OctoHub: Low level Python and CLI interface to GitHub

This image is basically a wrapper around the octohub CLI command.    
Look at the repository description at: https://github.com/turnkeylinux/octohub

You can override the following environment variables when running the container:
* OCTOHUB_LOGLEVEL (default to ERROR)
* OCTOHUB_TOKEN (when you want to interact with non-public infos)

## Example uses:

**Print Octohub help**
`docker run -ti --rm octohub`

```
Syntax: octohub method uri [arg=val...]
OctoHub: GitHub API CLI

Arguments:
    method              Request HTTP method (e.g., GET, POST, DELETE, ...)
    uri                 Request URI (e.g., /user/issues)
    key=val             Request params key=value pairs (e.g., filter=assigned)

Options:
    --input <file>      Path to json encoded file for data (- for stdin)
    --max-pages <int>   Maximum pagination calls (only GET method supported)
                        For all pages, specify 0

Environment:
    OCTOHUB_TOKEN       GitHub personal access token
    OCTOHUB_LOGLEVEL    Log level debugging sent to stderr

Example usage:
    octohub GET /users/:user
    octohub GET /user/issues filter=assigned labels=bug
    octohub GET /repos/:owner/:repo/issues
    octohub GET /repos/:owner/:repo/issues sort=updated --max-pages=3
    octohub POST /repos/:owner/:repo/issues --input=issue.json
    octohub POST /user/repos --input=repo.json
    cat repo.json | octohub POST /orgs/:org/repos --input=-

http://developer.github.com/v3/
```

**Get the master HEADS commit from the public turnkeylinux/octohub repository**

`docker run -ti --rm octohub GET /repos/turnkeylinux/octohub/git/refs/heads/master`

```
{
 "url": "https://api.github.com/repos/turnkeylinux/octohub/git/refs/heads/master",
 "object": {
  "url": "https://api.github.com/repos/turnkeylinux/octohub/git/commits/49f4e1a1e399cdecc458beed2f1169875a7269f2",
  "sha": "49f4e1a1e399cdecc458beed2f1169875a7269f2",
  "type": "commit"
 },
 "ref": "refs/heads/master"
}
```


