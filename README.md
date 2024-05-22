# kevala-public-api

## Testing

Tests are run locally using the Hurl command line tool, see https://hurl.dev/ for installation instructions and more information.

First, make sure the Kevala app is running on your local machine so that requests to http://api.kevala.local:4000/v1 will be handled. As you'll need to use the app to generate API credentials, I'd recommend starting it via `iex -S mix phx.server`.

In the app server, run the commands to generate a public/private key pair to use for the BasicAuth credentials in the Hurl requests:

```
iex(1)> org = Repo.get(Account.Organisation, 1234)
%Kevala.Account.Organisation{...}

iex(2)> Kevala.Account.ManageApiUserCommand.create_api_user(o)
{:ok,
 %{
   user: #Kevala.Account.User<
     ...
     email: "HEREISYOURPUBLICKEY",
     ...
   >,
   private_key: "HEREISYOURPRIVATEKEY"
 }}
```

The public key will be found under the `user` object's `email` field, while the private key will be clearly labeled.

Once you have your keys, update the values of `public_key` and `private_key` in the **variables** file.

Now that the app is running and your keys have been set, run the tests with the following command:

```bash
> hurl test.hurl --variables-file variables
```
