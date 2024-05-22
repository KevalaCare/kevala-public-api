GET http://api.kevala.local:4000/v1/employees
[BasicAuth]
{{public_key}}: {{private_key}}
HTTP 200

GET http://api.kevala.local:4000/v1/shifts?included=locations
[BasicAuth]
{{public_key}}: {{private_key}}
HTTP 200
