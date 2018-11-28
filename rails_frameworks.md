## Rails Frameworks 

(Rails 3)

- __ActionMailer__: 
    - sending and receiving emails  
- __ActiveModel__: 
    - All model components broken out from Rails 2's ActiveRecord (ORM), handles validations 
- __ActiveRecord__: 
    - Associates model class to DB (e.g. `Find`, pulls data via `SQL` queries)
- __ActiveJob__: 
    - Prioritizes certain tasks to optimize user experience (e.g. load next page instead of sending verification email)
    - Supercedes gem `Sidekiq` (?)
    - Performs actions when resources bcome available (aside `*args`)
    - Scaffold 
    - Can handle clean-ups, billing-changes, mailings, test suites - essentially any group of small units running in parallel 
- __ActiveSupport__: 
    - Handles langage extensions, utilities, transversal 
- __ActiveStorage__: 
    - Handles attaching files to `ActiveRecord` models 
- __ActionCable__: 
    - Uses websockets to facilitate real-time freatures 
- __ActionController__: 
    - Handles request cycle 
- __ActionView__: provides view helpers for creating markup 
- __ActiveResource__: similar to `Record`; backed by webservice API insetad of DB

Be able to describe MVC 

## Websocket Handshakes 
- Use cases: checking if a user is online, sending notifications 
- Persistent client-server connections allow data to be sent any tie 
- Websocket handshake, `connection: upgrade`
- Replaces HTTP connection with Websocket, using same underlying TCP/IP

## Railties 
- Each component provides hooks to extend rails and/or modify initialization process 
- Needed for interacting during or after a boot 

## Elastic Search 
- Apache Lucene 
- Runs on Java, ergo cross-platform 
- Designed to be scalable - distributed architecture 
- Takes data from any source and turns into serachable format 
- HTTP REST API - communicates with search server 
- Open source 
- Near real time 

## Redis
- Written in `C`, runs in memory 
- Single server compatible
- Pre-built data structures 
    - Allows processing on DB-level instead of app 
- Modules 
- NoSQL 
    - Uses data structures instead of tables/functions/procedures 