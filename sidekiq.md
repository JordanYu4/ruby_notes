## Sidekiq
* Gem 
* Simple/efficient background processor for Ruby 
* Integrates well w/ Rails and `ActiveJob`, but works w/ Ruby per se 
* Can use dependent on dev environment 
    * `config.active_job.queue_adapter = Rails.env.production? ? :sidekiq : :async`
* Has intuitive web UI 
    * Provides easy authentication for admin-only access to background jobs 
    * `mount Sidekiq::Web => ‘/sidekiq’`
* Best practices 
    1. Make job parameters small and simple 
    2. Make job idempotent and transactional 
        * Job can be run over and over w/out having effect from first start 
    3. Embrace concurrency
        * Jobs should not be dependent on completion on other jobs 
* Runs best when all data fits in memory 
    * Use `Redis` instance not configured as cache, but as persistent store (jobs may be dropped from large queue) 
    * Use `noeviction` policy so Redis doesn’t drop `Sidekiq` data silently 
    * Use two `Redis` instances configured separately if `Redis` caching desired 
* Can be used to schedule tests