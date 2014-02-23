## TODO
- Use whisper to send events to denormalizers [https://github.com/krisleech/wisper/](https://github.com/krisleech/wisper/)
- Refactoring moving competences to right places
- Add metadata to the events (user_id, version, ...)
- Create a base repository to manage the mongodb connection
- Add more spec to the server
- Consumers can inherits from a generetator. Something like : MyConsumer < ConsumerBuilder('name_of_the_channel')